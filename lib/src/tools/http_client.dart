/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paperplane/paperplane_exceptions.dart';
import 'package:paperplane/types.dart';

/// HttpResponse object
/// It helps formatting the received answer.
/// [valid] Helps distinguishing between an answer with a result or with an error
/// [result] If valid is true, the content needs to be transformed into a telegram object
/// [error_code] Only if valid is false
/// [description] If valid is false, it contains the description
/// [responseParameters] It contains parameters => view ResponseParameters class
/// [HttpResponse.fromJson(response)] It creates a HttpResponse object from a json
/// [HttpResponse.fromJson(response)] It creates a HttpResponse object with just information about the error
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

/// HttpClient Class
/// It's the class that manage information exchange.
class HttpClient {
  /// Http Get method
  /// Input:
  /// [url] Can be String or URI, it's the request url (required)
  /// [returns] Can be a dynamic result or an error => view HttpClientResponse, TelegramException
  Future<dynamic> get(var url) async => http.get(url).then((response) {
        var content = HttpResponse.fromJson(jsonDecode(response.body));
        if (content.valid) return content.result;
        return Future.error(TelegramException(
            error_code: content.error_code, error_name: content.description));
      }).catchError(
          (error) => Future.error(HttpClientException(error: '${error}')));

  /// Http Post method
  /// Input:
  /// [url] Can be String or URI, it's the request url (required)
  /// [parameters] It's a Map object of parameters => sent as json
  /// [returns] Can be a dynamic result or an error => view HttpClientResponse, TelegramException
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
  /// Input:
  /// [url] Can be String or URI, it's the request url (required)
  /// [files] A list of multipartFile (required)
  /// [parameters] It's a Map object of parameters => sent as json
  /// [returns] Can be a dynamic result or an error => view HttpClientResponse, TelegramException
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
