/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents the [content] of a contact message to be sent
/// as the result of an inline query.
///
/// [content]: https://core.telegram.org/bots/api#inputmessagecontent
///
/// https://core.telegram.org/bots/api#inputcontactmessagecontent
@JsonSerializable(includeIfNull: false)
class InputContactMessageContent implements InputMessageContent {
  /// Contact's phone number.
  @JsonKey(name: 'phone_number')
  String phoneNumber;

  /// Contact's first name.
  @JsonKey(name: 'first_name')
  String firstName;

  /// *Optional.* Contact's last name.
  @JsonKey(name: 'last_name')
  String lastName;

  /// *Optional.* Additional data about
  /// the contact in the form of a [vCard], 0-2048 bytes.
  ///
  /// [vCard]: https://en.wikipedia.org/wiki/VCard
  @JsonKey(name: 'vcard')
  String vcard;

  InputContactMessageContent({
    this.phoneNumber,
    this.firstName,
    this.lastName,
    this.vcard,
  });

  factory InputContactMessageContent.fromJson(Map<String, dynamic> json) =>
      _$InputContactMessageContentFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InputContactMessageContentToJson(this);
}
