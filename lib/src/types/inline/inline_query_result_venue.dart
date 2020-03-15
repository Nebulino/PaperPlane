/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// InlineQueryResultVenue telegram.types Class
/// https://core.telegram.org/bots/api#inlinequeryresultvenue
@JsonSerializable()
class InlineQueryResultVenue implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  double latitude;
  double longitude;
  String title;
  String address;
  String foursquare_id;
  String foursquare_type;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  String thumb_url;
  int thumb_width;
  int thumb_height;

  InlineQueryResultVenue(
      {this.id,
      this.type = 'venue',
      this.latitude,
      this.longitude,
      this.title,
      this.address,
      this.foursquare_id,
      this.foursquare_type,
      this.reply_markup,
      this.input_message_content,
      this.thumb_url,
      this.thumb_width,
      this.thumb_height});

  factory InlineQueryResultVenue.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultVenueFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultVenueToJson(this);
}