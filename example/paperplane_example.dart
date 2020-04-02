/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'dart:io' as io;

import 'package:logger/logger.dart';
import 'package:paperplane/helpers.dart';
import 'package:paperplane/paperplane.dart';

import 'test_values.dart';

/// A simple Example...
void main() {
  // => Choose how to create your bot~:
  // - BotFile (async)
  // - io.File
  // - token
  var paperplane = PaperPlane.createBot(token: TestValues.TOKEN);
  final master = ChatID.fromID(TestValues.MASTER);
  final dev_lab = ChatID.fromID(TestValues.DEV);

  // => Turn on the engines. Okay it's a paperplane, but still looks cool?
  // If you want to export the bot for future use when turning off.
  // I know, this example loads a file, but I guess you know that exporting is
  // good if you create a bot using a TOKEN for example.
  paperplane.engine()
    ..then((bot) => paperplane.export(bot: bot, file_name: 'bot.json'))
    ..then((bot) => paperplane.api.getChat(chatID: master).then((master_data) =>
        paperplane.api.sendMessage(
            chatID: master,
            text: "I'm departed master ${master_data.username}...")));

  paperplane.setLoggerLevel(level: Level.debug);

  // => Choose your "flying" mode:
  // - polling
  // - webhook (to be implemented)
  paperplane.startPolling(clean: true);

  // => Do you want to work directly with Telegram Methods and shrink the code?
  final api = paperplane.api;

  // => If you want to work with updates, you can!
  // 1. get the updater.
  final updater = paperplane.updater.onUpdate();

  // 2. set your conditions!
  updater
      .where((onUpdate) => onUpdate.message.text != null)
      .where((onUpdate) => onUpdate.message.text == 'uwu')
      .listen((update) {
    api.sendMessage(chatID: ChatID.fromID(update.message.chat.id), text: 'owo');
  });

  // => If you want to manage events, just do as follows...
  paperplane
      .onMessage()
      .where((message) => message.text == 'cacca')
      .listen((message) {
    api.sendPhoto(
        // Send an image from a URL.
        chatID: ChatID.fromID(message.chat.id),
        photo: Luggage.withLink(
            link: 'https://pbs.twimg.com/media/ETObHKAUUAE7nSM.jpg'));
  });

  paperplane.onMessage().where((message) => message.text == 'voice').listen(
      (message) => api.sendAudio(
          // Send a File. You can also send a blob (Uint8List).
          chatID: ChatID.fromID(message.chat.id),
          audio:
              Luggage.withFile(file: io.File('./files/voices/kokodayo.ogg'))));

  // For more information about the methods, watch the wiki
  // (on pub.dev: https://pub.dev/packages/paperplane)!

  // you can also directly reply a message entity if you want...
  paperplane
      .onMessage()
      .where((message) => message.text == 'reply')
      .listen((message) {
    message.replyText(text: 'sure!');
  });

  // MORE TO COME... STAY SAFE AND FLY~ (Corona Virus FREE PaperPlanes)
}
