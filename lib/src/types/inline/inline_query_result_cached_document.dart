/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// InlineQueryResultCachedDocument telegram.types Class
/// https://core.telegram.org/bots/api#inlinequeryresultcacheddocument
@JsonSerializable()
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
