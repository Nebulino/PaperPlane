/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of keyboard;

/// KeyboardButton telegram.types Class
/// https://core.telegram.org/bots/api#keyboardbutton
@JsonSerializable()
class KeyboardButton {
  String text;
  bool request_contact;
  bool request_location;

  KeyboardButton({this.text, this.request_contact, this.request_location});

  factory KeyboardButton.fromJson(Map<String, dynamic> json) =>
      _$KeyboardButtonFromJson(json);

  Map<String, dynamic> toJson() => _$KeyboardButtonToJson(this);
}
