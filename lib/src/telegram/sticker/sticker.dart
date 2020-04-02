/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of sticker;

/// This object represents a sticker.
///
/// https://core.telegram.org/bots/api#sticker
@JsonSerializable(includeIfNull: false)
class Sticker {
  /// Identifier for this file, which can be used to download or reuse the file.
  @JsonKey(name: 'file_id', required: true)
  String fileID;

  /// Unique identifier for this file, which is supposed to be the same over
  /// time and for different bots. Can't be used to download or reuse the file.
  @JsonKey(name: 'file_unique_id', required: true)
  String fileUniqueID;

  /// Sticker width.
  @JsonKey(name: 'width', required: true)
  int width;

  /// Sticker height.
  @JsonKey(name: 'height', required: true)
  int height;

  /// True, if the sticker is [animated].
  ///
  /// [animated]: https://telegram.org/blog/animated-stickers
  @JsonKey(name: 'is_animated', required: true)
  bool isAnimated;

  /// Optional. Sticker thumbnail in the .WEBP or .JPG format.
  @JsonKey(name: 'thumb')
  PhotoSize thumb;

  /// Optional. Emoji associated with the sticker.
  @JsonKey(name: 'emoji')
  String emoji;

  /// Optional. Name of the sticker set to which the sticker belongs.
  @JsonKey(name: 'set_name')
  String setName;

  /// Optional. For mask stickers, the position where the mask should be placed.
  @JsonKey(name: 'mask_position')
  MaskPosition maskPosition;

  /// Optional. File size.
  @JsonKey(name: 'file_size')
  int fileSize;

  Sticker(
      {this.fileID,
      this.fileUniqueID,
      this.width,
      this.height,
      this.isAnimated,
      this.thumb,
      this.emoji,
      this.setName,
      this.maskPosition,
      this.fileSize});

  factory Sticker.fromJson(Map<String, dynamic> json) =>
      _$StickerFromJson(json);

  Map<String, dynamic> toJson() => _$StickerToJson(this);
}
