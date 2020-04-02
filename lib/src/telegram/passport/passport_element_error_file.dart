/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// Represents an issue with a document scan.
/// The error is considered resolved when the file with the
/// document scan changes.
///
/// https://core.telegram.org/bots/api#passportelementerrorfile
@JsonSerializable(includeIfNull: false)
class PassportElementErrorFile implements PassportElementError {
  /// Error source, must be *file*.
  @JsonKey(name: 'source', required: true)
  @override
  EncryptedPassportElementSource source;

  /// The section of the user's Telegram Passport which
  /// has the issue, one of “utility_bill”, “bank_statement”,
  /// “rental_agreement”, “passport_registration”,
  /// “temporary_registration”.
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

  PassportElementErrorFile(
      {this.source = EncryptedPassportElementSource.file, this.type, this.fileHash, this.message});

  factory PassportElementErrorFile.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorFileFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PassportElementErrorFileToJson(this);
}
