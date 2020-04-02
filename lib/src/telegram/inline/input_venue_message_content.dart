/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents the [content] of a venue message to be sent
/// as the result of an inline query.
///
/// [content]: https://core.telegram.org/bots/api#inputmessagecontent
///
/// https://core.telegram.org/bots/api#inputvenuemessagecontent
@JsonSerializable(includeIfNull: false)
class InputVenueMessageContent implements InputMessageContent {
  /// Latitude of the venue in degrees.
  @JsonKey(name: 'latitude', required: true)
  double latitude;

  /// Longitude of the venue in degrees.
  @JsonKey(name: 'longitude', required: true)
  double longitude;

  /// Name of the venue.
  @JsonKey(name: 'title', required: true)
  String title;

  /// Address of the venue.
  @JsonKey(name: 'address', required: true)
  String address;

  /// Optional. Foursquare identifier of the venue, if known.
  @JsonKey(name: 'foursquare_id')
  String foursquareID;

  /// Optional. Foursquare type of the venue, if known.
  /// (For example, “arts_entertainment/default”,
  /// “arts_entertainment/aquarium” or “food/icecream”.)
  @JsonKey(name: 'foursquare_type')
  String foursquareType;

  InputVenueMessageContent(
      {this.latitude,
      this.longitude,
      this.title,
      this.address,
      this.foursquareID,
      this.foursquareType});

  factory InputVenueMessageContent.fromJson(Map<String, dynamic> json) =>
      _$InputVenueMessageContentFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InputVenueMessageContentToJson(this);
}
