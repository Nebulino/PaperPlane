/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// Represents an issue with the translated version of a document.
/// The error is considered resolved when a file with the document
/// translation change.
///
/// https://core.telegram.org/bots/api#passportelementerrortranslationfiles
@JsonSerializable(includeIfNull: false)
class PassportElementErrorTranslationFiles implements PassportElementError {
  @override
  String source;

  /// Type of the result, must be *gif*
  @JsonKey(name: 'type', required: true)
  @override
  String type;
  @override
  String message;
  List<String> file_hashes;

  PassportElementErrorTranslationFiles(
      {this.source, this.type, this.message, this.file_hashes});

  factory PassportElementErrorTranslationFiles.fromJson(
          Map<String, dynamic> json) =>
      _$PassportElementErrorTranslationFilesFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$PassportElementErrorTranslationFilesToJson(this);
}
