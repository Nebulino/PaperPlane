/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of poll;

/// This object represents an answer of a user in a non-anonymous poll.
///
/// https://core.telegram.org/bots/api#pollanswer
@JsonSerializable(includeIfNull: false)
class PollAnswer {
  /// Unique poll identifier.
  @JsonKey(name: 'poll_id', required: true)
  String pollID;

  /// The user, who changed the answer to the poll.
  @JsonKey(name: 'user', required: true)
  User user;

  /// 0-based identifiers of answer options, chosen by the user.
  /// May be empty if the user retracted their vote.
  @JsonKey(name: 'options_ids', required: true)
  List<int> optionsIDs;

  PollAnswer({this.pollID, this.user, this.optionsIDs});

  factory PollAnswer.fromJson(Map<String, dynamic> json) =>
      _$PollAnswerFromJson(json);

  Map<String, dynamic> toJson() => _$PollAnswerToJson(this);
}
