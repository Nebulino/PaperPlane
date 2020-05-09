//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

/// Contains every type of [sendDice] animations.
///
/// [sendDice] : https://telegram.org/blog/400-million#bullseye
enum DiceType {
  dice,
  dart,
}

extension DiceTypeExtension on DiceType {
  String get emoji {
    switch (this) {
      case DiceType.dice:
        return '🎲';
      case DiceType.dart:
        return '🎯';
      default:
        return null;
    }
  }
}
