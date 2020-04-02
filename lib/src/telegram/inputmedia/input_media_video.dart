/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inputmedia;

/// Represents a video to be sent.
///
/// https://core.telegram.org/bots/api#inputmediavideo
@JsonSerializable(includeIfNull: false)
class InputMediaVideo implements InputMedia {
  /// Type of the result, must be *video*.
  @JsonKey(name: 'type', required: true)
  @override
  String type;

  /// File to send.
  /// Pass a file_id to send a file that exists on
  /// the Telegram servers (recommended),
  /// pass an HTTP URL for Telegram to get a file from the Internet,
  /// or pass “attach://<file_attach_name>” to upload a new
  /// one using multipart/form-data under <file_attach_name> name.
  /// [More info on Sending Files »].
  ///
  /// [More info on Sending Files »]: https://core.telegram.org/bots/api#sending-files
  @JsonKey(name: 'media', required: true)
  @override
  dynamic media;

  /// Optional.
  /// Thumbnail of the file sent; can be ignored if thumbnail
  /// generation for the file is supported server-side.
  /// The thumbnail should be in JPEG format and less than 200 kB in size.
  /// A thumbnail‘s width and height should not exceed 320.
  /// Ignored if the file is not uploaded using multipart/form-data.
  /// Thumbnails can’t be reused and can be only uploaded as a new file,
  /// so you can pass “attach://<file_attach_name>”
  /// if the thumbnail was uploaded using multipart/form-data under
  /// <file_attach_name>.
  /// [More info on Sending Files »].
  ///
  /// [More info on Sending Files »]: https://core.telegram.org/bots/api#sending-files
  @JsonKey(name: 'thumb')
  dynamic thumb;

  /// Optional. Caption of the video to be sent,
  /// 0-1024 characters after entities parsing.
  @JsonKey(name: 'caption')
  @override
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
  @override
  String parseMode;

  /// Optional. Video width.
  @JsonKey(name: 'width')
  int width;

  /// Optional. Video height.
  @JsonKey(name: 'height')
  int height;

  /// Optional. Video duration.
  @JsonKey(
      name: 'duration',
      fromJson: _durationFromTelegramSeconds,
      toJson: _durationToTelegramSeconds)
  Duration duration;

  /// Optional.
  /// Pass True, if the uploaded video is suitable for streaming.
  @JsonKey(name: 'supports_streaming', required: true)
  bool supportsStreaming;

  InputMediaVideo(
      {this.type = 'video',
      this.media,
      this.thumb,
      this.caption,
      this.parseMode,
      this.width,
      this.height,
      this.duration,
      this.supportsStreaming});

  factory InputMediaVideo.fromJson(Map<String, dynamic> json) =>
      _$InputMediaVideoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InputMediaVideoToJson(this);

  /// Helper: converts into a Duration type from
  /// a int received from Telegram API.
  static Duration _durationFromTelegramSeconds(int seconds) =>
      Duration(seconds: seconds);

  /// Helper: converts into a Duration type into
  /// a int to be sent to Telegram API.
  static int _durationToTelegramSeconds(Duration duration) =>
      duration?.inSeconds;
}
