/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of user;

/// UserProfilePhotos telegram.types Class
/// https://core.telegram.org/bots/api#userprofilephotos
@JsonSerializable()
class UserProfilePhotos {
  int total_count;
  List<List<PhotoSize>> photos;

  UserProfilePhotos({this.total_count, this.photos});

  factory UserProfilePhotos.fromJson(Map<String, dynamic> json) =>
      _$UserProfilePhotosFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfilePhotosToJson(this);
}
