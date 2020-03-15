/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// InlineQueryResultDocument telegram.types Class
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
