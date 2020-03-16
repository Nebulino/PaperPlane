/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

/// Poll type Class
/// A list of poll types for telegram.
class PollType {
  String _type;

  PollType._(this._type);

  factory PollType.Quiz() {
    return PollType._('quiz');
  }

  factory PollType.Regular() {
    return PollType._('regular');
  }

  @override
  String toString() => _type;
}
