//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

part of media;

/// This object represents a phone contact.
///
/// https://core.telegram.org/bots/api#contact
@JsonSerializable(includeIfNull: false)
class Contact {
  /// Contact's phone number.
  @JsonKey(name: 'phone_number', required: true)
  String phoneNumber;

  /// Contact's first name.
  @JsonKey(name: 'first_name', required: true)
  String firstName;

  /// *Optional.* Contact's last name.
  @JsonKey(name: 'last_name')
  String lastName;

  /// *Optional.* Contact's user identifier in Telegram.
  @JsonKey(name: 'user_id')
  int userID;

  /// *Optional.* Additional data about the contact in the form of a [vCard].
  ///
  /// [vCard]: https://en.wikipedia.org/wiki/VCard
  @JsonKey(name: 'vcard')
  String vcard;

  Contact({
    this.phoneNumber,
    this.firstName,
    this.lastName,
    this.userID,
    this.vcard,
  });

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
