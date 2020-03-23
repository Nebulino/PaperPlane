/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a link to a video file stored on the
/// Telegram servers.
/// By default, this video file will be sent by the
/// user with an optional caption.
/// Alternatively, you can use *input_message_content*
/// to send a message with the specified content instead of the video.
///
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
