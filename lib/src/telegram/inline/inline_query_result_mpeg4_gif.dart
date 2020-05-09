//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

part of inline;

/// Represents a link to a video animation
/// (H.264/MPEG-4 AVC video without sound).
/// By default, this animated MPEG-4 file
/// will be sent by the user with optional caption.
/// Alternatively,
/// you can use *input_message_content* to
/// send a message with the specified content
/// instead of the animation.
///
/// https://core.telegram.org/bots/api#inlinequeryresultmpeg4gif
@JsonSerializable(includeIfNull: false)
class InlineQueryResultMpeg4Gif implements InlineQueryResult {
  /// Type of the result, must be *mpeg4_gif*.
  @JsonKey(name: 'type', required: true)
  @override
  String type;

  /// Unique identifier for this result, 1-64 bytes.
  @JsonKey(name: 'id', required: true)
  @override
  String id;

  /// A valid URL for the MP4 file. File size must not exceed 1MB.
  @JsonKey(name: 'mpeg4_url')
  String mpeg4Url;

  /// *Optional.* Video width.
  @JsonKey(name: 'mpeg4_width')
  int mpeg4Width;

  /// *Optional.* Video height.
  @JsonKey(name: 'mpeg4_height')
  int mpeg4Height;

  /// *Optional.* Video duration.
  @JsonKey(
      name: 'mpeg4_duration',
      fromJson: _durationFromTelegramSeconds,
      toJson: _durationToTelegramSeconds)
  Duration mpeg4Duration;

  /// URL of the static thumbnail (jpeg or gif) for the result.
  @JsonKey(name: 'thumb_url')
  String thumbUrl;

  /// *Optional.* Title for the result.
  @JsonKey(name: 'title')
  String title;

  /// *Optional.* Caption of the MPEG-4 file to be sent,
  /// 0-1024 characters after entities parsing
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

  /// *Optional.* Content of the message to be sent instead of the video animation.
  @JsonKey(name: 'input_message_content')
  InputMessageContent inputMessageContent;

  InlineQueryResultMpeg4Gif({
    this.type = 'mpeg4_gif',
    this.id,
    this.mpeg4Url,
    this.mpeg4Width,
    this.mpeg4Height,
    this.mpeg4Duration,
    this.thumbUrl,
    this.title,
    this.caption,
    this.parseMode,
    this.replyMarkup,
    this.inputMessageContent,
  });

  factory InlineQueryResultMpeg4Gif.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultMpeg4GifFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultMpeg4GifToJson(this);

  /// Helper: converts into a Duration type from
  /// a int received from Telegram API.
  static Duration _durationFromTelegramSeconds(int seconds) =>
      seconds == null ? null : Duration(seconds: seconds);

  /// Helper: converts into a Duration type into
  /// a int to be sent to Telegram API.
  static int _durationToTelegramSeconds(Duration duration) =>
      duration?.inSeconds;
}
