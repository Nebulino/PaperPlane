/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of game;

/// CallbackGame telegram.types Class
/// https://core.telegram.org/bots/api#callbackgame
@JsonSerializable()
class CallbackGame {
  CallbackGame();

  factory CallbackGame.fromJson(Map<String, dynamic> json) =>
      _$CallbackGameFromJson(json);

  Map<String, dynamic> toJson() => _$CallbackGameToJson(this);
}
