// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paperplane_bot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bot _$BotFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id', 'is_bot', 'first_name']);
  return Bot(
    token: json['token'] as String?,
    id: (json['id'] as num?)?.toInt(),
    isBot: json['is_bot'] as bool?,
    firstName: json['first_name'] as String?,
    lastName: json['last_name'] as String?,
    username: json['username'] as String?,
    languageCode: json['language_code'] as String?,
    canJoinGroups: json['can_join_groups'] as bool?,
    canReadAllGroupMessages: json['can_read_all_group_messages'] as bool?,
    supportsInlineQueries: json['supports_inline_queries'] as bool?,
  );
}

Map<String, dynamic> _$BotToJson(Bot instance) => <String, dynamic>{
  'token': ?instance.token,
  'id': ?instance.id,
  'is_bot': ?instance.isBot,
  'first_name': ?instance.firstName,
  'last_name': ?instance.lastName,
  'username': ?instance.username,
  'language_code': ?instance.languageCode,
  'can_join_groups': ?instance.canJoinGroups,
  'can_read_all_group_messages': ?instance.canReadAllGroupMessages,
  'supports_inline_queries': ?instance.supportsInlineQueries,
};
