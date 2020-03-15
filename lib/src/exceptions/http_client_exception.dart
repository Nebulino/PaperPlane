/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

/// HttpClientException object
/// It implements [Exception] class.
/// You can find [error] that gives a brief error information.
class HttpClientException implements Exception {
  String error;

  HttpClientException({this.error});

  @override
  String toString() => '[HttpClientException]' + (': ${error}' ?? '');
}
