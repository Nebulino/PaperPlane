//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

import 'dart:core';
import 'dart:math' show Random;

/// It helps generating a random uuid for [sendMediaGroup].
class Uuid {
  static const _chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  static const _length = 6;

  static String generate() {
    final random = Random(DateTime.now().millisecondsSinceEpoch);
    var uuid = '';

    for (var i = 0; i < _length; i++) {
      uuid += _chars[random.nextInt(_chars.length)];
    }

    return uuid;
  }
}
