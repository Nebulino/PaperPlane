/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of message;

/// This object represents one special entity in a
/// text message. For example, hashtags, usernames, URLs, etc.
///
/// https://core.telegram.org/bots/api#messageentity
@JsonSerializable(includeIfNull: false)
class MessageEntity {
  String type;
  int offset;
  int length;
  String url;
  User user;
  String language;

  MessageEntity(
      {this.type,
      this.offset,
      this.length,
      this.url,
      this.user,
      this.language});

  factory MessageEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MessageEntityToJson(this);
}
