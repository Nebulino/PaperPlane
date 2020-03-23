// GENERATED CODE - DO NOT MODIFY BY HAND

part of user;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    is_bot: json['is_bot'] as bool,
    first_name: json['first_name'] as String,
    last_name: json['last_name'] as String,
    username: json['username'] as String,
    language_code: json['language_code'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'is_bot': instance.is_bot,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'username': instance.username,
      'language_code': instance.language_code,
    };

UserProfilePhotos _$UserProfilePhotosFromJson(Map<String, dynamic> json) {
  return UserProfilePhotos(
    total_count: json['total_count'] as int,
    photos: (json['photos'] as List)
        ?.map((e) => (e as List)
            ?.map((e) => e == null
                ? null
                : PhotoSize.fromJson(e as Map<String, dynamic>))
            ?.toList())
        ?.toList(),
  );
}

Map<String, dynamic> _$UserProfilePhotosToJson(UserProfilePhotos instance) =>
    <String, dynamic>{
      'total_count': instance.total_count,
      'photos': instance.photos,
    };
