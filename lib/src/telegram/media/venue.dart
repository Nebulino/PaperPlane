/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of media;

/// This object represents a venue.
///
/// https://core.telegram.org/bots/api#venue
@JsonSerializable(includeIfNull: false)
class Venue {
  Location location;
  String title;
  String address;
  String foursquare_id;
  String foursquare_type;

  Venue(
      {this.location,
      this.title,
      this.address,
      this.foursquare_id,
      this.foursquare_type});

  factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);

  Map<String, dynamic> toJson() => _$VenueToJson(this);
}
