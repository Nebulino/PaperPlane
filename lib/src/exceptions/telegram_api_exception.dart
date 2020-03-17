/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

/// It implements [Exception] class.
/// You can find [error_code] and [error_name] received from the Telegram Api.
class TelegramException implements Exception {
  int error_code;
  String error_name;

  TelegramException({this.error_code, this.error_name});

  @override
  String toString() => '[TelegramException]: ${error_code} - ${error_name}';
}
