//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

part of inline;

/// Represents the [content] of a location message
/// to be sent as the result of an inline query.
///
/// [content]: https://core.telegram.org/bots/api#inputmessagecontent
///
/// https://core.telegram.org/bots/api#inputlocationmessagecontent
@JsonSerializable(includeIfNull: false)
class InputLocationMessageContent implements InputMessageContent {
  /// Latitude of the location in degrees.
  @JsonKey(name: 'latitude', required: true)
  double latitude;

  /// Longitude of the location in degrees.
  @JsonKey(name: 'longitude', required: true)
  double longitude;

  /// *Optional.* Period in seconds for which the location can be updated,
  /// should be between 60 and 86400.
  @JsonKey(
      name: 'live_period',
      fromJson: _durationFromTelegramSeconds,
      toJson: _durationToTelegramSeconds)
  Duration live_period;

  InputLocationMessageContent({
    this.latitude,
    this.longitude,
    this.live_period,
  });

  factory InputLocationMessageContent.fromJson(Map<String, dynamic> json) =>
      _$InputLocationMessageContentFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InputLocationMessageContentToJson(this);

  /// Helper: converts into a Duration type from
  /// a int received from Telegram API.
  static Duration _durationFromTelegramSeconds(int seconds) =>
      seconds == null ? null : Duration(seconds: seconds);

  /// Helper: converts into a Duration type into
  /// a int to be sent to Telegram API.
  static int _durationToTelegramSeconds(Duration duration) =>
      duration?.inSeconds;
}
