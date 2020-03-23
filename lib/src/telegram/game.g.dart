// GENERATED CODE - DO NOT MODIFY BY HAND

part of game;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallbackGame _$CallbackGameFromJson(Map<String, dynamic> json) {
  return CallbackGame();
}

Map<String, dynamic> _$CallbackGameToJson(CallbackGame instance) =>
    <String, dynamic>{};

Game _$GameFromJson(Map<String, dynamic> json) {
  return Game(
    title: json['title'] as String,
    description: json['description'] as String,
    photo: (json['photo'] as List)
        ?.map((e) =>
            e == null ? null : PhotoSize.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    text: json['text'] as String,
    text_entities: (json['text_entities'] as List)
        ?.map((e) => e == null
            ? null
            : MessageEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    animation: json['animation'] == null
        ? null
        : Animation.fromJson(json['animation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'photo': instance.photo,
      'text': instance.text,
      'text_entities': instance.text_entities,
      'animation': instance.animation,
    };

GameHighScore _$GameHighScoreFromJson(Map<String, dynamic> json) {
  return GameHighScore(
    position: json['position'] as int,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    score: json['score'] as int,
  );
}

Map<String, dynamic> _$GameHighScoreToJson(GameHighScore instance) =>
    <String, dynamic>{
      'position': instance.position,
      'user': instance.user,
      'score': instance.score,
    };
