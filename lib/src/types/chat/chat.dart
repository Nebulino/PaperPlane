/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of chat;

/// This object represents a chat.
///
/// https://core.telegram.org/bots/api#chat
@JsonSerializable()
class Chat {
  int id;
  String type;
  String title;
  String username;
  String first_name;
  String last_name;
  bool all_members_are_administrators;
  ChatPhoto photo;
  String description;
  String invite_link;
  Message pinned_message;
  ChatPermissions permissions;
  int slow_mode_delay;
  String sticker_set_name;
  bool can_set_sticker_set;

  Chat(
      {this.id,
      this.type,
      this.title,
      this.username,
      this.first_name,
      this.last_name,
      this.all_members_are_administrators,
      this.photo,
      this.description,
      this.invite_link,
      this.pinned_message,
      this.permissions,
      this.slow_mode_delay,
      this.sticker_set_name,
      this.can_set_sticker_set});

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  Map<String, dynamic> toJson() => _$ChatToJson(this);
}
