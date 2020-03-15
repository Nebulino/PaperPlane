/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// InlineQueryResultGame telegram.types Class
/// https://core.telegram.org/bots/api#inlinequeryresultgame
@JsonSerializable()
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
