/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// InputLocationMessageContent telegram.types Class
/// https://core.telegram.org/bots/api#inputlocationmessagecontent
@JsonSerializable()
class InputLocationMessageContent implements InputMessageContent {
  double latitude;
  double longitude;
  int live_period;

  InputLocationMessageContent(
      {this.latitude, this.longitude, this.live_period});

  factory InputLocationMessageContent.fromJson(Map<String, dynamic> json) =>
      _$InputLocationMessageContentFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InputLocationMessageContentToJson(this);
}
