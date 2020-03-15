/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of chat;

/// ChatPermissions telegram.types Class
/// https://core.telegram.org/bots/api#chatpermissions
@JsonSerializable()
class ChatPermissions {
  bool can_send_messages;
  bool can_send_media_messages;
  bool can_send_polls;
  bool can_send_other_messages;
  bool can_add_web_page_previews;
  bool can_change_info;
  bool can_invite_users;
  bool can_pin_messages;

  ChatPermissions(
      {this.can_send_messages,
      this.can_send_media_messages,
      this.can_send_polls,
      this.can_send_other_messages,
      this.can_add_web_page_previews,
      this.can_change_info,
      this.can_invite_users,
      this.can_pin_messages});

  factory ChatPermissions.fromJson(Map<String, dynamic> json) =>
      _$ChatPermissionsFromJson(json);

  Map<String, dynamic> toJson(Map<String, dynamic> json) =>
      _$ChatPermissionsToJson(this);
}
