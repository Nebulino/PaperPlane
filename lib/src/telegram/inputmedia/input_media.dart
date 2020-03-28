/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inputmedia;

/// This object represents the content of a media
/// message to be sent. It should be one of
/// * [InputMediaAnimation](https://core.telegram.org/bots/api#inputmediaanimation)
/// * [InputMediaDocument](https://core.telegram.org/bots/api#inputmediadocument)
/// * [InputMediaAudio](https://core.telegram.org/bots/api#inputmediaaudio)
/// * [InputMediaPhoto](https://core.telegram.org/bots/api#inputmediaphoto)
/// * [InputMediaVideo](https://core.telegram.org/bots/api#inputmediavideo)
///
/// https://core.telegram.org/bots/api#inputmedia
@JsonSerializable(includeIfNull: false)
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
