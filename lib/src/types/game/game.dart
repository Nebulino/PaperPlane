/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of game;

/// This object represents a game.
/// Use BotFather to create and edit games,
/// their short names will act as unique identifiers.
///
/// https://core.telegram.org/bots/api#game
@JsonSerializable()
class Game {
  String title;
  String description;
  List<PhotoSize> photo;
  String text;
  List<MessageEntity> text_entities;
  Animation animation;

  Game(
      {this.title,
      this.description,
      this.photo,
      this.text,
      this.text_entities,
      this.animation});

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  Map<String, dynamic> toJson() => _$GameToJson(this);
}
