/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// Represents an issue with a document scan.
/// The error is considered resolved when the file with the
/// document scan changes.
///
/// https://core.telegram.org/bots/api#passportelementerrorfile
@JsonSerializable(includeIfNull: false)
class PassportElementErrorFile implements PassportElementError {
  @override
  String source;

  /// Type of the result, must be *gif*
  @JsonKey(name: 'type', required: true)
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
