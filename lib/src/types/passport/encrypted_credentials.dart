/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// EncryptedCredentials telegram.types Class
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
