//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

part of passport;

/// Represents an issue with the selfie with a document.
/// The error is considered resolved when the file with the selfie changes.
///
/// https://core.telegram.org/bots/api#passportelementerrorselfie
@JsonSerializable(includeIfNull: false)
class PassportElementErrorSelfie implements PassportElementError {
  /// Error source, must be *selfie*.
  @JsonKey(name: 'source', required: true)
  @override
  EncryptedPassportElementSource source;

  /// The section of the user's Telegram Passport which has the issue, one of
  /// “passport”, “driver_license”, “identity_card”, “internal_passport”.
  @JsonKey(name: 'type', required: true)
  @override
  EncryptedPassportElementType type;

  /// Base64-encoded hash of the file with the selfie.
  @JsonKey(name: 'file_hash', required: true)
  String fileHash;

  /// Error message.
  @JsonKey(name: 'message', required: true)
  @override
  String message;

  PassportElementErrorSelfie({
    this.source = EncryptedPassportElementSource.selfie,
    this.type,
    this.fileHash,
    this.message,
  });

  factory PassportElementErrorSelfie.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorSelfieFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PassportElementErrorSelfieToJson(this);
}
