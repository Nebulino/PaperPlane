// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallbackGame _$CallbackGameFromJson(Map<String, dynamic> json) =>
    CallbackGame();

Map<String, dynamic> _$CallbackGameToJson(CallbackGame instance) =>
    <String, dynamic>{};

Game _$GameFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'title',
      'description',
      'photo',
      'text',
      'text_entities',
      'animation',
    ],
  );
  return Game(
    title: json['title'] as String?,
    description: json['description'] as String?,
    photo: (json['photo'] as List<dynamic>?)
        ?.map((e) => PhotoSize.fromJson(e as Map<String, dynamic>))
        .toList(),
    text: json['text'] as String?,
    textEntities: (json['text_entities'] as List<dynamic>?)
        ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
        .toList(),
    animation: json['animation'] == null
        ? null
        : Animation.fromJson(json['animation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
  'title': ?instance.title,
  'description': ?instance.description,
  'photo': ?instance.photo,
  'text': ?instance.text,
  'text_entities': ?instance.textEntities,
  'animation': ?instance.animation,
};

GameHighScore _$GameHighScoreFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['position', 'user', 'score']);
  return GameHighScore(
    position: (json['position'] as num?)?.toInt(),
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    score: (json['score'] as num?)?.toInt(),
  );
}

Map<String, dynamic> _$GameHighScoreToJson(GameHighScore instance) =>
    <String, dynamic>{
      'position': ?instance.position,
      'user': ?instance.user,
      'score': ?instance.score,
    };
