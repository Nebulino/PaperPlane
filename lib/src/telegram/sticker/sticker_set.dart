/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of sticker;

/// This object represents a sticker set.
///
/// https://core.telegram.org/bots/api#stickerset
@JsonSerializable(includeIfNull: false)
class StickerSet {
  String name;
  String title;
  bool is_animated;
  bool contains_masks;
  List<Sticker> stickers;
  PhotoSize thumb;

  StickerSet(
      {this.name,
      this.title,
      this.is_animated,
      this.contains_masks,
      this.stickers,
      this.thumb});

  factory StickerSet.fromJson(Map<String, dynamic> json) =>
      _$StickerSetFromJson(json);

  Map<String, dynamic> toJson() => _$StickerSetToJson(this);
}
