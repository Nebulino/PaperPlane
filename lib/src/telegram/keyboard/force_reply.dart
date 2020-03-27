/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of keyboard;

/// Upon receiving a message with this object,
/// Telegram clients will display a reply interface to the user
/// (act as if the user has selected the bot‘s message and tapped ’Reply').
/// This can be extremely useful if you want to create user-friendly
/// step-by-step interfaces
/// without having to sacrifice [privacy mode].
///
/// **Example:** A [poll bot] for groups runs in privacy mode
/// (only receives commands, replies to its messages and mentions).
/// There could be two ways to create a new poll:
/// * Explain the user how to send a command with parameters
/// (e.g. /newpoll question answer1 answer2).
/// May be appealing for hardcore users but lacks modern day polish.
/// * Guide the user through a step-by-step process.
/// ‘Please send me your question’,
/// ‘Cool, now let’s add the first answer option‘, ’Great.
/// Keep adding answer options,
/// then send /done when you‘re ready’.
///
/// The last option is definitely more attractive.
/// And if you use [ForceReply] in your bot‘s questions,
/// it will receive the user’s answers even if it only receives replies,
/// commands and mentions — without any extra work for the user.
///
/// [privacy mode]: https://core.telegram.org/bots#privacy-mode
/// [poll bot]: https://t.me/PollBot
/// [ForceReply]: https://core.telegram.org/bots/api#forcereply
///
/// https://core.telegram.org/bots/api#forcereply
@JsonSerializable(includeIfNull: false)
class ForceReply implements ReplyMarkup {
  bool force_reply;
  bool selective;

  ForceReply({this.force_reply, this.selective});

  factory ForceReply.fromJson(Map<String, dynamic> json) =>
      _$ForceReplyFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ForceReplyToJson(this);
}
