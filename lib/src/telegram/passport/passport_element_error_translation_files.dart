/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// Represents an issue with the translated version of a document.
/// The error is considered resolved when a file with the document
/// translation change.
///
/// https://core.telegram.org/bots/api#passportelementerrortranslationfiles
@JsonSerializable(includeIfNull: false)
class PassportElementErrorTranslationFiles implements PassportElementError {
  /// Error source, must be *translation_files*.
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

  /// List of base64-encoded file hashes.
  @JsonKey(name: 'file_hashes', required: true)
  List<String> fileHashes;

  /// Error message.
  @JsonKey(name: 'message', required: true)
  @override
  String message;

  PassportElementErrorTranslationFiles(
      {this.source = EncryptedPassportElementSource.translation_files,
      this.type,
      this.fileHashes,
      this.message});

  factory PassportElementErrorTranslationFiles.fromJson(
          Map<String, dynamic> json) =>
      _$PassportElementErrorTranslationFilesFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$PassportElementErrorTranslationFilesToJson(this);
}
