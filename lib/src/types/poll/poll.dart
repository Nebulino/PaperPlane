/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of poll;

/// Poll telegram.types Class
/// https://core.telegram.org/bots/api#poll
@JsonSerializable()
class Poll {
  String id;
  String question;
  List<PollOption> options;
  bool is_closed;

  Poll({this.id, this.question, this.options, this.is_closed});

  factory Poll.fromJson(Map<String, dynamic> json) => _$PollFromJson(json);

  Map<String, dynamic> toJson() => _$PollToJson(this);
}
