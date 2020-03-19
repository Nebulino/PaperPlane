/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of keyboard;

/// This object represents an [inline keyboard] that appears right next to the message it belongs to.
///
/// **Note:** This will only work in Telegram versions released after 9 April, 2016. Older clients
/// will display *unsupported message*.
///
/// [inline keyboard]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
///
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
