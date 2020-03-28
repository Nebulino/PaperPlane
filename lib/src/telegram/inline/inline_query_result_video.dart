/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a link to a page containing an embedded
/// video player or a video file.
/// By default, this video file will be sent by the
/// user with an optional caption.
/// Alternatively,
/// you can use *input_message_content* to send a
/// message with the specified content instead of the video.
///
/// If an InlineQueryResultVideo message contains
/// an embedded video (e.g., YouTube),
/// you **must** replace its content using
/// *input_message_content*.
///
/// https://core.telegram.org/bots/api#inlinequeryresultvideo
@JsonSerializable(includeIfNull: false)
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
