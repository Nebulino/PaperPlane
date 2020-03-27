/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of media;

/// This object represents a venue.
///
/// https://core.telegram.org/bots/api#video
@JsonSerializable(includeIfNull: false)
class Video {
  String file_id;
  String file_unique_id;
  int width;
  int height;
  int duration;
  PhotoSize thumb;
  String mime_type;
  int file_size;

  Video(
      {this.file_id,
      this.file_unique_id,
      this.width,
      this.height,
      this.duration,
      this.thumb,
      this.mime_type,
      this.file_size});

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);
}
