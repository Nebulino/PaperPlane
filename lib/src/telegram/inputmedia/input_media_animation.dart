/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inputmedia;

/// Represents an animation file
/// (GIF or H.264/MPEG-4 AVC video without sound) to be sent.
///
/// https://core.telegram.org/bots/api#inputmediaanimation
@JsonSerializable()
class InputMediaAnimation implements InputMedia {
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

  InputMediaAnimation(
      {this.type = 'animation',
      this.media,
      this.thumb,
      this.caption,
      this.parse_mode,
      this.width,
      this.height,
      this.duration});

  factory InputMediaAnimation.fromJson(Map<String, dynamic> json) =>
      _$InputMediaAnimationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InputMediaAnimationToJson(this);
}
