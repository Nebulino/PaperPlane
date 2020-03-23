/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// Contains data required for decrypting and authenticating
/// [EncryptedPassportElement].
/// See the [Telegram Passport Documentation]
/// for a complete description of the data decryption
/// and authentication processes.
///
/// [EncryptedPassportElement]: https://core.telegram.org/bots/api#encryptedpassportelement
/// [Telegram Passport Documentation]: https://core.telegram.org/passport#receiving-information
///
/// https://core.telegram.org/bots/api#encryptedcredentials
@JsonSerializable()
class EncryptedCredentials {
  String data;
  String hash;
  String secret;

  EncryptedCredentials({this.data, this.hash, this.secret});

  factory EncryptedCredentials.fromJson(Map<String, dynamic> json) =>
      _$EncryptedCredentialsFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptedCredentialsToJson(this);
}
