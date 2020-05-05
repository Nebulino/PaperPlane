/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of media;

/// This object represents a venue.
///
/// https://core.telegram.org/bots/api#video
@JsonSerializable(includeIfNull: false)
class Video {
  /// Identifier for this file, which can be used to download or reuse the file.
  @JsonKey(name: 'file_id', required: true)
  String fileID;

  /// Unique identifier for this file, which is supposed to be the same over
  /// time and for different bots. Can't be used to download or reuse the file.
  @JsonKey(name: 'file_unique_id', required: true)
  String fileUniqueID;

  /// Video width as defined by sender.
  @JsonKey(name: 'width', required: true)
  int width;

  /// Video height as defined by sender.
  @JsonKey(name: 'height', required: true)
  int height;

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

  /// *Optional.* Mime type of a file as defined by sender.
  @JsonKey(name: 'mime_type')
  String mimeType;

  /// *Optional.* File size.
  @JsonKey(name: 'file_size')
  int fileSize;

  Video({
    this.fileID,
    this.fileUniqueID,
    this.width,
    this.height,
    this.duration,
    this.thumb,
    this.mimeType,
    this.fileSize,
  });

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);

  /// Helper: converts into a Duration type from
  /// a int received from Telegram API.
  static Duration _durationFromTelegramSeconds(int seconds) =>
      seconds == null ? null : Duration(seconds: seconds);

  /// Helper: converts into a Duration type into
  /// a int to be sent to Telegram API.
  static int _durationToTelegramSeconds(Duration duration) =>
      duration?.inSeconds;
}
