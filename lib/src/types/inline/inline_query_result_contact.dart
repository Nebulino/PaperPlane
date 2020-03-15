/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// InlineQueryResultCachedContact telegram.types Class
/// https://core.telegram.org/bots/api#inlinequeryresultcachedcontact
@JsonSerializable()
class InlineQueryResultContact implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String phone_number;
  String first_name;
  String last_name;
  String vcard;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  String thumb_url;
  int thumb_width;
  int thumb_height;

  InlineQueryResultContact(
      {this.id,
      this.type = 'contact',
      this.phone_number,
      this.first_name,
      this.last_name,
      this.vcard,
      this.reply_markup,
      this.input_message_content,
      this.thumb_url,
      this.thumb_width,
      this.thumb_height});

  factory InlineQueryResultContact.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultContactFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultContactToJson(this);
}
