/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// InlineQueryResultVideo telegram.types Class
/// https://core.telegram.org/bots/api#inlinequeryresultvideo
@JsonSerializable()
class InlineQueryResultVideo implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String video_url;
  String mime_type;
  String thumb_url;
  String title;
  String caption;
  String parse_mode;
  int video_width;
  int video_height;
  int video_duration;
  String description;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

  InlineQueryResultVideo(
      {this.id,
      this.type = 'video',
      this.video_url,
      this.mime_type,
      this.thumb_url,
      this.title,
      this.caption,
      this.parse_mode,
      this.video_width,
      this.video_height,
      this.video_duration,
      this.description,
      this.reply_markup,
      this.input_message_content});

  factory InlineQueryResultVideo.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultVideoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultVideoToJson(this);
}
