/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'dart:io' as io;

import 'package:paperplane/paperplane.dart';

// Just an example of Bot
void main() async {
  // var bot = PaperPlane.createBot('TOKEN');
  var bot = PaperPlane.createFromFile(
      await BotFile.import(file_name: 'PaperPlaneBot.json'));
  await bot.init();

  // Information from Telegram
  await bot.api.methods.getMe().then((response) {
    print('getMe:\n${response.toJson()}');
  });

  // Information from PaperPlane
  print('getBot:\n${bot.me.toJson().toString()}');

  // Exporting the Bot infos
  // bot.export(file_name: 'PaperPlaneBot.json');

  var methods = Methods.fromBot(bot);
  // fake chat_id
  var a_chat_id = 999999999;
  
  await methods.sendMessage(a_chat_id, 'Hi from PaperPlane!');
}
