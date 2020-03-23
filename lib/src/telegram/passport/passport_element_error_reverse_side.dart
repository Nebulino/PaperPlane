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
@JsonSerializable()
class PassportElementErrorReverseSide implements PassportElementError {
  @override
  String source;
  @override
  String type;
  @override
  String message;
  String file_hash;

  PassportElementErrorReverseSide(
      {this.source, this.type, this.message, this.file_hash});

  factory PassportElementErrorReverseSide.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorReverseSideFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$PassportElementErrorReverseSideToJson(this);
}
