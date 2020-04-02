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
  /// Type of the result, must be *photo*.
  @JsonKey(name: 'type', required: true)
  @override
  String type;

  /// Unique identifier for this result, 1-64 bytes.
  @JsonKey(name: 'id', required: true)
  @override
  String id;

  /// A valid URL of the photo.
  /// Photo must be in **jpeg** format.
  /// Photo size must not exceed 5MB.
  @JsonKey(name: 'photo_url', required: true)
  String photoUrl;

  /// URL of the thumbnail for the photo.
  @JsonKey(name: 'thumb_url', required: true)
  String thumbUrl;

  /// Optional. Width of the photo.
  @JsonKey(name: 'photo_width')
  int photoWidth;

  /// Optional. Height of the photo.
  @JsonKey(name: 'photo_height')
  int photoHeight;

  /// Optional. Title for the result.
  @JsonKey(name: 'title')
  String title;

  /// Optional. Short description of the result.
  @JsonKey(name: 'description')
  String description;

  /// Optional. Caption of the photo to be sent,
  /// 0-1024 characters after entities parsing
  @JsonKey(name: 'caption')
  String caption;

  /// Optional.
  /// Send *[Markdown]* or *[HTML]*,
  /// if you want Telegram apps to show [bold, italic,
  /// fixed-width text or inline URLs] in the media caption.
  ///
  /// [Markdown]: https://core.telegram.org/bots/api#markdown-style
  /// [HTML]: https://core.telegram.org/bots/api#html-style
  /// [bold, italic, fixed-width text or inline URLs]: https://core.telegram.org/bots/api#formatting-options
  @JsonKey(name: 'parse_mode')
  ParseMode parseMode;

  /// Optional. [Inline keyboard] attached to the message.
  ///
  /// [Inline keyboard]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
  @JsonKey(name: 'reply_markup')
  InlineKeyboardMarkup replyMarkup;

  /// Optional.
  /// Content of the message to be sent instead of the photo.
  @JsonKey(name: 'input_message_content')
  InputMessageContent inputMessageContent;

  InlineQueryResultPhoto(
      {this.type = 'photo',
      this.id,
      this.photoUrl,
      this.thumbUrl,
      this.photoWidth,
      this.photoHeight,
      this.title,
      this.description,
      this.caption,
      this.parseMode,
      this.replyMarkup,
      this.inputMessageContent});

  factory InlineQueryResultPhoto.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultPhotoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultPhotoToJson(this);
}
