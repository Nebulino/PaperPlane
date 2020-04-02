/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// Represents an issue with one of the files that constitute the translation of a document.
/// The error is considered resolved when the file changes.
///
/// https://core.telegram.org/bots/api#passportelementerrortranslationfile
@JsonSerializable(includeIfNull: false)
class PassportElementErrorTranslationFile implements PassportElementError {
  @override
  String source;

  /// Type of the result, must be *gif*
  @JsonKey(name: 'type', required: true)
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
