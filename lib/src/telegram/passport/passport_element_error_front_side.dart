/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// Represents an issue with the front side of a document.
/// The error is considered resolved when the file with
/// the front side of the document changes.
///
/// https://core.telegram.org/bots/api#passportelementerrorfrontside
@JsonSerializable(includeIfNull: false)
class PassportElementErrorFrontSide implements PassportElementError {
  /// 	Error source, must be *front_side*.
  @JsonKey(name: 'source', required: true)
  @override
  EncryptedPassportElementSource source;

  /// The section of the user's Telegram Passport which has
  /// the issue, one of “passport”, “driver_license”,
  /// “identity_card”, “internal_passport”.
  @JsonKey(name: 'type', required: true)
  @override
  EncryptedPassportElementType type;

  /// Base64-encoded hash of the file with the front side of the document.
  @JsonKey(name: 'file_hash', required: true)
  String fileHash;

  /// Error message.
  @JsonKey(name: 'message', required: true)
  @override
  String message;

  PassportElementErrorFrontSide({
    this.source = EncryptedPassportElementSource.front_side,
    this.type,
    this.fileHash,
    this.message,
  });

  factory PassportElementErrorFrontSide.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorFrontSideFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PassportElementErrorFrontSideToJson(this);
}
