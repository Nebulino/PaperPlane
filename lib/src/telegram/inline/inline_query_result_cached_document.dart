/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a link to a file stored on the Telegram servers.
/// By default, this file will be sent by the user with an optional caption.
/// Alternatively,
/// you can use *input_message_content* to send a message with the
/// specified content instead of the file.
///
/// **Note:** This will only work in Telegram versions
/// released after 9 April, 2016.
///
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultcacheddocument
@JsonSerializable(includeIfNull: false)
class InlineQueryResultCachedDocument implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String title;
  String document_file_id;
  String description;
  String caption;
  String parse_mode;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

  InlineQueryResultCachedDocument(
      {this.id,
      this.type = 'document',
      this.title,
      this.document_file_id,
      this.description,
      this.caption,
      this.parse_mode,
      this.reply_markup,
      this.input_message_content});

  factory InlineQueryResultCachedDocument.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedDocumentFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$InlineQueryResultCachedDocumentToJson(this);
}
