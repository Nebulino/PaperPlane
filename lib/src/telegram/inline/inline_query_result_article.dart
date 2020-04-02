/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a link to an article or web page.
///
/// https://core.telegram.org/bots/api#inlinequeryresultarticle
@JsonSerializable(includeIfNull: false)
class InlineQueryResultArticle implements InlineQueryResult {
  /// Type of the result, must be *article*.
  @JsonKey(name: 'type', required: true)
  @override
  String type;

  /// Unique identifier for this result, 1-64 bytes.
  @JsonKey(name: 'id', required: true)
  @override
  String id;

  /// Title of the result.
  @JsonKey(name: 'title', required: true)
  String title;

  /// Content of the message to be sent.
  @JsonKey(name: 'input_message_content', required: true)
  InputMessageContent inputMessageContent;

  /// *Optional.* [Inline keyboard] attached to the message
  ///
  /// [Inline keyboard]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
  @JsonKey(name: 'reply_markup')
  InlineKeyboardMarkup replyMarkup;

  /// *Optional.* URL of the result.
  @JsonKey(name: 'url')
  String url;

  /// *Optional.*
  /// Pass True, if you don't want the URL to be shown in the message.
  @JsonKey(name: 'hide_url')
  bool hideUrl;

  /// *Optional.* Short description of the result.
  @JsonKey(name: 'description')
  String description;

  /// *Optional.* Url of the thumbnail for the result.
  @JsonKey(name: 'thumb_url')
  String thumbUrl;

  /// *Optional.* Thumbnail width.
  @JsonKey(name: 'thumb_width')
  String thumbWidth;

  /// *Optional.* Thumbnail height.
  @JsonKey(name: 'thumb_height')
  String thumbHeight;

  InlineQueryResultArticle(
      {this.type = 'article',
      this.id,
      this.title,
      this.inputMessageContent,
      this.replyMarkup,
      this.url,
      this.hideUrl,
      this.description,
      this.thumbUrl,
      this.thumbWidth,
      this.thumbHeight});

  factory InlineQueryResultArticle.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultArticleFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultArticleToJson(this);
}
