import 'package:paperplane/helpers.dart';
/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:paperplane/paperplane.dart';
import 'package:test/test.dart';

// Some PaperPlane tests
void main() {
  group('A group of tests', () {
    PaperPlane paperplane;
    String token;
    ParseMode parse_mode;

    setUp(() {
      token = 'Just a token.';
      paperplane = PaperPlane.createBot(token: token);
      parse_mode = null;
    });

    test('PaperPlane Tests', () {
      expect(paperplane, isA<PaperPlane>());
      expect(paperplane.token, isA<String>());
      expect(parse_mode.toString(), isA<String>());
    });
  });
}
