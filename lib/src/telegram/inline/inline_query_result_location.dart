/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a location on a map.
/// By default, the location will be sent by the user.
/// Alternatively,
/// you can use *input_message_content* to send a
/// message with the specified content instead of the location.
///
/// **Note:** This will only work in Telegram
/// versions released after 9 April, 2016.
///
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultlocation
@JsonSerializable(includeIfNull: false)
class InlineQueryResultLocation implements InlineQueryResult {
  /// Type of the result, must be *location*.
  @JsonKey(name: 'type', required: true)
  @override
  String type;

  /// Unique identifier for this result, 1-64 bytes.
  @JsonKey(name: 'id', required: true)
  @override
  String id;

  /// Location latitude in degrees.
  @JsonKey(name: 'latitude', required: true)
  double latitude;

  /// Location longitude in degrees.
  @JsonKey(name: 'longitude', required: true)
  double longitude;

  /// Location title.
  @JsonKey(name: 'title', required: true)
  String title;

  /// *Optional.* Period in seconds for which the location can be updated,
  /// should be between 60 and 86400.
  @JsonKey(
      name: 'live_period',
      fromJson: _durationFromTelegramSeconds,
      toJson: _durationToTelegramSeconds)
  Duration live_period;

  /// *Optional.* [Inline keyboard] attached to the message.
  ///
  /// [Inline keyboard]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
  @JsonKey(name: 'reply_markup')
  InlineKeyboardMarkup replyMarkup;

  /// 	*Optional.* Content of the message to be sent instead of the location.
  @JsonKey(name: 'input_message_content')
  InputMessageContent inputMessageContent;

  /// *Optional.* Url of the thumbnail for the result.
  @JsonKey(name: 'thumb_url')
  String thumb_url;

  /// *Optional.* Thumbnail width.
  @JsonKey(name: 'thumb_width')
  int thumb_width;

  /// *Optional.* Thumbnail height.
  @JsonKey(name: 'thumb_height')
  int thumb_height;

  InlineQueryResultLocation(
      {this.type = 'location',
      this.id,
      this.latitude,
      this.longitude,
      this.title,
      this.live_period,
      this.replyMarkup,
      this.inputMessageContent,
      this.thumb_url,
      this.thumb_width,
      this.thumb_height});

  factory InlineQueryResultLocation.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultLocationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultLocationToJson(this);

  /// Helper: converts into a Duration type from
  /// a int received from Telegram API.
  static Duration _durationFromTelegramSeconds(int seconds) =>
      seconds == null ? null : Duration(seconds: seconds);

  /// Helper: converts into a Duration type into
  /// a int to be sent to Telegram API.
  static int _durationToTelegramSeconds(Duration duration) =>
      duration?.inSeconds;
}
