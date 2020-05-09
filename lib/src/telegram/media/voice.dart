//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

part of media;

/// This object represents a voice note.
///
/// https://core.telegram.org/bots/api#voice
@JsonSerializable(includeIfNull: false)
class Voice {
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

  /// *Optional.* MIME type of the file as defined by sender.
  @JsonKey(name: 'mime_type')
  String mimeType;

  /// *Optional.* File size.
  @JsonKey(name: 'file_size')
  int file_size;

  Voice({
    this.fileID,
    this.fileUniqueID,
    this.duration,
    this.mimeType,
    this.file_size,
  });

  factory Voice.fromJson(Map<String, dynamic> json) => _$VoiceFromJson(json);

  Map<String, dynamic> toJson() => _$VoiceToJson(this);

  /// Helper: converts into a Duration type from
  /// a int received from Telegram API.
  static Duration _durationFromTelegramSeconds(int seconds) =>
      seconds == null ? null : Duration(seconds: seconds);

  /// Helper: converts into a Duration type into
  /// a int to be sent to Telegram API.
  static int _durationToTelegramSeconds(Duration duration) =>
      duration?.inSeconds;
}
