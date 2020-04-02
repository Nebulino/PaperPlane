/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of media;

/// This object represents an animation file
/// (GIF or H.264/MPEG-4 AVC video without sound).
///
/// https://core.telegram.org/bots/api#animation
@JsonSerializable(includeIfNull: false)
class Animation {
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

  /// *Optional.* Animation thumbnail as defined by sender.
  @JsonKey(name: 'thumb')
  PhotoSize thumb;

  /// *Optional.* Original animation filename as defined by sender.
  @JsonKey(name: 'file_name')
  String fileName;

  /// *Optional.* MIME type of the file as defined by sender.
  @JsonKey(name: 'mime_type')
  String mimeType;

  /// *Optional.* File size.
  @JsonKey(name: 'file_size')
  int fileSize;

  Animation(
      {this.fileID,
      this.fileUniqueID,
      this.width,
      this.height,
      this.duration,
      this.thumb,
      this.fileName,
      this.mimeType,
      this.fileSize});

  factory Animation.fromJson(Map<String, dynamic> json) =>
      _$AnimationFromJson(json);

  Map<String, dynamic> toJson() => _$AnimationToJson(this);

  /// Helper: converts into a Duration type from
  /// a int received from Telegram API.
  static Duration _durationFromTelegramSeconds(int seconds) =>
      seconds == null ? null : Duration(seconds: seconds);

  /// Helper: converts into a Duration type into
  /// a int to be sent to Telegram API.
  static int _durationToTelegramSeconds(Duration duration) =>
      duration?.inSeconds;
}
