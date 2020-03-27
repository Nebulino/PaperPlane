/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a [Game].
///
/// **Note:** This will only work in Telegram versions released
/// after October 1, 2016.
/// Older clients will not display any inline results if
/// a game result is among them.
///
/// [Game]: https://core.telegram.org/bots/api#games
///
/// https://core.telegram.org/bots/api#inlinequeryresultgame
@JsonSerializable(includeIfNull: false)
class InlineQueryResultGame implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String game_short_name;
  InlineKeyboardMarkup reply_markup;

  InlineQueryResultGame(
      {this.id, this.type = 'game', this.game_short_name, this.reply_markup});

  factory InlineQueryResultGame.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultGameFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultGameToJson(this);
}
