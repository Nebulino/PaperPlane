/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of keyboard;

/// ReplyKeyboardRemove telegram.types Class
/// https://core.telegram.org/bots/api#replykeyboardremove
@JsonSerializable()
class ReplyKeyboardRemove implements ReplyMarkup {
  bool remove_keyboard;
  bool selective;

  ReplyKeyboardRemove({this.remove_keyboard, this.selective});

  factory ReplyKeyboardRemove.fromJson(Map<String, dynamic> json) =>
      _$ReplyKeyboardRemoveFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ReplyKeyboardRemoveToJson(this);
}
