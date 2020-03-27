/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of keyboard;

/// This object represents one button of the reply keyboard.
/// For simple text buttons String can be used instead of
/// this object to specify text of the button.
/// Optional fields are mutually exclusive.
///
/// **Note:** request_contact and request_location options
/// will only work in Telegram versions
/// released after 9 April, 2016.
///
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#keyboardbutton
@JsonSerializable(includeIfNull: false)
class KeyboardButton {
  String text;
  bool request_contact;
  bool request_location;
  KeyboardButtonPollType request_poll;

  KeyboardButton(
      {this.text,
      this.request_contact,
      this.request_location,
      this.request_poll});

  factory KeyboardButton.fromJson(Map<String, dynamic> json) =>
      _$KeyboardButtonFromJson(json);

  Map<String, dynamic> toJson() => _$KeyboardButtonToJson(this);
}
