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
