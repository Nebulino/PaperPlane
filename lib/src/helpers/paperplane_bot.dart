/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:paperplane/telegram.dart';

/// This is "a bridge" that connects Bot concept and User (telegram.types) concept.
/// This object represents a Telegram user or bot.
class Bot {
  String token;
  int id;
  bool is_bot;
  String first_name;
  String last_name;
  String username;
  String language_code;
  bool can_join_groups;
  bool can_read_all_group_messages;
  bool supports_inline_queries;

  Bot(
      {this.token,
      this.id,
      this.is_bot,
      this.first_name,
      this.last_name,
      this.username,
      this.language_code,
      this.can_join_groups,
      this.can_read_all_group_messages,
      this.supports_inline_queries});

  factory Bot.fromData(Map<String, dynamic> bot_data) {
    return Bot(
        token: bot_data['token'] as String,
        id: bot_data['id'] as int,
        is_bot: bot_data['is_bot'] as bool,
        first_name: bot_data['first_name'] as String,
        last_name: bot_data['last_name'] as String,
        username: bot_data['username'] as String,
        language_code: bot_data['language_code'] as String,
        can_join_groups: bot_data['can_join_groups'],
        can_read_all_group_messages: bot_data['can_read_all_group_messages'],
        supports_inline_queries: bot_data['supports_inline_queries']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'token': token,
      'id': id,
      'is_bot': is_bot,
      'first_name': first_name,
      'last_name': last_name,
      'username': username,
      'language_code': language_code,
      'can_join_groups': can_join_groups,
      'can_read_all_group_messages': can_read_all_group_messages,
      'supports_inline_queries': supports_inline_queries
    };
  }

  User toUser() {
    return User.fromJson(toJson());
  }
}
