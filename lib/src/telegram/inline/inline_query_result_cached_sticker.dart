/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a link to a sticker stored on the
/// Telegram servers.
/// By default, this sticker will be sent by the user.
/// Alternatively, you can use *input_message_content* to
/// send a message with the specified content instead
/// of the sticker.
///
/// **Note:** This will only work in Telegram versions
/// released after 9 April, 2016 for static stickers
/// and after 06 July, 2019 for animated stickers.
///
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedsticker
@JsonSerializable(includeIfNull: false)
class InlineQueryResultCachedSticker implements InlineQueryResult {
  /// Type of the result, must be *sticker*.
  @JsonKey(name: 'type', required: true)
  @override
  String type;

  /// Unique identifier for this result, 1-64 bytes.
  @JsonKey(name: 'id', required: true)
  @override
  String id;

  /// A valid file identifier of the sticker
  @JsonKey(name: 'sticker_file_id', required: true)
  String stickerFileID;

  /// *Optional.* [Inline keyboard] attached to the message.
  ///
  /// [Inline keyboard]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
  @JsonKey(name: 'reply_markup')
  InlineKeyboardMarkup replyMarkup;

  /// *Optional.* Content of the message to be sent instead of the sticker.
  @JsonKey(name: 'input_message_content')
  InputMessageContent inputMessageContent;

  InlineQueryResultCachedSticker(
      {this.type = 'sticker',
      this.id,
      this.stickerFileID,
      this.replyMarkup,
      this.inputMessageContent});

  factory InlineQueryResultCachedSticker.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedStickerFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultCachedStickerToJson(this);
}
