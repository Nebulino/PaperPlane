/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inputmedia;

/// Represents an audio file to be treated as
/// music to be sent.
///
/// https://core.telegram.org/bots/api#inputmediaaudio
@JsonSerializable(includeIfNull: false)
class InputMediaAudio implements InputMedia {
  @override
  String caption;
  @override
  String media;
  @override
  String parse_mode;
  @override
  String type;
  dynamic thumb;
  int duration;
  String performer;
  String title;

  InputMediaAudio(
      {this.type = 'audio',
      this.media,
      this.thumb,
      this.caption,
      this.parse_mode,
      this.duration,
      this.performer,
      this.title});

  factory InputMediaAudio.fromJson(Map<String, dynamic> json) =>
      _$InputMediaAudioFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InputMediaAudioToJson(this);
}
