/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// InlineQueryResultGif telegram.types Class
/// https://core.telegram.org/bots/api#inlinequeryresultgif
@JsonSerializable()
class InlineQueryResultGif implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String gif_url;
  int gif_width;
  int gif_height;
  int gif_duration;
  String thumb_url;
  String title;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

  InlineQueryResultGif(
      {this.id,
      this.type = 'gif',
      this.gif_url,
      this.gif_width,
      this.gif_height,
      this.gif_duration,
      this.thumb_url,
      this.title,
      this.caption,
      this.parse_mode,
      this.reply_markup,
      this.input_message_content});

  factory InlineQueryResultGif.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultGifFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultGifToJson(this);
}
