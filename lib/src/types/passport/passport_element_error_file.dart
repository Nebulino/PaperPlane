/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// PassportElementErrorFile telegram.types Class
/// https://core.telegram.org/bots/api#passportelementerrorfile
@JsonSerializable()
class PassportElementErrorFile implements PassportElementError {
  @override
  String source;
  @override
  String type;
  @override
  String message;
  String file_hash;

  PassportElementErrorFile(
      {this.source, this.type, this.message, this.file_hash});

  factory PassportElementErrorFile.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorFileFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PassportElementErrorFileToJson(this);
}
