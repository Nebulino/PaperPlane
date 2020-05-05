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
  /// Unique token for a bot.
  @JsonKey(name: 'token')
  String token;

  /// Unique identifier for this bot.
  @JsonKey(name: 'id', required: true)
  int id;

  /// True, if this user is a bot.
  @JsonKey(name: 'is_bot', required: true)
  bool isBot;

  /// User‘s or bot’s first name.
  @JsonKey(name: 'first_name', required: true)
  String firstName;

  /// Optional. User‘s or bot’s last name.
  @JsonKey(name: 'last_name')
  String lastName;

  /// Optional. User‘s or bot’s username.
  @JsonKey(name: 'username')
  String username;

  /// Optional. [IETF language tag] of the user's language
  ///
  /// [IETF language tag]: https://en.wikipedia.org/wiki/IETF_language_tag
  @JsonKey(name: 'language_code')
  String languageCode;

  /// Optional. True, if the bot can be invited to groups.
  /// Returned only in [getMe].
  @JsonKey(name: 'can_join_groups')
  bool canJoinGroups;

  /// Optional.
  /// True, if [privacy mode] is disabled for the bot. Returned only in [getMe].
  ///
  /// [privacy mode]: https://core.telegram.org/bots#privacy-mode
  @JsonKey(name: 'can_read_all_group_messages')
  bool canReadAllGroupMessages;

  /// Optional. True, if the bot supports inline queries.
  /// Returned only in [getMe].
  @JsonKey(name: 'supports_inline_queries')
  bool supportsInlineQueries;

  Bot({
    this.token,
    this.id,
    this.isBot,
    this.firstName,
    this.lastName,
    this.username,
    this.languageCode,
    this.canJoinGroups,
    this.canReadAllGroupMessages,
    this.supportsInlineQueries,
  });

  factory Bot.fromJson(Map<String, dynamic> json) => _$BotFromJson(json);

  Map<String, dynamic> toJson() => _$BotToJson(this);

  User toUser() {
    return User.fromJson(toJson());
  }
}
