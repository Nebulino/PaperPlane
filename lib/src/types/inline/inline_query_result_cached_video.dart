/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// InlineQueryResultCachedVideo telegram.types Class
/// https://core.telegram.org/bots/api#inlinequeryresultcachedvideo
@JsonSerializable()
class InlineQueryResultCachedVideo implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String video_file_id;
  String title;
  String description;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

  InlineQueryResultCachedVideo(
      {this.id,
      this.type = 'video',
      this.video_file_id,
      this.title,
      this.description,
      this.caption,
      this.parse_mode,
      this.reply_markup,
      this.input_message_content});

  factory InlineQueryResultCachedVideo.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedVideoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultCachedVideoToJson(this);
}
