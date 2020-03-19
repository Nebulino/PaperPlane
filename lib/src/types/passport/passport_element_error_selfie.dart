/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// Represents an issue with the selfie with a document.
/// The error is considered resolved when the file with the selfie changes.
///
/// https://core.telegram.org/bots/api#passportelementerrorselfie
@JsonSerializable()
class PassportElementErrorSelfie implements PassportElementError {
  @override
  String source;
  @override
  String type;
  @override
  String message;
  String file_hash;

  PassportElementErrorSelfie(
      {this.source, this.type, this.message, this.file_hash});

  factory PassportElementErrorSelfie.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorSelfieFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PassportElementErrorSelfieToJson(this);
}
