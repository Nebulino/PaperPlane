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
@JsonSerializable()
class InlineQueryResultCachedSticker implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String sticker_file_id;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

  InlineQueryResultCachedSticker(
      {this.id,
      this.type = 'sticker',
      this.sticker_file_id,
      this.reply_markup,
      this.input_message_content});

  factory InlineQueryResultCachedSticker.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultCachedStickerFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultCachedStickerToJson(this);
}
