/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of chat;

/// This object represents a chat photo.
///
/// https://core.telegram.org/bots/api#chatphoto
@JsonSerializable(includeIfNull: false)
class ChatPhoto {
  /// File identifier of small (160x160) chat photo.
  /// This file_id can be used only for photo download and only for as
  /// long as the photo is not changed.
  @JsonKey(name: 'small_file_id', required: true)
  String smallFileID;

  /// Unique file identifier of small (160x160) chat photo,
  /// which is supposed to be the same over time and for different bots.
  /// Can't be used to download or reuse the file.
  @JsonKey(name: 'small_file_unique_id', required: true)
  String smallFileUniqueID;

  /// File identifier of big (640x640) chat photo.
  /// This file_id can be used only for photo download and only for as
  /// long as the photo is not changed.
  @JsonKey(name: 'big_file_id', required: true)
  String bigFileID;

  /// Unique file identifier of big (640x640) chat photo,
  /// which is supposed to be the same over time and for different bots.
  /// Can't be used to download or reuse the file.
  @JsonKey(name: 'big_file_unique_id', required: true)
  String bigFileUniqueID;

  ChatPhoto({
    this.smallFileID,
    this.smallFileUniqueID,
    this.bigFileID,
    this.bigFileUniqueID,
  });

  factory ChatPhoto.fromJson(Map<String, dynamic> json) =>
      _$ChatPhotoFromJson(json);

  Map<String, dynamic> toJson() => _$ChatPhotoToJson(this);
}
