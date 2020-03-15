/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// InlineQueryResultCachedMpeg4Gif telegram.types Class
/// https://core.telegram.org/bots/api#inlinequeryresultcachedmpeg4gif
@JsonSerializable()
class InlineQueryResultCachedMpeg4Gif implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String mpeg4_file_id;
  String title;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

  InlineQueryResultCachedMpeg4Gif(
      {this.id,
      this.type = 'mpeg4_gif',
      this.mpeg4_file_id,
      this.title,
      this.caption,
      this.parse_mode,
      this.reply_markup,
      this.input_message_content});

  factory InlineQueryResultCachedMpeg4Gif.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedMpeg4GifFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$InlineQueryResultCachedMpeg4GifToJson(this);
}
