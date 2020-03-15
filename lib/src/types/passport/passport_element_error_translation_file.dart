/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// PassportElementErrorTranslationFile telegram.types Class
/// https://core.telegram.org/bots/api#passportelementerrortranslatiofile
@JsonSerializable()
class PassportElementErrorTranslationFile implements PassportElementError {
  @override
  String source;
  @override
  String type;
  @override
  String message;
  String file_hash;

  PassportElementErrorTranslationFile(
      {this.source, this.type, this.message, this.file_hash});

  factory PassportElementErrorTranslationFile.fromJson(
          Map<String, dynamic> json) =>
      _$PassportElementErrorTranslationFileFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$PassportElementErrorTranslationFileToJson(this);
}
