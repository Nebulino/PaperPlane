/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// InlineQueryResult telegram.types Class
/// https://core.telegram.org/bots/api#inlinequeryresult
@JsonSerializable()
class InlineQueryResult {
  String type;
  String id;

  InlineQueryResult({this.type, this.id});

  factory InlineQueryResult.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultFromJson(json);

  Map<String, dynamic> toJson() => _$InlineQueryResultToJson(this);
}
