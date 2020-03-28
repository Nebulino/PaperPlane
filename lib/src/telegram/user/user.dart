/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of user;

/// This object represents a Telegram user or bot.
///
/// https://core.telegram.org/bots/api#user
@JsonSerializable(includeIfNull: false)
class User {
  int id;
  bool is_bot;
  String first_name;
  String last_name;
  String username;
  String language_code;

  User(
      {this.id,
      this.is_bot,
      this.first_name,
      this.last_name,
      this.username,
      this.language_code});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
