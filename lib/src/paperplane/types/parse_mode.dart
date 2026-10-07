//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

/// A list of parsing mode types for telegram.
enum ParseMode {
  MARKDOWN,
  MARKDOWNV2,
  HTML,
}

extension ParseModeExtension on ParseMode {
  String get mode => switch (this) {
        ParseMode.MARKDOWN => 'MARKDOWN',
        ParseMode.MARKDOWNV2 => 'MARKDOWNV2',
        ParseMode.HTML => 'HTML',
      };
}
