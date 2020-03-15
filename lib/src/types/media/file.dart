/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of media;

/// File telegram.types Class
/// https://core.telegram.org/bots/api#file
@JsonSerializable()
class File {
  String file_id;
  String file_unique_id;
  int file_size;
  String file_path;

  File({this.file_id, this.file_unique_id, this.file_size, this.file_path});

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);

  Map<String, dynamic> toJson() => _$FileToJson(this);
}
