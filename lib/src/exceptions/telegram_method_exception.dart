/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

/// It implements [Exception] class.
/// You can find [description] that gives a description of what happened
/// inside the called Telegram method.
class TelegramMethodException implements Exception {
  String description;

  TelegramMethodException(this.description);

  @override
  String toString() => '[TelegramMethodException]: ${description}';
}
