//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

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
  /// Type of the result, must be *game*.
  @JsonKey(name: 'type', required: true)
  @override
  String type;

  /// Unique identifier for this result, 1-64 bytes.
  @JsonKey(name: 'id', required: true)
  @override
  String id;

  /// Short name of the game.
  @JsonKey(name: 'game_short_name', required: true)
  String gameShortName;

  /// *Optional.* [Inline keyboard] attached to the message.
  ///
  /// [Inline keyboard]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
  @JsonKey(name: 'reply_markup')
  InlineKeyboardMarkup replyMarkup;

  InlineQueryResultGame({
    this.type = 'game',
    this.id,
    this.gameShortName,
    this.replyMarkup,
  });

  factory InlineQueryResultGame.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultGameFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultGameToJson(this);
}
