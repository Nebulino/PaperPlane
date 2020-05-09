//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

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
  /// Text of the button. If none of the optional fields are used,
  /// it will be sent as a message when the button is pressed
  @JsonKey(name: 'text', required: true)
  String text;

  /// *Optional.* If *True*,
  /// the user's phone number will be sent as a
  /// contact when the button is pressed.
  /// Available in private chats only.
  @JsonKey(name: 'request_contact')
  bool requestContact;

  /// 	*Optional.* If *True*, the user's current location will
  /// be sent when the button is pressed.
  /// Available in private chats only.
  @JsonKey(name: 'request_location')
  bool requestLocation;

  /// *Optional.* If specified, the user will be asked to create a poll
  /// and send it to the bot when the button is pressed.
  /// Available in private chats only.
  @JsonKey(name: 'request_poll')
  KeyboardButtonPollType requestPoll;

  KeyboardButton({
    this.text,
    this.requestContact,
    this.requestLocation,
    this.requestPoll,
  });

  factory KeyboardButton.fromJson(Map<String, dynamic> json) =>
      _$KeyboardButtonFromJson(json);

  Map<String, dynamic> toJson() => _$KeyboardButtonToJson(this);
}
