/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

/// It implements [Exception] class.
/// You can find [description] that gives a brief error information.
class UpdaterException implements Exception {
  String description;

  UpdaterException({this.description});

  @override
  String toString() => '[UpdaterException]' + (': ${description}' ?? '');
}
