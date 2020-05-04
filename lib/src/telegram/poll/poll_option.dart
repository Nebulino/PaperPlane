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
  /// Option text, 1-100 characters.
  @JsonKey(name: 'text', required: true)
  String text;

  /// Number of users that voted for this option.
  @JsonKey(name: 'voter_count', required: true)
  int voterCount;

  PollOption({
    this.text,
    this.voterCount,
  });

  factory PollOption.fromJson(Map<String, dynamic> json) =>
      _$PollOptionFromJson(json);

  Map<String, dynamic> toJson() => _$PollOptionToJson(this);
}
