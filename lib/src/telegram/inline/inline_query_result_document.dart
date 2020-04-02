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
@JsonSerializable(includeIfNull: false)
class InlineQueryResultDocument implements InlineQueryResult {
  /// Type of the result, must be *document*.
  @JsonKey(name: 'type', required: true)
  @override
  String type;

  /// Unique identifier for this result, 1-64 bytes.
  @JsonKey(name: 'id', required: true)
  @override
  String id;

  /// Title for the result.
  @JsonKey(name: 'title', required: true)
  String title;

  /// *Optional.* Caption of the document to be sent,
  /// 0-1024 characters after entities parsing
  @JsonKey(name: 'caption')
  String caption;

  /// *Optional.*
  /// Send *[Markdown]* or *[HTML]*,
  /// if you want Telegram apps to show [bold, italic,
  /// fixed-width text or inline URLs] in the media caption.
  ///
  /// [Markdown]: https://core.telegram.org/bots/api#markdown-style
  /// [HTML]: https://core.telegram.org/bots/api#html-style
  /// [bold, italic, fixed-width text or inline URLs]: https://core.telegram.org/bots/api#formatting-options
  @JsonKey(name: 'parse_mode')
  ParseMode parseMode;

  /// A valid URL for the file.
  @JsonKey(name: 'document_url', required: true)
  String documentUrl;

  /// Mime type of the content of the file,
  /// either “application/pdf” or “application/zip”.
  @JsonKey(name: 'mime_type', required: true)
  String mimeType;

  /// *Optional.* Short description of the result.
  @JsonKey(name: 'description')
  String description;

  /// *Optional.* [Inline keyboard] attached to the message.
  ///
  /// [Inline keyboard]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
  @JsonKey(name: 'reply_markup')
  InlineKeyboardMarkup replyMarkup;

  /// *Optional.* Content of the message to be sent instead of the file.
  @JsonKey(name: 'input_message_content')
  InputMessageContent inputMessageContent;

  /// *Optional.* URL of the thumbnail (jpeg only) for the file.
  @JsonKey(name: 'thumb_url')
  String thumbUrl;

  /// *Optional.* Thumbnail width.
  @JsonKey(name: 'thumb_width')
  int thumbWidth;

  /// *Optional.* Thumbnail height.
  @JsonKey(name: 'thumb_height')
  int thumbHeight;

  InlineQueryResultDocument(
      {this.type = 'document',
      this.id,
      this.title,
      this.caption,
      this.parseMode,
      this.documentUrl,
      this.mimeType,
      this.description,
      this.replyMarkup,
      this.inputMessageContent,
      this.thumbUrl,
      this.thumbWidth,
      this.thumbHeight});

  factory InlineQueryResultDocument.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultDocumentFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultDocumentToJson(this);
}
