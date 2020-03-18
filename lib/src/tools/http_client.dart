/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paperplane/paperplane_exceptions.dart';
import 'package:paperplane/types.dart';

/// It helps formatting the received answer.
/// The response in input is managed and returned as it should be.
class HttpResponse {
  bool valid;
  dynamic result;
  int error_code;
  String description;
  ResponseParameters responseParameters;

  HttpResponse._(
      {this.valid,
      this.result,
      this.error_code,
      this.description,
      this.responseParameters});

  factory HttpResponse.fromJson(Map<String, dynamic> response) {
    return HttpResponse._(
        valid: response['ok'],
        result: response['result'],
        error_code: response['error_code'],
        description: response['description'],
        responseParameters: response['parameters']);
  }
}

/// It's the class that manage information exchange.
class HttpClient {
  /// Http Get method
  Future<dynamic> get(var url) async => http.get(url).then((response) {
        var content = HttpResponse.fromJson(jsonDecode(response.body));
        if (content.valid) return content.result;
        return Future.error(TelegramException(
            error_code: content.error_code, error_name: content.description));
      }).catchError(
          (error) => Future.error(HttpClientException(error: '${error}')));

  /// Http Post method
  Future<dynamic> post(var url, {Map<String, dynamic> parameters}) async => http
          .post(url,
              body: parameters.map((key, value) => MapEntry(key, '${value}')))
          .then((response) {
        var content = HttpResponse.fromJson(jsonDecode(response.body));
        if (content.valid) return content.result;
        return Future.error(TelegramException(
            error_code: content.error_code, error_name: content.description));
      }).catchError(
              (error) => Future.error(HttpClientException(error: '${error}')));

  /// Http Multipart Post method
  Future<dynamic> multipartPost(var url, List<http.MultipartFile> files,
      {Map<String, dynamic> parameters}) async {
    var request = http.MultipartRequest('POST', url)
      ..headers.addAll({'Content-Type': 'multipart/form-data'})
      ..fields.addAll(parameters.map((key, value) => MapEntry(key, '${value}')))
      ..files.addAll(files);

    return request
        .send()
        .then((requests) => http.Response.fromStream(requests))
        .then((response) {
      var content = HttpResponse.fromJson(jsonDecode(response.body));
      if (content.valid) return content.result;
      return Future.error(TelegramException(
              error_code: content.error_code, error_name: content.description))
          .catchError(
              (error) => Future.error(HttpClientException(error: '${error}')));
    });
  }
}
