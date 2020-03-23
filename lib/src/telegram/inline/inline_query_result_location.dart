/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a location on a map.
/// By default, the location will be sent by the user.
/// Alternatively,
/// you can use *input_message_content* to send a
/// message with the specified content instead of the location.
///
/// **Note:** This will only work in Telegram
/// versions released after 9 April, 2016.
///
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultlocation
@JsonSerializable()
class InlineQueryResultLocation implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  double latitude;
  double longitude;
  String title;
  int live_period;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;
  String thumb_url;
  int thumb_width;
  int thumb_height;

  InlineQueryResultLocation(
      {this.id,
      this.type = 'location',
      this.latitude,
      this.longitude,
      this.title,
      this.live_period,
      this.reply_markup,
      this.input_message_content,
      this.thumb_url,
      this.thumb_width,
      this.thumb_height});

  factory InlineQueryResultLocation.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultLocationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultLocationToJson(this);
}
