/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// This object represents an incoming inline query.
/// When the user sends an empty query,
/// your bot could return some default or trending results.
///
/// https://core.telegram.org/bots/api#inlinequery
@JsonSerializable(includeIfNull: false)
class InlineQuery {
  /// Unique identifier for this query.
  @JsonKey(name: 'id', required: true)
  String id;

  /// Sender.
  @JsonKey(name: 'from', required: true)
  User from;

  /// *Optional.* Sender location,
  /// only for bots that request user location.
  @JsonKey(name: 'location')
  Location location;

  /// *Optional.* Sender location,
  /// only for bots that request user location.
  @JsonKey(name: 'query', required: true)
  String query;

  /// Offset of the results to be returned,
  /// can be controlled by the bot.
  @JsonKey(name: 'offset', required: true)
  String offset;

  InlineQuery({
    this.id,
    this.from,
    this.location,
    this.query,
    this.offset,
  });

  factory InlineQuery.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryFromJson(json);

  Map<String, dynamic> toJson() => _$InlineQueryToJson(this);
}
