/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of keyboard;

/// This object represents type of a poll, which is allowed to be created and
/// sent when the corresponding button is pressed.
///
/// https://core.telegram.org/bots/api#keyboardbuttonpolltype
@JsonSerializable()
class KeyboardButtonPollType {
  String type;

  KeyboardButtonPollType({this.type});

  factory KeyboardButtonPollType.fromJson(Map<String, dynamic> json) =>
      _$KeyboardButtonPollTypeFromJson(json);

  Map<String, dynamic> toJson() => _$KeyboardButtonPollTypeToJson(this);
}
