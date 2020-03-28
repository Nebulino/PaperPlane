/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a link to an animated GIF file.
/// By default, this animated GIF file will be
/// sent by the user with optional caption.
/// Alternatively,
/// you can use *input_message_content* to
/// send a message with the specified content
/// instead of the animation.
///
/// https://core.telegram.org/bots/api#inlinequeryresultgif
@JsonSerializable(includeIfNull: false)
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
