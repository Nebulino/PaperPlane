//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:paperplane/paperplane_exceptions.dart';
import 'package:paperplane/src/tools/client/telegram_response.dart';

/// It creates a custom instance to send and receive requests.
class TelegramClient {
  late final Dio _dio;

  TelegramClient({
    required String token,
    String? proxy,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.telegram.org/bot$token/',
        headers: {'Content-Type': 'multipart/form-data'},
        responseType: ResponseType.json,
      ),
    )..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
            if (options.data is FormData) {
              (options.data as FormData).fields
                ..removeWhere((entry) => entry.value.isEmpty)
                ..removeWhere((entry) => entry.value == 'null');
              return handler.next(options);
            }

            options.queryParameters.removeWhere((key, value) => value == null);
            if (options.data == null) {
              return handler.next(options);
            }

            if (options.data is Map) {
              (options.data as Map).removeWhere((key, value) => value == null);
            }

            return handler.next(options);
          },
          onResponse: (Response response, ResponseInterceptorHandler handler) {
            if (response.data is Map<String, dynamic>) {
              response.data =
                  TelegramResponse.fromJson(response.data as Map<String, dynamic>)
                      .result;
            }
            return handler.next(response);
          },
          onError: (DioException error, ErrorInterceptorHandler handler) {
            if (error.type == DioExceptionType.receiveTimeout ||
                error.type == DioExceptionType.connectionTimeout) {
              return handler.reject(
                DioException(
                  requestOptions: error.requestOptions,
                  error: TelegramClientException(description: 'Timeout Exception.'),
                ),
              );
            } else if (error.type == DioExceptionType.badResponse &&
                error.response?.data is Map<String, dynamic>) {
              var telegramErrorInfo = TelegramResponse.fromJson(
                  error.response!.data as Map<String, dynamic>);
              return handler.reject(
                DioException(
                  requestOptions: error.requestOptions,
                  error: TelegramException(
                    errorCode: telegramErrorInfo.errorCode ?? 0,
                    errorName: telegramErrorInfo.description ?? 'Unknown error',
                  ),
                ),
              );
            } else {
              return handler.next(error);
            }
          },
        ),
      );

    if (proxy != null) {
      _dio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final client = HttpClient();
          client.findProxy = (uri) => 'PROXY $proxy';
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        },
      );
    }
  }

  /// It executes a GET request.
  Future<dynamic> get({
    required String method,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      return (await _dio.get(method, queryParameters: parameters ?? {})).data;
    } on DioException catch (e) {
      if (e.error is TelegramException) {
        throw e.error!;
      }
      if (e.error is TelegramClientException) {
        throw e.error!;
      }
      rethrow;
    }
  }

  /// It executes a Multipart/form-data request.
  Future<dynamic> post({
    required String method,
    required FormData formData,
  }) async {
    try {
      return (await _dio.post(method, data: formData)).data;
    } on DioException catch (e) {
      if (e.error is TelegramException) {
        throw e.error!;
      }
      if (e.error is TelegramClientException) {
        throw e.error!;
      }
      rethrow;
    }
  }
}
