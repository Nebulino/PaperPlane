/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

/// PaperPlaneException object
/// It implements [Exception] class.
/// You can find [description] that gives a brief information of what happened.
class PaperPlaneException implements Exception {
  String description;

  PaperPlaneException({this.description});

  @override
  String toString() => '[PaperPlaneException]: ${description}';
}
