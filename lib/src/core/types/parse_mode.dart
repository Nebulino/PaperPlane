/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

/// A list of parsing mode types for telegram.
class ParseMode {
  String _mode;

  ParseMode._(this._mode);

  factory ParseMode.MarkDown() {
    return ParseMode._('MARKDOWN');
  }

  factory ParseMode.MarkDownV2() {
    return ParseMode._('MARKDOWNV2');
  }

  factory ParseMode.HTML() {
    return ParseMode._('HTML');
  }

  @override
  String toString() => _mode;
}