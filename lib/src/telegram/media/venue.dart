//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

part of media;

/// This object represents a venue.
///
/// https://core.telegram.org/bots/api#venue
@JsonSerializable(includeIfNull: false)
class Venue {
  /// Venue location.
  @JsonKey(name: 'location', required: true)
  Location location;

  /// Name of the venue.
  @JsonKey(name: 'title', required: true)
  String title;

  /// Address of the venue.
  @JsonKey(name: 'address', required: true)
  String address;

  /// *Optional.* Foursquare identifier of the venue.
  @JsonKey(name: 'foursquare_id')
  String foursquareID;

  /// *Optional.*
  /// Foursquare type of the venue.
  /// (For example, “arts_entertainment/default”,
  /// “arts_entertainment/aquarium” or “food/icecream”.)
  @JsonKey(name: 'foursquare_type')
  String foursquareType;

  Venue({
    this.location,
    this.title,
    this.address,
    this.foursquareID,
    this.foursquareType,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);

  Map<String, dynamic> toJson() => _$VenueToJson(this);
}
