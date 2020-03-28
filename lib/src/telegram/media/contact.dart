/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of media;

/// This object represents a phone contact.
///
/// https://core.telegram.org/bots/api#contact
@JsonSerializable(includeIfNull: false)
class Contact {
  String phone_number;
  String first_name;
  String last_name;
  int user_id;
  String vcard;

  Contact(
      {this.phone_number,
      this.first_name,
      this.last_name,
      this.user_id,
      this.vcard});

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
