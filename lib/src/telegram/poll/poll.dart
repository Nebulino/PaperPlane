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
  String id;
  String question;
  List<PollOption> options;
  int total_voter_count;
  bool is_closed;
  bool is_anonymous;
  String type;
  bool allows_multiple_answers;
  int correct_option_id;

  Poll(
      {this.id,
      this.question,
      this.options,
      this.total_voter_count,
      this.is_closed,
      this.is_anonymous,
      this.type,
      this.allows_multiple_answers,
      this.correct_option_id});

  factory Poll.fromJson(Map<String, dynamic> json) => _$PollFromJson(json);

  Map<String, dynamic> toJson() => _$PollToJson(this);
}
