/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a link to an article or web page.
///
/// https://core.telegram.org/bots/api#inlinequeryresultarticle
@JsonSerializable()
class InlineQueryResultArticle implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String title;
  InputMessageContent input_message_content;
  InlineKeyboardMarkup reply_markup;
  String url;
  bool hide_url;
  String description;
  String thumb_url;
  String thumb_width;
  String thumb_height;

  InlineQueryResultArticle(
      {this.id,
      this.type = 'article',
      this.title,
      this.input_message_content,
      this.reply_markup,
      this.url,
      this.hide_url,
      this.description,
      this.thumb_url,
      this.thumb_width,
      this.thumb_height});

  factory InlineQueryResultArticle.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultArticleFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultArticleToJson(this);
}
