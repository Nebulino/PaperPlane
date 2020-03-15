/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of keyboard;

/// ReplyMarkup telegram.types Class
/// https://core.telegram.org/bots/api#replymarkup
@JsonSerializable()
class ReplyMarkup {
  ReplyMarkup();

  factory ReplyMarkup.fromJson(Map<String, dynamic> json) =>
      _$ReplyMarkupFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyMarkupToJson(this);
}
