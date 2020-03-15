/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// InlineQueryResultCachedVoice telegram.types Class
/// https://core.telegram.org/bots/api#inlinequeryresultcachedvoice
@JsonSerializable()
class InlineQueryResultCachedVoice implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String voice_file_id;
  String title;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

  InlineQueryResultCachedVoice(
      {this.id,
      this.type = 'voice',
      this.voice_file_id,
      this.title,
      this.caption,
      this.parse_mode,
      this.reply_markup,
      this.input_message_content});

  factory InlineQueryResultCachedVoice.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedVoiceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultCachedVoiceToJson(this);
}
