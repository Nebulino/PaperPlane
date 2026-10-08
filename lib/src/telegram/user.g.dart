// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id', 'is_bot', 'first_name']);
  return User(
    id: (json['id'] as num?)?.toInt(),
    isBot: json['is_bot'] as bool?,
    firstName: json['first_name'] as String?,
    lastName: json['last_name'] as String?,
    username: json['username'] as String?,
    languageCode: json['language_code'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': ?instance.id,
  'is_bot': ?instance.isBot,
  'first_name': ?instance.firstName,
  'last_name': ?instance.lastName,
  'username': ?instance.username,
  'language_code': ?instance.languageCode,
};

UserProfilePhotos _$UserProfilePhotosFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['total_count', 'photos']);
  return UserProfilePhotos(
    totalCount: (json['total_count'] as num?)?.toInt(),
    photos: (json['photos'] as List<dynamic>?)
        ?.map(
          (e) => (e as List<dynamic>)
              .map((e) => PhotoSize.fromJson(e as Map<String, dynamic>))
              .toList(),
        )
        .toList(),
  );
}

Map<String, dynamic> _$UserProfilePhotosToJson(UserProfilePhotos instance) =>
    <String, dynamic>{
      'total_count': ?instance.totalCount,
      'photos': ?instance.photos,
    };
