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

    setUp(() {
      token = 'Just a token.';
      paperplane = PaperPlane.createBot(token);
    });

    test('PaperPlane Tests', () {
      expect(paperplane, isA<PaperPlane>());
      expect(paperplane.token, isA<String>());
    });
  });
}
