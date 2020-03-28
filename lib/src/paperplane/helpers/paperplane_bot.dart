/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:json_annotation/json_annotation.dart';
import 'package:paperplane/telegram.dart';

part 'paperplane_bot.g.dart';

/// This is "a bridge" that connects [Bot] concept and [User] (telegram object)
/// concept.
/// This object represents a Telegram [Bot], a [User] with more information.
@JsonSerializable(includeIfNull: false)
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

  factory Bot.fromJson(Map<String, dynamic> json) => _$BotFromJson(json);

  Map<String, dynamic> toJson() => _$BotToJson(this);

  User toUser() {
    return User.fromJson(toJson());
  }
}
