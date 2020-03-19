/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of game;

/// A placeholder, currently holds no information.
/// Use [BotFather] to set up your game.
///
/// [BotFather]: https://t.me/botfather
///
/// https://core.telegram.org/bots/api#callbackgame
@JsonSerializable()
class CallbackGame {
  CallbackGame();

  factory CallbackGame.fromJson(Map<String, dynamic> json) =>
      _$CallbackGameFromJson(json);

  Map<String, dynamic> toJson() => _$CallbackGameToJson(this);
}
