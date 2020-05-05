/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// Represents an issue with one of the files that constitute the translation of a document.
/// The error is considered resolved when the file changes.
///
/// https://core.telegram.org/bots/api#passportelementerrortranslationfile
@JsonSerializable(includeIfNull: false)
class PassportElementErrorTranslationFile implements PassportElementError {
  /// Error source, must be *translation_file*.
  @JsonKey(name: 'source', required: true)
  @override
  EncryptedPassportElementSource source;

  /// Type of element of the user's Telegram Passport
  /// which has the issue, one of “passport”, “driver_license”,
  /// “identity_card”, “internal_passport”, “utility_bill”,
  /// “bank_statement”, “rental_agreement”,
  /// “passport_registration”, “temporary_registration”.
  @JsonKey(name: 'type', required: true)
  @override
  EncryptedPassportElementType type;

  /// Base64-encoded file hash.
  @JsonKey(name: 'file_hash', required: true)
  String fileHash;

  /// Error message.
  @JsonKey(name: 'message', required: true)
  @override
  String message;

  PassportElementErrorTranslationFile({
    this.source = EncryptedPassportElementSource.translation_file,
    this.type,
    this.fileHash,
    this.message,
  });

  factory PassportElementErrorTranslationFile.fromJson(
          Map<String, dynamic> json) =>
      _$PassportElementErrorTranslationFileFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$PassportElementErrorTranslationFileToJson(this);
}
