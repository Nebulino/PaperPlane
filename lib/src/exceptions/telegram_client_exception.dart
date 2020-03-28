/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:dio/dio.dart';

/// It extends [DioError] class.
/// You can find [description] that gives a brief error information.
class TelegramClientException extends DioError {
  String description;

  TelegramClientException({this.description});

  @override
  String toString() => '[HttpClientException]' + (': ${description}' ?? '');
}
