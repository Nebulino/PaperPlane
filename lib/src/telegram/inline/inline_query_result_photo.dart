/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a link to a photo.
/// By default, this photo will be sent
/// by the user with optional caption.
/// Alternatively,
/// you can use *input_message_content*
/// to send a message with the specified
/// content instead of the photo.
///
/// https://core.telegram.org/bots/api#inlinequeryresultphoto
@JsonSerializable(includeIfNull: false)
class InlineQueryResultPhoto implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String photo_url;
  String thumb_url;
  int photo_width;
  int photo_height;
  String title;
  String description;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

  InlineQueryResultPhoto(
      {this.id,
      this.type = 'photo',
      this.photo_url,
      this.thumb_url,
      this.photo_width,
      this.photo_height,
      this.title,
      this.description,
      this.caption,
      this.parse_mode,
      this.reply_markup,
      this.input_message_content});

  factory InlineQueryResultPhoto.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultPhotoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultPhotoToJson(this);
}
