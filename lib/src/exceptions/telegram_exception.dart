/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

/// It extends [DioError] class.
/// You can find [errorCode] and [errorName] received from the Telegram Api.
class TelegramException extends DioError {
  int errorCode;
  String errorName;

  TelegramException({@required this.errorCode, @required this.errorName});

  @override
  String toString() => '[TelegramException]: ${errorCode} - ${errorName}';
}
