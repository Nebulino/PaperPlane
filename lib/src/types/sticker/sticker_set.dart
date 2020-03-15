/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of sticker;

/// StickerSet telegram.types Class
/// https://core.telegram.org/bots/api#stickerset
@JsonSerializable()
class StickerSet {
  String name;
  String title;
  bool is_animated;
  bool contains_masks;
  List<Sticker> stickers;

  StickerSet(
      {this.name,
      this.title,
      this.is_animated,
      this.contains_masks,
      this.stickers});

  factory StickerSet.fromJson(Map<String, dynamic> json) =>
      _$StickerSetFromJson(json);

  Map<String, dynamic> toJson() => _$StickerSetToJson(this);
}
