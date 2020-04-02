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
  /// Sticker set name.
  @JsonKey(name: 'name', required: true)
  String name;

  /// Sticker set title.
  @JsonKey(name: 'title', required: true)
  String title;

  /// True, if the sticker set contains [animated stickers].
  ///
  /// [animated stickers]: https://telegram.org/blog/animated-stickers
  @JsonKey(name: 'is_animated', required: true)
  bool isAnimated;

  /// True, if the sticker set contains masks.
  @JsonKey(name: 'contains_masks', required: true)
  bool containsMasks;

  /// List of all set stickers.
  @JsonKey(name: 'stickers', required: true)
  List<Sticker> stickers;

  /// Optional. Sticker set thumbnail in the .WEBP or .TGS format.
  @JsonKey(name: 'thumb')
  PhotoSize thumb;

  StickerSet(
      {this.name,
      this.title,
      this.isAnimated,
      this.containsMasks,
      this.stickers,
      this.thumb});

  factory StickerSet.fromJson(Map<String, dynamic> json) =>
      _$StickerSetFromJson(json);

  Map<String, dynamic> toJson() => _$StickerSetToJson(this);
}
