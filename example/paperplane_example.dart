/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:paperplane/paperplane.dart';

// Just an example of Bot
void main() {
  var token = 'TOKEN';
  var bot = PaperPlane.createBot(token);
  print(bot.token);
}
