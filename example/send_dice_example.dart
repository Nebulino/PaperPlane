/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:paperplane/helpers.dart';
import 'package:paperplane/paperplane.dart';

import 'test_values.dart';

// Usage of v4.7 api.
void main() async {
  final paperplane = PaperPlane.createBot(token: TestValues.TOKEN);

  await paperplane.engine();

  final api = paperplane.api;

  await api.sendDice(
      chatID: ChatID.fromID(TestValues.MASTER), emoji: DiceType.dart);

  await api.sendDice(
      chatID: ChatID.fromID(TestValues.MASTER), emoji: DiceType.dice);
}
