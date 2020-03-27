/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a [result] of an inline query that was chosen by the user and sent to their chat partner.
///
/// **Note:** It is necessary to enable [inline feedback] via [@Botfather] in order to receive these objects in updates.
///
/// [result]: https://core.telegram.org/bots/api#inlinequeryresult
/// [inline feedback]: https://core.telegram.org/bots/inline#collecting-feedback
/// [@Botfather]: https://t.me/botfather
///
/// https://core.telegram.org/bots/api#choseninlineresult
@JsonSerializable(includeIfNull: false)
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
