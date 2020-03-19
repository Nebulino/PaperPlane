/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents the [content] of a location message
/// to be sent as the result of an inline query.
///
/// [content]: https://core.telegram.org/bots/api#inputmessagecontent
///
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
