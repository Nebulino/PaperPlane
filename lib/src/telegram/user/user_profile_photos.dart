/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of user;

/// This object represent a user's profile pictures.
///
/// https://core.telegram.org/bots/api#userprofilephotos
@JsonSerializable(includeIfNull: false)
class UserProfilePhotos {
  /// Total number of profile pictures the target user has.
  @JsonKey(name: 'total_count', required: true)
  int totalCount;

  /// Requested profile pictures (in up to 4 sizes each).
  @JsonKey(name: 'photos', required: true)
  List<List<PhotoSize>> photos;

  UserProfilePhotos({this.totalCount, this.photos});

  factory UserProfilePhotos.fromJson(Map<String, dynamic> json) =>
      _$UserProfilePhotosFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfilePhotosToJson(this);
}
