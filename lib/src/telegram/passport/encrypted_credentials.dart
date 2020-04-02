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
@JsonSerializable(includeIfNull: false)
class EncryptedCredentials {
  /// Base64-encoded encrypted JSON-serialized data with
  /// unique user's payload, data hashes and secrets required
  /// for EncryptedPassportElement decryption and authentication.
  @JsonKey(name: 'data', required: true)
  String data;

  /// Base64-encoded data hash for data authentication.
  @JsonKey(name: 'hash', required: true)
  String hash;

  /// Base64-encoded secret, encrypted with the bot's public RSA key,
  /// required for data decryption.
  @JsonKey(name: 'secret', required: true)
  String secret;

  EncryptedCredentials({this.data, this.hash, this.secret});

  factory EncryptedCredentials.fromJson(Map<String, dynamic> json) =>
      _$EncryptedCredentialsFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptedCredentialsToJson(this);
}
