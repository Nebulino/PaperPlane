/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of core;

/// Contains information about why a request was unsuccessful.
///
/// https://core.telegram.org/bots/api#responseparameters
@JsonSerializable(includeIfNull: false)
class ResponseParameters {
  int migrate_to_chat_id;
  int retry_after;

  ResponseParameters({this.migrate_to_chat_id, this.retry_after});

  factory ResponseParameters.fromJson(Map<String, dynamic> json) =>
      _$ResponseParametersFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseParametersToJson(this);
}
