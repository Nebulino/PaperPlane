/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of poll;

/// This object contains information about a poll.
///
/// https://core.telegram.org/bots/api#poll
@JsonSerializable(includeIfNull: false)
class Poll {
  /// Unique poll identifier.
  @JsonKey(name: 'id', required: true)
  String id;

  /// Poll question, 1-255 characters.
  @JsonKey(name: 'question', required: true)
  String question;

  /// List of poll options.
  @JsonKey(name: 'options', required: true)
  List<PollOption> options;

  /// Total number of users that voted in the poll.
  @JsonKey(name: 'total_voter_count', required: true)
  int totalVoterCount;

  /// True, if the poll is closed.
  @JsonKey(name: 'is_closed', required: true)
  bool isClosed;

  /// True, if the poll is anonymous.
  @JsonKey(name: 'is_anonymous', required: true)
  bool isAnonymous;

  /// Poll type, currently can be “regular” or “quiz”.
  @JsonKey(name: 'type', required: true)
  PollType type;

  /// True, if the poll allows multiple answers
  @JsonKey(name: 'allows_multiple_answers', required: true)
  bool allowsMultipleAnswers;

  /// *Optional.* 0-based identifier of the correct answer option.
  /// Available only for polls in the quiz mode, which are closed,
  /// or was sent (not forwarded) by the bot or to the private chat
  /// with the bot.
  @JsonKey(name: 'correct_option_id')
  int correctOptionID;

  Poll(
      {this.id,
      this.question,
      this.options,
      this.totalVoterCount,
      this.isClosed,
      this.isAnonymous,
      this.type,
      this.allowsMultipleAnswers,
      this.correctOptionID});

  factory Poll.fromJson(Map<String, dynamic> json) => _$PollFromJson(json);

  Map<String, dynamic> toJson() => _$PollToJson(this);
}
