/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// InlineQuery telegram.types Class
/// https://core.telegram.org/bots/api#inlinequery
@JsonSerializable()
class InlineQuery {
  String id;
  User from;
  Location location;
  String query;
  String offset;

  InlineQuery({this.id, this.from, this.location, this.query, this.offset});

  factory InlineQuery.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryFromJson(json);

  Map<String, dynamic> toJson() => _$InlineQueryToJson(this);
}
