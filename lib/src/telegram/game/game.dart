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
@JsonSerializable(includeIfNull: false)
class Game {
  /// Title of the game.
  @JsonKey(name: 'title', required: true)
  String title;

  /// Description of the game.
  @JsonKey(name: 'description', required: true)
  String description;

  /// Photo that will be displayed in the game message in chats.
  @JsonKey(name: 'photo', required: true)
  List<PhotoSize> photo;

  /// *Optional.* Brief description of the game or high scores
  /// included in the game message.
  /// Can be automatically edited to include current high scores
  /// for the game when the bot calls [setGameScore],
  /// or manually edited using [editMessageText].
  /// 0-4096 characters.
  @JsonKey(name: 'text', required: true)
  String text;

  /// *Optional.* Special entities that appear in text, such as usernames,
  /// URLs, bot commands, etc.
  @JsonKey(name: 'text_entities', required: true)
  List<MessageEntity> textEntities;

  /// *Optional.* Animation that will be displayed in the game message in chats.
  /// Upload via [BotFather]
  ///
  /// [BotFather]: https://t.me/botfather
  @JsonKey(name: 'animation', required: true)
  Animation animation;

  Game(
      {this.title,
      this.description,
      this.photo,
      this.text,
      this.textEntities,
      this.animation});

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  Map<String, dynamic> toJson() => _$GameToJson(this);
}
