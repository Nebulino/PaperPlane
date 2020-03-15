/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of media;

/// Location telegram.types Class
/// https://core.telegram.org/bots/api#location
@JsonSerializable()
class Location {
  double longitude;
  double latitude;

  Location({this.longitude, this.latitude});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson(Map<String, dynamic> json) =>
      _$LocationToJson(this);
}
