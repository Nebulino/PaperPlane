/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// InlineQueryResultVoice telegram.types Class
/// https://core.telegram.org/bots/api#inlinequeryresultvoice
@JsonSerializable()
class InlineQueryResultVoice implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String voice_url;
  String title;
  String caption;
  String parse_mode;
  int voice_duration;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

  InlineQueryResultVoice(
      {this.id,
      this.type = 'voice',
      this.voice_url,
      this.title,
      this.caption,
      this.parse_mode,
      this.voice_duration,
      this.reply_markup,
      this.input_message_content});

  factory InlineQueryResultVoice.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultVoiceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultVoiceToJson(this);
}
