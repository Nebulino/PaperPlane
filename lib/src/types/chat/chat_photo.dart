/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of chat;

/// This object represents a chat photo.
///
/// https://core.telegram.org/bots/api#chatphoto
@JsonSerializable()
class ChatPhoto {
  String small_file_id;
  String small_file_unique_id;
  String big_file_id;
  String big_file_unique_id;

  ChatPhoto(
      {this.small_file_id,
      this.small_file_unique_id,
      this.big_file_id,
      this.big_file_unique_id});

  factory ChatPhoto.fromJson(Map<String, dynamic> json) =>
      _$ChatPhotoFromJson(json);

  Map<String, dynamic> toJson() => _$ChatPhotoToJson(this);
}
