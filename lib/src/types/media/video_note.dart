/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of media;

/// VideoNote telegram.types Class
/// https://core.telegram.org/bots/api#videonote
@JsonSerializable()
class VideoNote {
  String file_id;
  String file_unique_id;
  int length;
  int duration;
  PhotoSize thumb;
  int file_size;

  VideoNote(
      {this.file_id,
      this.file_unique_id,
      this.length,
      this.duration,
      this.thumb,
      this.file_size});

  factory VideoNote.fromJson(Map<String, dynamic> json) =>
      _$VideoNoteFromJson(json);

  Map<String, dynamic> toJson() => _$VideoNoteToJson(this);
}
