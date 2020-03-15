/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// PassportElementErrorFiels telegram.types Class
/// https://core.telegram.org/bots/api#passportelementerrorfiles
@JsonSerializable()
class PassportElementErrorFiles implements PassportElementError {
  @override
  String source;
  @override
  String type;
  @override
  String message;
  List<String> file_hashes;

  PassportElementErrorFiles(
      {this.source, this.type, this.message, this.file_hashes});

  factory PassportElementErrorFiles.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorFilesFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PassportElementErrorFilesToJson(this);
}
