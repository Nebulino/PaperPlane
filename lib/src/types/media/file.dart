/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of media;

/// This object represents a file ready to be downloaded.
/// The file can be downloaded via the link
/// [https://api.telegram.org/file/bot<token>/<file_path>].
/// It is guaranteed that the link will be valid
/// for at least 1 hour.
/// When the link expires, a new one can be requested
/// by calling [getFile].
///
/// *Maximum file size to download is 20 MB*
///
/// [getFile]: https://core.telegram.org/bots/api#getfile
///
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
