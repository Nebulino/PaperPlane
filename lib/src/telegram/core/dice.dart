/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of core;

/// This object represents a Dice.
///
/// https://core.telegram.org/bots/api#dice
@JsonSerializable(includeIfNull: false)
class Dice {
  int value;

  Dice({this.value});

  factory Dice.fromJson(Map<String, dynamic> json) => _$DiceFromJson(json);

  Map<String, dynamic> toJson() => _$DiceToJson(this);
}
