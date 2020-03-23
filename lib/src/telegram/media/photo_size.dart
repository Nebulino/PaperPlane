/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of media;

/// This object represents one size of a photo or a
/// [file] / [sticker] thumbnail.
///
/// [file]: https://core.telegram.org/bots/api#document
/// [sticker]: https://core.telegram.org/bots/api#sticker
///
/// https://core.telegram.org/bots/api#photosize
@JsonSerializable()
class PhotoSize {
  String file_id;
  String file_unique_id;
  int width;
  int height;
  int file_size;

  PhotoSize(
      {this.file_id,
      this.file_unique_id,
      this.width,
      this.height,
      this.file_size});

  factory PhotoSize.fromJson(Map<String, dynamic> json) =>
      _$PhotoSizeFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoSizeToJson(this);
}
