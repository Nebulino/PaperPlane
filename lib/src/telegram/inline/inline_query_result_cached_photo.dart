/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a link to a photo stored on the Telegram
/// servers.
/// By default, this photo will be sent by the user with
/// an optional caption.
/// Alternatively,
/// you can use *input_message_content* to send a message
/// with the specified content instead of the photo.
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedphoto
@JsonSerializable(includeIfNull: false)
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
