/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of game;

/// This object represents one row of the high scores
/// table for a game.
///
/// https://core.telegram.org/bots/api#gamehighscore
@JsonSerializable(includeIfNull: false)
class GameHighScore {
  int position;
  User user;
  int score;

  GameHighScore({this.position, this.user, this.score});

  factory GameHighScore.fromJson(Map<String, dynamic> json) =>
      _$GameHighScoreFromJson(json);

  Map<String, dynamic> toJson() => _$GameHighScoreToJson(this);
}
