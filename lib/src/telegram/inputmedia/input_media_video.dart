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
  @override
  String caption;
  @override
  String media;
  @override
  String parse_mode;
  @override
  String type;
  dynamic thumb;
  int width;
  int height;
  int duration;
  bool supports_streaming;

  InputMediaVideo({
    this.type = 'video',
    this.media,
    this.caption,
    this.parse_mode,
    this.thumb,
    this.width,
    this.height,
    this.duration,
    this.supports_streaming,
  });

  factory InputMediaVideo.fromJson(Map<String, dynamic> json) =>
      _$InputMediaVideoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InputMediaVideoToJson(this);
}
