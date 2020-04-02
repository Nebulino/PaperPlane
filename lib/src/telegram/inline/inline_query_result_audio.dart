/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a link to an mp3 audio file.
/// By default, this audio file will be sent by the user.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified content instead of the audio.
///
/// **Note:** This will only work in Telegram versions released after 9 April, 2016.
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultaudio
@JsonSerializable(includeIfNull: false)
class InlineQueryResultAudio implements InlineQueryResult {
  /// Type of the result, must be *audio*.
  @JsonKey(name: 'type', required: true)
  @override
  String type;

  /// Unique identifier for this result, 1-64 bytes.
  @JsonKey(name: 'id', required: true)
  @override
  String id;

  /// A valid URL for the audio file.
  @JsonKey(name: 'audio_url', required: true)
  String audioUrl;

  /// Title.
  @JsonKey(name: 'title', required: true)
  String title;

  /// *Optional.* Caption, 0-1024 characters after entities parsing.
  @JsonKey(name: 'caption')
  String caption;

  /// *Optional.*
  /// Send *[Markdown]* or *[HTML]*,
  /// if you want Telegram apps to show [bold, italic,
  /// fixed-width text or inline URLs] in the media caption.
  ///
  /// [Markdown]: https://core.telegram.org/bots/api#markdown-style
  /// [HTML]: https://core.telegram.org/bots/api#html-style
  /// [bold, italic, fixed-width text or inline URLs]: https://core.telegram.org/bots/api#formatting-options
  @JsonKey(name: 'parse_mode')
  ParseMode parseMode;

  /// *Optional.* Performer.
  @JsonKey(name: 'performer')
  String performer;

  /// *Optional.* Audio duration in seconds.
  @JsonKey(
      name: 'audio_duration',
      fromJson: _durationFromTelegramSeconds,
      toJson: _durationToTelegramSeconds)
  Duration audioDuration;

  /// *Optional.* [Inline keyboard] attached to the message.
  ///
  /// [Inline keyboard]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
  @JsonKey(name: 'reply_markup')
  InlineKeyboardMarkup replyMarkup;

  /// *Optional.* Content of the message to be sent instead of the audio.
  @JsonKey(name: 'input_message_content')
  InputMessageContent inputMessageContent;

  InlineQueryResultAudio(
      {this.type = 'audio',
      this.id,
      this.audioUrl,
      this.title,
      this.caption,
      this.parseMode,
      this.performer,
      this.audioDuration,
      this.replyMarkup,
      this.inputMessageContent});

  factory InlineQueryResultAudio.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultAudioFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultAudioToJson(this);

  /// Helper: converts into a Duration type from
  /// a int received from Telegram API.
  static Duration _durationFromTelegramSeconds(int seconds) =>
      seconds == null ? null : Duration(seconds: seconds);

  /// Helper: converts into a Duration type into
  /// a int to be sent to Telegram API.
  static int _durationToTelegramSeconds(Duration duration) =>
      duration?.inSeconds;
}
