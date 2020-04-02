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
  @JsonKey(name: 'token', required: true)
  String token;

  @JsonKey(name: 'id', required: true)
  int id;

  @JsonKey(name: 'is_bot', required: true)
  bool isBot;

  @JsonKey(name: 'first_name', required: true)
  String firstName;

  @JsonKey(name: 'last_name')
  String lastName;

  @JsonKey(name: 'username')
  String username;

  @JsonKey(name: 'language_code')
  String languageCode;

  @JsonKey(name: 'can_join_groups')
  bool canJoinGroups;

  @JsonKey(name: 'can_read_all_group_messages')
  bool canReadAllGroupMessages;

  @JsonKey(name: 'supports_inline_queries')
  bool supportsInlineQueries;

  Bot(
      {this.token,
      this.id,
      this.isBot,
      this.firstName,
      this.lastName,
      this.username,
      this.languageCode,
      this.canJoinGroups,
      this.canReadAllGroupMessages,
      this.supportsInlineQueries});

  factory Bot.fromJson(Map<String, dynamic> json) => _$BotFromJson(json);

  Map<String, dynamic> toJson() => _$BotToJson(this);

  User toUser() {
    return User.fromJson(toJson());
  }
}
