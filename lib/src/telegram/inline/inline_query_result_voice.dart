/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a link to a voice recording
/// in an .ogg container encoded with OPUS.
/// By default, this voice recording will
/// be sent by the user.
/// Alternatively,
/// you can use *input_message_content*
/// to send a message with the specified content instead
/// of the the voice message.
///
/// **Note:** This will only work in Telegram
/// versions released after 9 April, 2016.
///
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultvoice
@JsonSerializable(includeIfNull: false)
class InlineQueryResultVoice implements InlineQueryResult {
  /// Type of the result, must be *voice*.
  @JsonKey(name: 'type', required: true)
  @override
  String type;

  /// Unique identifier for this result, 1-64 bytes.
  @JsonKey(name: 'id', required: true)
  @override
  String id;

  /// A valid URL for the voice recording.
  @JsonKey(name: 'voice_url', required: true)
  String voiceUrl;

  /// Recording title.
  @JsonKey(name: 'title', required: true)
  String title;

  /// Optional. Caption,
  /// 0-1024 characters after entities parsing.
  @JsonKey(name: 'caption')
  String caption;

  /// Optional.
  /// Send *[Markdown]* or *[HTML]*,
  /// if you want Telegram apps to show [bold, italic,
  /// fixed-width text or inline URLs] in the media caption.
  ///
  /// [Markdown]: https://core.telegram.org/bots/api#markdown-style
  /// [HTML]: https://core.telegram.org/bots/api#html-style
  /// [bold, italic, fixed-width text or inline URLs]: https://core.telegram.org/bots/api#formatting-options
  @JsonKey(name: 'parse_mode')
  String parseMode;

  @JsonKey(
      name: 'voice_duration',
      fromJson: _durationFromTelegramSeconds,
      toJson: _durationToTelegramSeconds)
  Duration voiceDuration;

  /// Optional. [Inline keyboard] attached to the message.
  ///
  /// [Inline keyboard]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
  @JsonKey(name: 'reply_markup')
  InlineKeyboardMarkup replyMarkup;

  /// Optional. Content of the message to be sent instead of the voice recording.
  @JsonKey(name: 'input_message_content')
  InputMessageContent inputMessageContent;

  InlineQueryResultVoice(
      {this.type = 'voice',
      this.id,
      this.voiceUrl,
      this.title,
      this.caption,
      this.parseMode,
      this.voiceDuration,
      this.replyMarkup,
      this.inputMessageContent});

  factory InlineQueryResultVoice.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultVoiceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultVoiceToJson(this);

  /// Helper: converts into a Duration type from
  /// a int received from Telegram API.
  static Duration _durationFromTelegramSeconds(int seconds) =>
      Duration(seconds: seconds);

  /// Helper: converts into a Duration type into
  /// a int to be sent to Telegram API.
  static int _durationToTelegramSeconds(Duration duration) =>
      duration?.inSeconds;
}
