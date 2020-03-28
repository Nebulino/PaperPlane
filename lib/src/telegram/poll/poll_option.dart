/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of poll;

/// This object contains information about one answer option in a poll.
///
/// https://core.telegram.org/bots/api#polloption
@JsonSerializable(includeIfNull: false)
class PollOption {
  String text;
  int voter_count;

  PollOption({this.text, this.voter_count});

  factory PollOption.fromJson(Map<String, dynamic> json) =>
      _$PollOptionFromJson(json);

  Map<String, dynamic> toJson() => _$PollOptionToJson(this);
}
