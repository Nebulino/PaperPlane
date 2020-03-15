/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// InlineQueryResultCachedAudio telegram.types Class
/// https://core.telegram.org/bots/api#inlinequeryresultcachedaudio
@JsonSerializable()
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
