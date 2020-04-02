/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of core;

/// This object represents a dice with random value from 1 to 6.
/// (Yes, we're aware of the *“proper”*
/// singular of *die*. But it's awkward,
/// and we decided to help it change. One dice at a time!)
///
/// https://core.telegram.org/bots/api#dice
@JsonSerializable(includeIfNull: false)
class Dice {
  /// Value of the dice, 1-6.
  @JsonKey(name: 'value', required: true)
  int value;

  Dice({this.value});

  factory Dice.fromJson(Map<String, dynamic> json) => _$DiceFromJson(json);

  Map<String, dynamic> toJson() => _$DiceToJson(this);
}
