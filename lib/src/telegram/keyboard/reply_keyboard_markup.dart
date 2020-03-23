/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of keyboard;

/// This object represents a [custom keyboard] with reply options
/// (see [Introduction to bots] for details and examples).
///
/// [custom keyboard]: https://core.telegram.org/bots#keyboards
/// [Introduction to bots]: https://core.telegram.org/bots#keyboards
///
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
