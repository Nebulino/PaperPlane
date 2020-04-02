/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of media;

/// This object represents an audio file to be treated as music by the
/// Telegram clients.
///
/// https://core.telegram.org/bots/api#audio
@JsonSerializable(includeIfNull: false)
class Audio {
  /// Identifier for this file, which can be used to download or reuse the file.
  @JsonKey(name: 'file_id', required: true)
  String fileID;

  /// Unique identifier for this file, which is supposed to be the same over
  /// time and for different bots. Can't be used to download or reuse the file.
  @JsonKey(name: 'file_unique_id', required: true)
  String fileUniqueID;

  /// Duration of the audio in seconds as defined by sender.
  @JsonKey(
      name: 'duration',
      required: true,
      fromJson: _durationFromTelegramSeconds,
      toJson: _durationToTelegramSeconds)
  Duration duration;

  /// *Optional.* Performer of the audio as defined by sender or by audio tags.
  @JsonKey(name: 'performer')
  String performer;

  /// *Optional.* Title of the audio as defined by sender or by audio tags.
  @JsonKey(name: 'title')
  String title;

  /// *Optional.* MIME type of the file as defined by sender.
  @JsonKey(name: 'mime_type')
  String mimeType;

  /// *Optional.* File size.
  @JsonKey(name: 'file_size')
  int fileSize;

  /// *Optional.* Thumbnail of the album cover to which the music file belongs.
  @JsonKey(name: 'thumb')
  PhotoSize thumb;

  Audio(
      {this.fileID,
      this.fileUniqueID,
      this.duration,
      this.performer,
      this.title,
      this.mimeType,
      this.fileSize,
      this.thumb});

  factory Audio.fromJson(Map<String, dynamic> json) => _$AudioFromJson(json);

  Map<String, dynamic> toJson() => _$AudioToJson(this);

  /// Helper: converts into a Duration type from
  /// a int received from Telegram API.
  static Duration _durationFromTelegramSeconds(int seconds) =>
      seconds == null ? null : Duration(seconds: seconds);

  /// Helper: converts into a Duration type into
  /// a int to be sent to Telegram API.
  static int _durationToTelegramSeconds(Duration duration) =>
      duration?.inSeconds;
}
