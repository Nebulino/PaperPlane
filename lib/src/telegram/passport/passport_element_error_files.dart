/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// Represents an issue with a list of scans.
/// The error is considered resolved when the list of files
/// containing the scans changes.
///
/// https://core.telegram.org/bots/api#passportelementerrorfiles
@JsonSerializable(includeIfNull: false)
class PassportElementErrorFiles implements PassportElementError {
  /// Error source, must be *files*.
  @JsonKey(name: 'source', required: true)
  @override
  EncryptedPassportElementSource source;

  /// The section of the user's Telegram Passport which has
  /// the issue, one of “utility_bill”, “bank_statement”,
  /// “rental_agreement”, “passport_registration”,
  /// “temporary_registration”.
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

  PassportElementErrorFiles(
      {this.source = EncryptedPassportElementSource.files, this.type, this.fileHashes, this.message});

  factory PassportElementErrorFiles.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorFilesFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PassportElementErrorFilesToJson(this);
}
