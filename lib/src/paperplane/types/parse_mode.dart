/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

/// A list of parsing mode types for telegram.
enum ParseMode { MARKDOWN, MARKDOWNV2, HTML }

extension ParseModeExtension on ParseMode {
  String get mode {
    switch (this) {
      case ParseMode.MARKDOWN:
        return 'MARKDOWN';
      case ParseMode.MARKDOWNV2:
        return 'MARKDOWNV2';
      case ParseMode.HTML:
        return 'HTML';
      default:
        return null;
    }
  }
}
