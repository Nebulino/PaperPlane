/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// InlineQueryResultCachedSticker telegram.types Class
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
