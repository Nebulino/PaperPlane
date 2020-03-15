/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of core;

/// CallbackQuery telegram.types Class
/// https://core.telegram.org/bots/api#callbackquery
@JsonSerializable()
class CallbackQuery {
  String id;
  User from;
  Message message;
  String inline_message_id;
  String chat_instance;
  String data;
  String game_short_name;

  CallbackQuery(
      {this.id,
      this.from,
      this.message,
      this.inline_message_id,
      this.chat_instance,
      this.data,
      this.game_short_name});

  factory CallbackQuery.fromJson(Map<String, dynamic> json) =>
      _$CallbackQueryFromJson(json);

  Map<String, dynamic> toJson() => _$CallbackQueryToJson(this);
}
