/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents the [content] of a text message to be sent as the result of an inline query.
///
/// [content]: https://core.telegram.org/bots/api#inputmessagecontent
/// https://core.telegram.org/bots/api#inputtextmessagecontent
@JsonSerializable()
class InputTextMessageContent implements InputMessageContent {
  String message_text;
  String parse_mode;
  bool disable_web_page_preview;

  InputTextMessageContent(
      {this.message_text, this.parse_mode, this.disable_web_page_preview});

  factory InputTextMessageContent.fromJson(Map<String, dynamic> json) =>
      _$InputTextMessageContentFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InputTextMessageContentToJson(this);
}
