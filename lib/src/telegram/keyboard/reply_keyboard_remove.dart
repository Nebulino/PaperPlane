/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of keyboard;

/// Upon receiving a message with this object,
/// Telegram clients will remove the current custom keyboard
/// and display the default letter-keyboard.
/// By default, custom keyboards are displayed until a new
/// keyboard is sent by a bot.
/// An exception is made for one-time keyboards that are
/// hidden immediately after the user presses a
/// button (see [ReplyKeyboardMarkup]).
///
/// [ReplyKeyboardMarkup]: https://core.telegram.org/bots/api#replykeyboardmarkup
///
/// https://core.telegram.org/bots/api#replykeyboardremove
@JsonSerializable(includeIfNull: false)
class ReplyKeyboardRemove implements ReplyMarkup {
  bool remove_keyboard;
  bool selective;

  ReplyKeyboardRemove({this.remove_keyboard, this.selective});

  factory ReplyKeyboardRemove.fromJson(Map<String, dynamic> json) =>
      _$ReplyKeyboardRemoveFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ReplyKeyboardRemoveToJson(this);
}
