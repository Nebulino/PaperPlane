/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of media;

/// This object represents a general file
/// (as opposed to [photos], [voice messages] and [audio files]).
///
/// [photos]: https://core.telegram.org/bots/api#photosize
/// [voice messages]: https://core.telegram.org/bots/api#voice
/// [audio files]: https://core.telegram.org/bots/api#audio
///
/// https://core.telegram.org/bots/api#document
@JsonSerializable()
class Document {
  String file_id;
  String file_unique_id;
  PhotoSize thumb;
  String file_name;
  String mime_type;
  int file_size;

  Document(
      {this.file_id,
      this.file_unique_id,
      this.thumb,
      this.file_name,
      this.mime_type,
      this.file_size});

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}
