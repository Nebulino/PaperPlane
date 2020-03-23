/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// Contains information about documents
/// or other Telegram Passport elements shared with the bot by the user.
///
/// https://core.telegram.org/bots/api#encryptedpassportelement
@JsonSerializable()
class EncryptedPassportElement {
  String type;
  String data;
  String phone_number;
  String email;
  List<PassportFile> files;
  PassportFile front_side;
  PassportFile reverse_side;
  PassportFile selfie;
  List<PassportFile> translation;
  String hash;

  EncryptedPassportElement(
      {this.type,
      this.data,
      this.phone_number,
      this.email,
      this.files,
      this.front_side,
      this.reverse_side,
      this.selfie,
      this.translation,
      this.hash});

  factory EncryptedPassportElement.fromJson(Map<String, dynamic> json) =>
      _$EncryptedPassportElementFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptedPassportElementToJson(this);
}
