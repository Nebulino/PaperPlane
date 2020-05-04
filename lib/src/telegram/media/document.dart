/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of media;

/// This object represents a general file
/// (as opposed to [photos], [voice messages] and [audio files]).
///
/// [photos]: https://core.telegram.org/bots/api#photosize
/// [voice messages]: https://core.telegram.org/bots/api#voice
/// [audio files]: https://core.telegram.org/bots/api#audio
///
/// https://core.telegram.org/bots/api#document
@JsonSerializable(includeIfNull: false)
class Document {
  /// Identifier for this file, which can be used to download or reuse the file.
  @JsonKey(name: 'file_id', required: true)
  String fileID;

  /// Unique identifier for this file, which is supposed to be the same over
  /// time and for different bots. Can't be used to download or reuse the file.
  @JsonKey(name: 'file_unique_id', required: true)
  String fileUniqueID;

  /// *Optional.* Document thumbnail as defined by sender.
  @JsonKey(name: 'thumb')
  PhotoSize thumb;

  /// *Optional.* Original filename as defined by sender.
  @JsonKey(name: 'file_name')
  String fileName;

  /// *Optional.* MIME type of the file as defined by sender.
  @JsonKey(name: 'mime_type')
  String mimeType;

  /// *Optional.* File size.
  @JsonKey(name: 'file_size')
  int file_size;

  Document({
    this.fileID,
    this.fileUniqueID,
    this.thumb,
    this.fileName,
    this.mimeType,
    this.file_size,
  });

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}
