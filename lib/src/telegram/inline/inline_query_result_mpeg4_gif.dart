/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a link to a video animation
/// (H.264/MPEG-4 AVC video without sound).
/// By default, this animated MPEG-4 file
/// will be sent by the user with optional caption.
/// Alternatively,
/// you can use *input_message_content* to
/// send a message with the specified content
/// instead of the animation.
///
/// https://core.telegram.org/bots/api#inlinequeryresultmpeg4gif
@JsonSerializable(includeIfNull: false)
class InlineQueryResultMpeg4Gif implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String mpeg4_url;
  int mpeg4_width;
  int mpeg4_height;
  int mpeg4_duration;
  String thumb_url;
  String title;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

  InlineQueryResultMpeg4Gif(
      {this.id,
      this.type = 'mpeg4_gif',
      this.mpeg4_url,
      this.mpeg4_width,
      this.mpeg4_height,
      this.mpeg4_duration,
      this.thumb_url,
      this.title,
      this.caption,
      this.parse_mode,
      this.reply_markup,
      this.input_message_content});

  factory InlineQueryResultMpeg4Gif.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultMpeg4GifFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultMpeg4GifToJson(this);
}
