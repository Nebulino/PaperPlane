/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents the [content] of a text message to be sent as the result of an inline query.
///
/// [content]: https://core.telegram.org/bots/api#inputmessagecontent
/// https://core.telegram.org/bots/api#inputtextmessagecontent
@JsonSerializable(includeIfNull: false)
class InputTextMessageContent implements InputMessageContent {
  /// Text of the message to be sent, 1-4096 characters.
  @JsonKey(name: 'message_text', required: true)
  String messageText;

  /// *Optional.*
  /// Send *[Markdown]* or *[HTML]*,
  /// if you want Telegram apps to show [bold, italic,
  /// fixed-width text or inline URLs] in the media caption.
  ///
  /// [Markdown]: https://core.telegram.org/bots/api#markdown-style
  /// [HTML]: https://core.telegram.org/bots/api#html-style
  /// [bold, italic, fixed-width text or inline URLs]: https://core.telegram.org/bots/api#formatting-options
  @JsonKey(name: 'parse_mode')
  ParseMode parseMode;

  /// *Optional.* Disables link previews for links in the sent message.
  @JsonKey(name: 'disable_web_page_preview')
  bool disableWebPagePreview;

  InputTextMessageContent({
    this.messageText,
    this.parseMode,
    this.disableWebPagePreview,
  });

  factory InputTextMessageContent.fromJson(Map<String, dynamic> json) =>
      _$InputTextMessageContentFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InputTextMessageContentToJson(this);
}
