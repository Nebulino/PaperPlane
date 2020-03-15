/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// InlineQueryResultCachedPhoto telegram.types Class
/// https://core.telegram.org/bots/api#inlinequeryresultcachedphoto
@JsonSerializable()
class InlineQueryResultCachedPhoto implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String photo_file_id;
  String title;
  String description;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

  InlineQueryResultCachedPhoto(
      {this.id,
      this.type = 'photo',
      this.photo_file_id,
      this.title,
      this.description,
      this.caption,
      this.parse_mode,
      this.reply_markup,
      this.input_message_content});

  factory InlineQueryResultCachedPhoto.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedPhotoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultCachedPhotoToJson(this);
}
