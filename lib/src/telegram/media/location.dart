/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of media;

/// This object represents a point on the map.
///
/// https://core.telegram.org/bots/api#location
@JsonSerializable(includeIfNull: false)
class Location {
  double longitude;
  double latitude;

  Location({this.longitude, this.latitude});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson(Map<String, dynamic> json) =>
      _$LocationToJson(this);
}
