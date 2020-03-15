/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// ChosenInlineResult telegram.types Class
/// https://core.telegram.org/bots/api#choseninlineresult
@JsonSerializable()
class ChosenInlineResult {
  String result_id;
  User from;
  Location location;
  String inline_message_id;
  String query;

  ChosenInlineResult(
      {this.result_id,
      this.from,
      this.location,
      this.inline_message_id,
      this.query});

  factory ChosenInlineResult.fromJson(Map<String, dynamic> json) =>
      _$ChosenInlineResultFromJson(json);

  Map<String, dynamic> toJson() => _$ChosenInlineResultToJson(this);
}
