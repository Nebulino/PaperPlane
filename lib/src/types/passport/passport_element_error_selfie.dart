/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// PassportElementErrorSelfie telegram.types Class
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
