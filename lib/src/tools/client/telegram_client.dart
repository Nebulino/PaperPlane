/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:paperplane/paperplane_exceptions.dart';
import 'package:paperplane/src/tools/client/telegram_response.dart';

/// It creates a custom instance to send and receive requests.
class TelegramClient {
  Dio _dio;

  TelegramClient({@required String token, String proxy}) {
    _dio = Dio(
      BaseOptions(
          baseUrl: 'https://api.telegram.org/bot$token/',
          headers: {'Content-Type': 'multipart/form-data'},
          responseType: ResponseType.json),
    )..interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
        if (options.data is FormData) {
          (options.data as FormData).fields
            ..removeWhere((map_entry) => map_entry.value == null)
            ..removeWhere((map_entry) => map_entry.value == 'null');
          return options;
        }

        options.queryParameters?.removeWhere((key, value) => value == null);
        if (options.data == null) {
          return options;
        }

        if (options.data is Map) {
          (options.data as Map).removeWhere((key, value) => value == null);
        }

        return options;
      }, onResponse: (response) {
        return TelegramResponse.fromJson(response.data).result;
      }, onError: (error) {
        if (error.type == DioErrorType.RECEIVE_TIMEOUT ||
            error.type == DioErrorType.CONNECT_TIMEOUT) {
          return TelegramClientException(description: 'Timeout Exception.');
          // or retry?
        } else if (error.type == DioErrorType.RESPONSE) {
          var telegramErrorInfo =
              TelegramResponse.fromJson(error.response.data);
          return TelegramException(
              errorCode: telegramErrorInfo.errorCode,
              errorName: telegramErrorInfo.description);
        } else {
          return error;
        }
      }));

    if (proxy != null) {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.findProxy = (uri) => 'PROXY ${proxy}';
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  /// It executes a GET request.
  Future<dynamic> get(
      {@required String method, Map<String, dynamic> parameters}) async {
    return (await _dio.get(method, queryParameters: parameters ?? {})).data;
  }

  /// It executes a Multipart/form-data request.
  Future<dynamic> post(
      {@required String method, @required FormData formData}) async {
    return (await _dio.post(method, data: formData)).data;
  }
}
