/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of media;

/// This object represents a voice note.
///
/// https://core.telegram.org/bots/api#voice
@JsonSerializable(includeIfNull: false)
class Voice {
  String file_id;
  String file_unique_id;
  int duration;
  String mime_type;
  int file_size;

  Voice(
      {this.file_id,
      this.file_unique_id,
      this.duration,
      this.mime_type,
      this.file_size});

  factory Voice.fromJson(Map<String, dynamic> json) => _$VoiceFromJson(json);

  Map<String, dynamic> toJson() => _$VoiceToJson(this);
}
