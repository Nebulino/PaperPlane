/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of keyboard;

/// This object represents one button of an inline keyboard.
/// You **must** use exactly one of the optional fields.
///
/// https://core.telegram.org/bots/api#inlinekeyboardbutton
@JsonSerializable()
class InlineKeyboardButton {
  String text;
  String url;
  LoginUrl login_url;
  String callback_data;
  String switch_inline_query;
  String switch_inline_query_current_chat;
  CallbackGame callback_game;
  bool pay;

  InlineKeyboardButton(
      {this.text,
      this.url,
      this.login_url,
      this.callback_data,
      this.switch_inline_query,
      this.switch_inline_query_current_chat,
      this.callback_game,
      this.pay});

  factory InlineKeyboardButton.fromJson(Map<String, dynamic> json) =>
      _$InlineKeyboardButtonFromJson(json);

  Map<String, dynamic> toJson() => _$InlineKeyboardButtonToJson(this);
}
