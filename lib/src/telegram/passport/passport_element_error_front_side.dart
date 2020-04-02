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
  @override
  String source;

  /// Type of the result, must be *gif*
  @JsonKey(name: 'type', required: true)
  @override
  String type;
  @override
  String message;
  String file_hash;

  PassportElementErrorFrontSide(
      {this.source, this.type, this.message, this.file_hash});

  factory PassportElementErrorFrontSide.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorFrontSideFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PassportElementErrorFrontSideToJson(this);
}
