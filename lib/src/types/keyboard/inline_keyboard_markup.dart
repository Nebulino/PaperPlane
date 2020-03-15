/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of keyboard;

/// InlineKeyboardMarkup telegram.types Class
/// https://core.telegram.org/bots/api#inlinekeyboardmarkup
@JsonSerializable()
class InlineKeyboardMarkup implements ReplyMarkup {
  List<List<InlineKeyboardButton>> inline_keyboard;

  InlineKeyboardMarkup({this.inline_keyboard});

  factory InlineKeyboardMarkup.fromJson(Map<String, dynamic> json) =>
      _$InlineKeyboardMarkupFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineKeyboardMarkupToJson(this);
}
