/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of keyboard;

/// ForceReply telegram.types Class
/// https://core.telegram.org/bots/api#forcereply
@JsonSerializable()
class ForceReply implements ReplyMarkup {
  bool force_reply;
  bool selective;

  ForceReply({this.force_reply, this.selective});

  factory ForceReply.fromJson(Map<String, dynamic> json) =>
      _$ForceReplyFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ForceReplyToJson(this);
}
