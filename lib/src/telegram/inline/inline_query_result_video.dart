/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a link to a page containing an embedded
/// video player or a video file.
/// By default, this video file will be sent by the
/// user with an optional caption.
/// Alternatively,
/// you can use *input_message_content* to send a
/// message with the specified content instead of the video.
///
/// If an InlineQueryResultVideo message contains
/// an embedded video (e.g., YouTube),
/// you **must** replace its content using
/// *input_message_content*.
///
/// https://core.telegram.org/bots/api#inlinequeryresultvideo
@JsonSerializable(includeIfNull: false)
class InlineQueryResultVideo implements InlineQueryResult {
  /// Type of the result, must be *video*.
  @JsonKey(name: 'type', required: true)
  @override
  String type;

  /// Unique identifier for this result, 1-64 bytes.
  @JsonKey(name: 'id', required: true)
  @override
  String id;

  /// A valid URL for the embedded video player or video file.
  @JsonKey(name: 'video_url', required: true)
  String videoUrl;

  /// Mime type of the content of video url, “text/html” or “video/mp4”.
  @JsonKey(name: 'mime_type', required: true)
  String mimeType;

  /// URL of the thumbnail (jpeg only) for the video.
  @JsonKey(name: 'thumb_url', required: true)
  String thumbUrl;

  /// Title for the result.
  @JsonKey(name: 'title', required: true)
  String title;

  /// Optional. Caption of the video to be sent,
  /// 0-1024 characters after entities parsing
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
  String parseMode;

  /// Optional. Video width.
  @JsonKey(name: 'video_width')
  int videoWidth;

  /// Optional. Video height.
  @JsonKey(name: 'video_height')
  int videoHeight;

  /// Optional. Video duration in seconds.
  @JsonKey(
      name: 'video_duration',
      fromJson: _durationFromTelegramSeconds,
      toJson: _durationToTelegramSeconds)
  Duration videoDuration;

  /// Optional. Short description of the result.
  @JsonKey(name: 'description')
  String description;

  /// Optional. [Inline keyboard] attached to the message.
  ///
  /// [Inline keyboard]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
  @JsonKey(name: 'reply_markup')
  InlineKeyboardMarkup replyMarkup;

  /// Optional.
  /// Content of the message to be sent instead of the video.
  /// This field is **required** if InlineQueryResultVideo
  /// is used to send an HTML-page as a result
  /// (e.g., a YouTube video).
  @JsonKey(name: 'input_message_content')
  InputMessageContent inputMessageContent;

  InlineQueryResultVideo(
      {this.id,
      this.type = 'video',
      this.videoUrl,
      this.mimeType,
      this.thumbUrl,
      this.title,
      this.caption,
      this.parseMode,
      this.videoWidth,
      this.videoHeight,
      this.videoDuration,
      this.description,
      this.replyMarkup,
      this.inputMessageContent});

  factory InlineQueryResultVideo.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultVideoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultVideoToJson(this);

  /// Helper: converts into a Duration type from
  /// a int received from Telegram API.
  static Duration _durationFromTelegramSeconds(int seconds) =>
      Duration(seconds: seconds);

  /// Helper: converts into a Duration type into
  /// a int to be sent to Telegram API.
  static int _durationToTelegramSeconds(Duration duration) =>
      duration?.inSeconds;
}
