/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// Represents an issue with the reverse side of a document.
/// The error is considered resolved when the file with reverse
/// side of the document changes.
///
/// https://core.telegram.org/bots/api#passportelementerrorreverseside
@JsonSerializable(includeIfNull: false)
class PassportElementErrorReverseSide implements PassportElementError {
  /// Error source, must be *reverse_side*.
  @JsonKey(name: 'source', required: true)
  @override
  EncryptedPassportElementSource source;

  /// Type of the result, must be *gif*
  @JsonKey(name: 'type', required: true)
  @override
  EncryptedPassportElementType type;

  /// Error message.
  @JsonKey(name: 'message', required: true)
  @override
  String message;

  /// Error source, must be reverse_side.
  @JsonKey(name: 'file_hash', required: true)
  String file_hash;

  PassportElementErrorReverseSide({
    this.source = EncryptedPassportElementSource.reverse_side,
    this.type,
    this.file_hash,
    this.message,
  });

  factory PassportElementErrorReverseSide.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorReverseSideFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$PassportElementErrorReverseSideToJson(this);
}
