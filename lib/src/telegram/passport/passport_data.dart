/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// Contains information about Telegram Passport
/// data shared with the bot by the user.
///
/// https://core.telegram.org/bots/api#passportdata
@JsonSerializable(includeIfNull: false)
class PassportData {
  List<EncryptedPassportElement> data;
  EncryptedCredentials credentials;

  PassportData({this.data, this.credentials});

  factory PassportData.fromJson(Map<String, dynamic> json) =>
      _$PassportDataFromJson(json);

  Map<String, dynamic> toJson() => _$PassportDataToJson(this);
}
