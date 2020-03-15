/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of message;

/// MessageEntity telegram.types Class
/// https://core.telegram.org/bots/api#messageentity
@JsonSerializable()
class MessageEntity {
  String type;
  int offset;
  int length;
  String url;
  User user;

  MessageEntity({this.type, this.offset, this.length, this.url, this.user});

  factory MessageEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MessageEntityToJson(this);
}
