/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a link to a voice message stored
/// on the Telegram servers.
/// By default, this voice message will be sent by the user.
/// Alternatively, you can use *input_message_content*
/// to send a message with the specified content
/// instead of the voice message.
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedvoice
@JsonSerializable(includeIfNull: false)
class InlineQueryResultCachedVoice implements InlineQueryResult {
  /// Type of the result, must be *voice*.
  @JsonKey(name: 'type', required: true)
  @override
  String type;

  /// Unique identifier for this result, 1-64 bytes.
  @JsonKey(name: 'id', required: true)
  @override
  String id;

  /// A valid file identifier for the voice message.
  @JsonKey(name: 'voice_file_id', required: true)
  String voiceFileID;

  /// Voice message title.
  @JsonKey(name: 'title')
  String title;

  /// *Optional.* Caption,
  /// 0-1024 characters after entities parsing.
  @JsonKey(name: 'caption')
  String caption;

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

  /// *Optional.* [Inline keyboard] attached to the message.
  ///
  /// [Inline keyboard]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
  @JsonKey(name: 'reply_markup')
  InlineKeyboardMarkup replyMarkup;

  /// *Optional.* Content of the message to be sent instead of the voice message.
  @JsonKey(name: 'input_message_content')
  InputMessageContent inputMessageContent;

  InlineQueryResultCachedVoice({
    this.type = 'voice',
    this.id,
    this.voiceFileID,
    this.title,
    this.caption,
    this.parseMode,
    this.replyMarkup,
    this.inputMessageContent,
  });

  factory InlineQueryResultCachedVoice.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedVoiceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultCachedVoiceToJson(this);
}
