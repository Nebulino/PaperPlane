/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a link to an animated GIF file.
/// By default, this animated GIF file will be
/// sent by the user with optional caption.
/// Alternatively,
/// you can use *input_message_content* to
/// send a message with the specified content
/// instead of the animation.
///
/// https://core.telegram.org/bots/api#inlinequeryresultgif
@JsonSerializable(includeIfNull: false)
class InlineQueryResultGif implements InlineQueryResult {
  /// Type of the result, must be *gif*.
  @JsonKey(name: 'type', required: true)
  @override
  String type;

  /// Unique identifier for this result, 1-64 bytes.
  @JsonKey(name: 'id', required: true)
  @override
  String id;

  /// A valid URL for the GIF file. File size must not exceed 1MB.
  @JsonKey(name: 'gif_url')
  String gifUrl;

  /// Optional. Width of the GIF.
  @JsonKey(name: 'gif_width')
  int gifWidth;

  /// Optional. Height of the GIF.
  @JsonKey(name: 'gif_height')
  int gifHeight;

  /// Optional. Duration of the GIF.
  @JsonKey(
      name: 'gif_duration',
      fromJson: _durationFromTelegramSeconds,
      toJson: _durationToTelegramSeconds)
  Duration gifDuration;

  /// URL of the static thumbnail for the result (jpeg or gif).
  @JsonKey(name: 'thumb_url', required: true)
  String thumbUrl;

  /// Optional. Title for the result.
  @JsonKey(name: 'title')
  String title;

  /// Optional. Caption of the GIF file to be sent,
  /// 0-1024 characters after entities parsing.
  @JsonKey(name: 'caption')
  String caption;

  /// Optional.
  /// Send *[Markdown]* or *[HTML]*,
  /// if you want Telegram apps to show [bold, italic,
  /// fixed-width text or inline URLs] in the media caption.
  ///
  /// [Markdown]: https://core.telegram.org/bots/api#markdown-style
  /// [HTML]: https://core.telegram.org/bots/api#html-style
  /// [bold, italic, fixed-width text or inline URLs]: https://core.telegram.org/bots/api#formatting-options
  @JsonKey(name: 'parse_mode')
  ParseMode parseMode;

  /// Optional. [Inline keyboard] attached to the message.
  ///
  /// [Inline keyboard]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
  @JsonKey(name: 'reply_markup')
  InlineKeyboardMarkup replyMarkup;

  /// Optional. Content of the message to be sent instead of the GIF animation.
  @JsonKey(name: 'input_message_content')
  InputMessageContent inputMessageContent;

  InlineQueryResultGif(
      {this.type = 'gif',
      this.id,
      this.gifUrl,
      this.gifWidth,
      this.gifHeight,
      this.gifDuration,
      this.thumbUrl,
      this.title,
      this.caption,
      this.parseMode,
      this.replyMarkup,
      this.inputMessageContent});

  factory InlineQueryResultGif.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultGifFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultGifToJson(this);

  /// Helper: converts into a Duration type from
  /// a int received from Telegram API.
  static Duration _durationFromTelegramSeconds(int seconds) =>
      seconds == null ? null : Duration(seconds: seconds);

  /// Helper: converts into a Duration type into
  /// a int to be sent to Telegram API.
  static int _durationToTelegramSeconds(Duration duration) =>
      duration?.inSeconds;
}
