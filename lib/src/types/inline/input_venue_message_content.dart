/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// InputVenueMessageContent telegram.types Class
/// https://core.telegram.org/bots/api#inputvenuemessagecontent
@JsonSerializable()
class InputVenueMessageContent implements InputMessageContent {
  double latitude;
  double longitude;
  String title;
  String address;
  String foursquare_id;
  String foursquare_type;

  InputVenueMessageContent(
      {this.latitude,
      this.longitude,
      this.title,
      this.address,
      this.foursquare_id,
      this.foursquare_type});

  factory InputVenueMessageContent.fromJson(Map<String, dynamic> json) =>
      _$InputVenueMessageContentFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InputVenueMessageContentToJson(this);
}
