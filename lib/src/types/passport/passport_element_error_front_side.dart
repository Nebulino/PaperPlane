/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// PassportElementErrorFrontSide telegram.types Class
/// https://core.telegram.org/bots/api#passportelementerrorfrontside
@JsonSerializable()
class PassportElementErrorFrontSide implements PassportElementError {
  @override
  String source;
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
