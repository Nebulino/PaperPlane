//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

part of media;

/// This object represents one size of a photo or a
/// [file] / [sticker] thumbnail.
///
/// [file]: https://core.telegram.org/bots/api#document
/// [sticker]: https://core.telegram.org/bots/api#sticker
///
/// https://core.telegram.org/bots/api#photosize
@JsonSerializable(includeIfNull: false)
class PhotoSize {
  /// Identifier for this file,
  /// which can be used to download or reuse the file.
  @JsonKey(name: 'file_id', required: true)
  String fileID;

  /// Unique identifier for this file, which is supposed to be the same over
  /// time and for different bots. Can't be used to download or reuse the file.
  @JsonKey(name: 'file_unique_id', required: true)
  String fileUniqueID;

  /// Photo width.
  @JsonKey(name: 'width', required: true)
  int width;

  /// Photo height.
  @JsonKey(name: 'height', required: true)
  int height;

  /// *Optional.* File size.
  @JsonKey(name: 'file_size')
  int fileSize;

  PhotoSize({
    this.fileID,
    this.fileUniqueID,
    this.width,
    this.height,
    this.fileSize,
  });

  factory PhotoSize.fromJson(Map<String, dynamic> json) =>
      _$PhotoSizeFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoSizeToJson(this);
}
