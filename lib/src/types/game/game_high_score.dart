/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of game;

/// Game High-score telegram.types Class
/// https://core.telegram.org/bots/api#gamehighscore
@JsonSerializable()
class GameHighScore {
  int position;
  User user;
  int score;

  GameHighScore({this.position, this.user, this.score});

  factory GameHighScore.fromJson(Map<String, dynamic> json) =>
      _$GameHighScoreFromJson(json);

  Map<String, dynamic> toJson() => _$GameHighScoreToJson(this);
}
