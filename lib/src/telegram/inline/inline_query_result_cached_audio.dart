/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a link to an mp3 audio file stored on the Telegram servers.
/// By default, this audio file will be sent by the user.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified
/// content instead of the audio.
///
/// **Note:** This will only work in Telegram versions
/// released after 9 April, 2016.
///
/// Older clients will ignore them
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedaudio
@JsonSerializable(includeIfNull: false)
class InlineQueryResultCachedAudio implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String audio_file_id;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

  InlineQueryResultCachedAudio(
      {this.id,
      this.type = 'audio',
      this.audio_file_id,
      this.caption,
      this.parse_mode,
      this.reply_markup,
      this.input_message_content});

  factory InlineQueryResultCachedAudio.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedAudioFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultCachedAudioToJson(this);
}
