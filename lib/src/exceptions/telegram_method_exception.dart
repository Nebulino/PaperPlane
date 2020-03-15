/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

/// TelegramMethodException object
/// It implements [Exception] class.
/// You can find [description] that gives a description of what happened
/// inside the Telegram method.
class TelegramMethodException implements Exception {
  String description;

  TelegramMethodException(this.description);

  @override
  String toString() => '[TelegramMethodException]: ${description}';
}
