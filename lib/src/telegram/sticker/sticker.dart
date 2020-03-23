/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of sticker;

/// This object represents a sticker.
///
/// https://core.telegram.org/bots/api#sticker
@JsonSerializable()
class Sticker {
  String file_id;
  String file_unique_id;
  int width;
  int height;
  bool is_animated;
  PhotoSize thumb;
  String emoji;
  String set_name;
  MaskPosition mask_position;
  int file_size;

  Sticker(
      {this.file_id,
      this.file_unique_id,
      this.width,
      this.height,
      this.is_animated,
      this.thumb,
      this.emoji,
      this.set_name,
      this.mask_position,
      this.file_size});

  factory Sticker.fromJson(Map<String, dynamic> json) =>
      _$StickerFromJson(json);

  Map<String, dynamic> toJson() => _$StickerToJson(this);
}
