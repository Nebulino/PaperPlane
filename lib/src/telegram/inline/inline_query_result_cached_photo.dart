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
  /// Type of the result, must be *gif*.
  @JsonKey(name: 'type', required: true)
  @override
  String type;

  /// Unique identifier for this result, 1-64 bytes.
  @JsonKey(name: 'id', required: true)
  @override
  String id;

  /// A valid file identifier of the photo.
  @JsonKey(name: 'photo_file_id', required: true)
  String photoFileID;

  /// *Optional.* Title for the result.
  @JsonKey(name: 'title')
  String title;

  /// *Optional.* Short description of the result.
  @JsonKey(name: 'description')
  String description;

  /// *Optional.* Caption of the photo to be sent,
  /// 0-1024 characters after entities parsing.
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

  /// *Optional.* [Inline keyboard] attached to the message.
  ///
  /// [Inline keyboard]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
  @JsonKey(name: 'reply_markup')
  InlineKeyboardMarkup replyMarkup;

  /// *Optional.* Content of the message to be sent instead of the photo.
  @JsonKey(name: 'input_message_content')
  InputMessageContent inputMessageContent;

  InlineQueryResultCachedPhoto({
    this.type = 'photo',
    this.id,
    this.photoFileID,
    this.title,
    this.description,
    this.caption,
    this.parseMode,
    this.replyMarkup,
    this.inputMessageContent,
  });

  factory InlineQueryResultCachedPhoto.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedPhotoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultCachedPhotoToJson(this);
}
