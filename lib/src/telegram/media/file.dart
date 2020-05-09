//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

part of media;

/// This object represents a file ready to be downloaded.
/// The file can be downloaded via the link
/// [https://api.telegram.org/file/bot<token>/<file_path>].
/// It is guaranteed that the link will be valid
/// for at least 1 hour.
/// When the link expires, a new one can be requested
/// by calling [getFile].
///
/// **Maximum file size to download is 20 MB**
///
/// [getFile]: https://core.telegram.org/bots/api#getfile
///
/// https://core.telegram.org/bots/api#file
@JsonSerializable(includeIfNull: false)
class File {
  /// Identifier for this file, which can be used to download or reuse the file.
  @JsonKey(name: 'file_id', required: true)
  String fileID;

  /// Unique identifier for this file, which is supposed to be the same over
  /// time and for different bots. Can't be used to download or reuse the file.
  @JsonKey(name: 'file_unique_id', required: true)
  String fileUniqueID;

  /// *Optional.* File size, if known.
  @JsonKey(name: 'file_size')
  int fileSize;

  /// *Optional.* File path.
  /// Use [https://api.telegram.org/file/bot<token>/<file_path>]
  /// to get the file.
  @JsonKey(name: 'file_path')
  String filePath;

  File({
    this.fileID,
    this.fileUniqueID,
    this.fileSize,
    this.filePath,
  });

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);

  Map<String, dynamic> toJson() => _$FileToJson(this);
}
