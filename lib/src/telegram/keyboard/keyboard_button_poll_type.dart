/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of keyboard;

/// This object represents type of a poll, which is allowed to be created and
/// sent when the corresponding button is pressed.
///
/// https://core.telegram.org/bots/api#keyboardbuttonpolltype
@JsonSerializable(includeIfNull: false)
class KeyboardButtonPollType {
  /// Optional. If *quiz* is passed, the user will be allowed to
  /// create only polls in the quiz mode.
  /// If *regular* is passed, only regular polls will be allowed.
  /// Otherwise, the user will be allowed to create a poll of any type.
  @JsonKey(name: 'type')
  String type;

  KeyboardButtonPollType({this.type});

  factory KeyboardButtonPollType.fromJson(Map<String, dynamic> json) =>
      _$KeyboardButtonPollTypeFromJson(json);

  Map<String, dynamic> toJson() => _$KeyboardButtonPollTypeToJson(this);
}
