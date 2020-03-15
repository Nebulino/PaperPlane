/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// InlineQueryResultAudio telegram.types Class
/// https://core.telegram.org/bots/api#inlinequeryresultaudio
@JsonSerializable()
class InlineQueryResultAudio implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String audio_url;
  String title;
  String caption;
  String parse_mode;
  String performer;
  int audio_duration;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

  InlineQueryResultAudio(
      {this.id,
      this.type = 'audio',
      this.audio_url,
      this.title,
      this.caption,
      this.parse_mode,
      this.performer,
      this.audio_duration,
      this.reply_markup,
      this.input_message_content});

  factory InlineQueryResultAudio.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultAudioFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultAudioToJson(this);
}
