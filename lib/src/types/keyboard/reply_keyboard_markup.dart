/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of keyboard;

/// ReplyKeyboardMarkup telegram.types Class
/// https://core.telegram.org/bots/api#replykeyboardmarkup
@JsonSerializable()
class ReplyKeyboardMarkup implements ReplyMarkup {
  List<List<KeyboardButton>> keyboard;
  bool resize_keyboard;
  bool one_time_keyboard;
  bool selective;

  ReplyKeyboardMarkup(
      {this.keyboard,
      this.resize_keyboard,
      this.one_time_keyboard,
      this.selective});

  factory ReplyKeyboardMarkup.fromJson(Map<String, dynamic> json) =>
      _$ReplyKeyboardMarkupFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ReplyKeyboardMarkupToJson(this);
}
