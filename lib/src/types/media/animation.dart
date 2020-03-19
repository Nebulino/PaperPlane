/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of media;

/// This object represents an animation file
/// (GIF or H.264/MPEG-4 AVC video without sound).
///
/// https://core.telegram.org/bots/api#animation
@JsonSerializable()
class Animation {
  String file_id;
  String file_unique_id;
  int width;
  int height;
  int duration;
  PhotoSize thumb;
  String file_name;
  String mime_type;
  int file_size;

  Animation(
      {this.file_id,
      this.file_unique_id,
      this.width,
      this.height,
      this.duration,
      this.thumb,
      this.file_name,
      this.mime_type,
      this.file_size});

  factory Animation.fromJson(Map<String, dynamic> json) =>
      _$AnimationFromJson(json);

  Map<String, dynamic> toJson() => _$AnimationToJson(this);
}
