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
  String id;
  User from;
  Message message;
  String inline_message_id;
  String chat_instance;
  String data;
  String game_short_name;

  CallbackQuery(
      {this.id,
      this.from,
      this.message,
      this.inline_message_id,
      this.chat_instance,
      this.data,
      this.game_short_name});

  factory CallbackQuery.fromJson(Map<String, dynamic> json) =>
      _$CallbackQueryFromJson(json);

  Map<String, dynamic> toJson() => _$CallbackQueryToJson(this);
}
