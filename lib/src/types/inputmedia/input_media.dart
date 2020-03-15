/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inputmedia;

/// InputMedia telegram.types Class
/// https://core.telegram.org/bots/api#inputmedia
@JsonSerializable()
class InputMedia {
  String type;
  String media;
  String caption;
  String parse_mode;

  InputMedia({this.type, this.media, this.caption, this.parse_mode});

  factory InputMedia.fromJson(Map<String, dynamic> json) =>
      _$InputMediaFromJson(json);

  Map<String, dynamic> toJson() => _$InputMediaToJson(this);
}
