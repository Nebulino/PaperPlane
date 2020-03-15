/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inputmedia;

/// InputMediaPhoto telegram.types Class
/// https://core.telegram.org/bots/api#inputmediaphoto
@JsonSerializable()
class InputMediaPhoto implements InputMedia {
  @override
  String caption;
  @override
  String media;
  @override
  String parse_mode;
  @override
  String type;

  InputMediaPhoto(
      {this.type = 'photo', this.media, this.caption, this.parse_mode});

  factory InputMediaPhoto.fromJson(Map<String, dynamic> json) =>
      _$InputMediaPhotoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InputMediaPhotoToJson(this);
}
