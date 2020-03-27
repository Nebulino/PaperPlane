/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

/// It extends [DioError] class.
/// You can find [error_code] and [error_name] received from the Telegram Api.
class TelegramException extends DioError {
  int error_code;
  String error_name;

  TelegramException({@required this.error_code, @required this.error_name});

  @override
  String toString() => '[TelegramException]: ${error_code} - ${error_name}';
}
