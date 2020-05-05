/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of media;

/// This object represents a [video message] (available in
/// Telegram apps as of [v.4.0]).
///
/// [video message]: https://telegram.org/blog/video-messages-and-telescope
/// [v.4.0]: https://telegram.org/blog/video-messages-and-telescope
///
/// https://core.telegram.org/bots/api#videonote
@JsonSerializable(includeIfNull: false)
class VideoNote {
  /// Identifier for this file, which can be used to download or reuse the file.
  @JsonKey(name: 'file_id', required: true)
  String fileID;

  /// Unique identifier for this file, which is supposed to be the same over
  /// time and for different bots. Can't be used to download or reuse the file.
  @JsonKey(name: 'file_unique_id', required: true)
  String fileUniqueID;

  /// Video width and height (diameter of the video message)
  /// as defined by sender.
  @JsonKey(name: 'length', required: true)
  int length;

  /// Duration of the video in seconds as defined by sender.
  @JsonKey(
      name: 'duration',
      required: true,
      fromJson: _durationFromTelegramSeconds,
      toJson: _durationToTelegramSeconds)
  Duration duration;

  /// *Optional.* Video thumbnail.
  @JsonKey(name: 'thumb')
  PhotoSize thumb;

  /// *Optional.* File size.
  @JsonKey(name: 'file_size')
  int fileSize;

  VideoNote({
    this.fileID,
    this.fileUniqueID,
    this.length,
    this.duration,
    this.thumb,
    this.fileSize,
  });

  factory VideoNote.fromJson(Map<String, dynamic> json) =>
      _$VideoNoteFromJson(json);

  Map<String, dynamic> toJson() => _$VideoNoteToJson(this);

  /// Helper: converts into a Duration type from
  /// a int received from Telegram API.
  static Duration _durationFromTelegramSeconds(int seconds) =>
      seconds == null ? null : Duration(seconds: seconds);

  /// Helper: converts into a Duration type into
  /// a int to be sent to Telegram API.
  static int _durationToTelegramSeconds(Duration duration) =>
      duration?.inSeconds;
}
