/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// InlineQueryResultCachedGif telegram.types Class
/// https://core.telegram.org/bots/api#inlinequeryresultcachedgif
@JsonSerializable()
class InlineQueryResultCachedGif implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String gif_file_id;
  String title;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

  InlineQueryResultCachedGif(
      {this.id,
      this.type = 'gif',
      this.gif_file_id,
      this.title,
      this.caption,
      this.parse_mode,
      this.reply_markup,
      this.input_message_content});

  factory InlineQueryResultCachedGif.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedGifFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultCachedGifToJson(this);
}
