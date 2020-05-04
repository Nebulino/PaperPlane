/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// Represents an issue in an unspecified place.
/// The error is considered resolved when new data is added.
///
/// https://core.telegram.org/bots/api#passportelementerrorunspecified
@JsonSerializable(includeIfNull: false)
class PassportElementErrorUnspecified implements PassportElementError {
  /// Error source, must be unspecified.
  @JsonKey(name: 'source', required: true)
  @override
  EncryptedPassportElementSource source;

  /// Type of element of the user's Telegram Passport which has the issue.
  @JsonKey(name: 'type', required: true)
  @override
  EncryptedPassportElementType type;

  /// Base64-encoded element hash.
  @JsonKey(name: 'file_hash', required: true)
  String fileHash;

  /// Error message.
  @JsonKey(name: 'message', required: true)
  @override
  String message;

  PassportElementErrorUnspecified({
    this.source = EncryptedPassportElementSource.unspecified,
    this.type,
    this.fileHash,
    this.message,
  });

  factory PassportElementErrorUnspecified.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorUnspecifiedFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$PassportElementErrorUnspecifiedToJson(this);
}
