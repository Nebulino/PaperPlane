/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of core;

/// This object represents an incoming callback
/// query from a callback button in an [inline keyboard].
/// If the button that originated the query was attached
/// to a message sent by the bot, the field *message* will
/// be present. If the button was attached to a message
/// sent via the bot (in [inline mode]), the field
/// *inline_message_id* will be present.
/// Exactly one of the fields *data* or *game_short_name*
/// will be present.
///
/// **NOTE:** After the user presses a callback button,
/// Telegram clients will display a progress bar until you call
/// [answerCallbackQuery]. It is, therefore, necessary
/// to react by calling answerCallbackQuery even if no
/// notification to the user is needed
/// (e.g., without specifying any of the optional parameters).
///
/// [inline keyboard]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
/// [inline mode]: https://core.telegram.org/bots/api#inline-mode
/// [answerCallbackQuery]: https://core.telegram.org/bots/api#answercallbackquery
///
/// https://core.telegram.org/bots/api#callbackquery
@JsonSerializable(includeIfNull: false)
class CallbackQuery {
  /// Unique identifier for this query.
  @JsonKey(name: 'id', required: true)
  String id;

  /// Sender.
  @JsonKey(name: 'from', required: true)
  User from;

  /// Optional. Message with the callback button that originated the query.
  /// Note that message content and message date will not be available
  /// if the message is too old.
  @JsonKey(name: 'message')
  Message message;

  /// Optional. Identifier of the message sent via the bot in inline mode, that originated the query.
  @JsonKey(name: 'inline_message_id')
  String inlineMessageID;

  /// Global identifier, uniquely corresponding to the chat to which the
  /// message with the callback button was sent.
  /// Useful for high scores in [games].
  ///
  /// [games]: https://core.telegram.org/bots/api#games
  @JsonKey(name: 'chat_instance', required: true)
  String chatInstance;

  /// Optional. Data associated with the callback button.
  /// Be aware that a bad client can send arbitrary data in this field.
  @JsonKey(name: 'data')
  String data;

  /// Optional. Short name of a Game to be returned,
  /// serves as the unique identifier for the game.
  @JsonKey(name: 'game_short_name')
  String gameShortName;

  CallbackQuery(
      {this.id,
      this.from,
      this.message,
      this.inlineMessageID,
      this.chatInstance,
      this.data,
      this.gameShortName});

  factory CallbackQuery.fromJson(Map<String, dynamic> json) =>
      _$CallbackQueryFromJson(json);

  Map<String, dynamic> toJson() => _$CallbackQueryToJson(this);
}
