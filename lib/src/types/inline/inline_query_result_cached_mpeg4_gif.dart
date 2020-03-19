/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a link to a video animation
/// (H.264/MPEG-4 AVC video without sound) stored on the Telegram servers.
/// By default, this animated MPEG-4 file will be sent
/// by the user with an optional caption.
///
/// Alternatively,
/// you can use *input_message_content* to send a
/// message with the specified content instead of the animation.
///
/// https://core.telegram.org/bots/api#inlinequeryresultmpeg4gif
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
