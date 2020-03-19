/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of media;

/// This object represents an audio file to be treated as music by the
/// Telegram clients.
///
/// https://core.telegram.org/bots/api#audio
@JsonSerializable()
class Audio {
  String file_id;
  String file_unique_id;
  int duration;
  String performer;
  String title;
  String mime_type;
  int file_size;
  PhotoSize thumb;

  Audio(
      {this.file_id,
      this.file_unique_id,
      this.duration,
      this.performer,
      this.title,
      this.mime_type,
      this.file_size,
      this.thumb});

  factory Audio.fromJson(Map<String, dynamic> json) => _$AudioFromJson(json);

  Map<String, dynamic> toJson() => _$AudioToJson(this);
}
