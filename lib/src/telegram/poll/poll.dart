//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

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

  /// *Optional.* Text that is shown when a user chooses an incorrect answer
  /// or taps on the lamp icon in a quiz-style poll, 0-200 characters.
  @JsonKey(name: 'explanation')
  String explanation;

  /// *Optional.* Special entities like usernames, URLs, bot commands, etc.
  /// that appear in the *explanation*.
  @JsonKey(name: 'explanation_entities')
  List<MessageEntity> explanation_entities;

  /// *Optional.*
  /// Amount of time in seconds the poll will be active after creation.
  @JsonKey(
      name: 'open_period',
      fromJson: _durationFromTelegramSeconds,
      toJson: _durationToTelegramSeconds)
  Duration openPeriod;

  /// *Optional.*
  /// Point in time (Unix timestamp) when the poll will be automatically closed.
  @JsonKey(
      name: 'close_date',
      fromJson: _dateTimeFromTelegramInt,
      toJson: _dateTimeToTelegramInt)
  DateTime closeDate;

  Poll({
    this.id,
    this.question,
    this.options,
    this.totalVoterCount,
    this.isClosed,
    this.isAnonymous,
    this.type,
    this.allowsMultipleAnswers,
    this.correctOptionID,
    this.explanation,
    this.explanation_entities,
    this.openPeriod,
    this.closeDate,
  });

  factory Poll.fromJson(Map<String, dynamic> json) => _$PollFromJson(json);

  Map<String, dynamic> toJson() => _$PollToJson(this);

  /// Helper: converts into a Duration type from
  /// a int received from Telegram API.
  static Duration _durationFromTelegramSeconds(int seconds) =>
      seconds == null ? null : Duration(seconds: seconds);

  /// Helper: converts into a Duration type into
  /// a int to be sent to Telegram API.
  static int _durationToTelegramSeconds(Duration duration) =>
      duration?.inSeconds;

  /// Helper: converts into a DateTime type from
  /// a int (unix time) received from Telegram API.
  static DateTime _dateTimeFromTelegramInt(int unixTime) => unixTime == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);

  /// Helper: converts from a DateTime type into
  /// a int (unix time) to be sent to Telegram API.
  static int _dateTimeToTelegramInt(DateTime dateTime) => dateTime == null
      ? null
      : (dateTime.millisecondsSinceEpoch / 1000).round();
}
