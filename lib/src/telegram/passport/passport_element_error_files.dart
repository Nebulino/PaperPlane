/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// Represents an issue with a list of scans.
/// The error is considered resolved when the list of files
/// containing the scans changes.
///
/// https://core.telegram.org/bots/api#passportelementerrorfiles
@JsonSerializable(includeIfNull: false)
class PassportElementErrorFiles implements PassportElementError {
  @override
  String source;

  /// Type of the result, must be *gif*
  @JsonKey(name: 'type', required: true)
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
