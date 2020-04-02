/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a venue.
/// By default, the venue will be sent by the user.
/// Alternatively,
/// you can use *input_message_content* to send a
/// message with the specified content instead of the venue.
///
/// **Note:** This will only work in Telegram
/// versions released after 9 April, 2016.
///
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultvenue
@JsonSerializable(includeIfNull: false)
class InlineQueryResultVenue implements InlineQueryResult {
  /// Type of the result, must be *venue*.
  @JsonKey(name: 'type', required: true)
  @override
  String type;

  /// Unique identifier for this result, 1-64 bytes.
  @JsonKey(name: 'id', required: true)
  @override
  String id;

  /// Latitude of the venue location in degrees.
  @JsonKey(name: 'latitude', required: true)
  double latitude;

  /// Longitude of the venue location in degrees.
  @JsonKey(name: 'longitude', required: true)
  double longitude;

  /// Title of the venue.
  @JsonKey(name: 'title', required: true)
  String title;

  /// Address of the venue.
  @JsonKey(name: 'address', required: true)
  String address;

  /// *Optional.* Foursquare identifier of the venue if known.
  @JsonKey(name: 'foursquare_id')
  String foursquareID;

  /// *Optional.* Foursquare type of the venue, if known.
  /// (For example, “arts_entertainment/default”,
  /// “arts_entertainment/aquarium” or “food/icecream”.).
  @JsonKey(name: 'foursquare_type')
  String foursquareType;

  /// *Optional.* [Inline keyboard] attached to the message.
  ///
  /// [Inline keyboard]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
  @JsonKey(name: 'reply_markup')
  InlineKeyboardMarkup replyMarkup;

  /// *Optional.* Content of the message to be sent instead of the venue.
  @JsonKey(name: 'input_message_content')
  InputMessageContent inputMessageContent;

  /// *Optional.* Url of the thumbnail for the result.
  @JsonKey(name: 'thumb_url')
  String thumbUrl;

  /// *Optional.* Thumbnail width.
  @JsonKey(name: 'thumb_width')
  int thumbWidth;

  /// *Optional.* Thumbnail height.
  @JsonKey(name: 'thumb_height')
  int thumbHeight;

  InlineQueryResultVenue(
      {this.type = 'venue',
      this.id,
      this.latitude,
      this.longitude,
      this.title,
      this.address,
      this.foursquareID,
      this.foursquareType,
      this.replyMarkup,
      this.inputMessageContent,
      this.thumbUrl,
      this.thumbWidth,
      this.thumbHeight});

  factory InlineQueryResultVenue.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultVenueFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultVenueToJson(this);
}
