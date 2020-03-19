/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a link to a file. By default, this file will be sent by the user
/// with an optional caption.
/// Alternatively,
/// you can use *input_message_content* to send a message with the specified
/// content instead of the file.
/// Currently, only **.PDF** and **.ZIP** files can be sent using this method.
///
/// **Note:** This will only work in Telegram versions
/// released after 9 April, 2016.
///
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultdocument
@JsonSerializable()
class InlineQueryResultDocument implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String title;
  String caption;
  String parse_mode;
  String document_url;
  String mime_type;
  String description;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  String thumb_url;
  int thumb_width;
  int thumb_height;

  InlineQueryResultDocument(
      {this.id,
      this.type = 'document',
      this.title,
      this.caption,
      this.parse_mode,
      this.document_url,
      this.mime_type,
      this.description,
      this.reply_markup,
      this.input_message_content,
      this.thumb_url,
      this.thumb_width,
      this.thumb_height});

  factory InlineQueryResultDocument.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultDocumentFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultDocumentToJson(this);
}
