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
  String poll_id;
  User user;
  List<int> options_ids;

  PollAnswer({this.poll_id, this.user, this.options_ids});

  factory PollAnswer.fromJson(Map<String, dynamic> json) =>
      _$PollAnswerFromJson(json);

  Map<String, dynamic> toJson() => _$PollAnswerToJson(this);
}
