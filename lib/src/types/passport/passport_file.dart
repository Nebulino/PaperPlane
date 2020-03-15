/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// PassportFile telegram.types Class
/// https://core.telegram.org/bots/api#passportfile
@JsonSerializable()
class PassportFile {
  String file_id;
  String file_unique_id;
  int file_size;
  int file_date;

  PassportFile(
      {this.file_id, this.file_unique_id, this.file_size, this.file_date});

  factory PassportFile.fromJson(Map<String, dynamic> json) =>
      _$PassportFileFromJson(json);

  Map<String, dynamic> toJson() => _$PassportFileToJson(this);
}