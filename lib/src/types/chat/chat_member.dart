/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of chat;

/// ChatMember telegram.types Class
/// https://core.telegram.org/bots/api#chatmember
@JsonSerializable()
class ChatMember {
  User user;
  String status;
  String custom_title;
  int until_date;
  bool can_be_edited;
  bool can_post_messages;
  bool can_edit_messages;
  bool can_delete_messages;
  bool can_restrict_members;
  bool can_promote_members;
  bool can_change_info;
  bool can_invite_users;
  bool can_pin_messages;
  bool is_member;
  bool can_send_messages;
  bool can_send_media_messages;
  bool can_send_polls;
  bool can_send_other_messages;
  bool can_add_web_page_previews;

  ChatMember(
      {this.user,
      this.status,
      this.custom_title,
      this.until_date,
      this.can_be_edited,
      this.can_post_messages,
      this.can_edit_messages,
      this.can_delete_messages,
      this.can_restrict_members,
      this.can_promote_members,
      this.can_change_info,
      this.can_invite_users,
      this.can_pin_messages,
      this.is_member,
      this.can_send_messages,
      this.can_send_media_messages,
      this.can_send_polls,
      this.can_send_other_messages,
      this.can_add_web_page_previews});

  factory ChatMember.fromJson(Map<String, dynamic> json) =>
      _$ChatMemberFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMemberToJson(this);
}
