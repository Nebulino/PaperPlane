/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'dart:io' as io;

import 'package:paperplane/paperplane.dart';
import 'package:paperplane/paperplane_helpers.dart';

void main() {
  // => Choose how to create your bot~:
  // - BotFile (async)
  // - io.File
  // - token
  var paperplane = PaperPlane.createFromFile(
      BotFile.fromFile(io.File('./PaperPlaneBot.json')));

  // => Turn on the engines. Okay it's a paperplane, but still looks cool?
  // If you want to export the bot for future use when turning off.
  // I know, this example loads a file, but I guess you know that exporting is
  // good if you create a bot using a TOKEN for example.
  paperplane
      .engine()
      .then((bot) => paperplane.export(bot, file_name: 'bot.json'));

  // => Choose your "flying" mode:
  // - polling
  // - webhook (to be implemented)
  paperplane.startPolling(clean: true);

  // => Do you want to work directly with Telegram Methods and shrink the code?
  var methods = paperplane.api.methods;

  // => If you want to work with updates, you can!
  // 1. get the updater.
  var updater = paperplane.updater.onUpdate();

  // 2. set your conditions!
  updater
      .where((onUpdate) => onUpdate.message.text != null)
      .where((onUpdate) => onUpdate.message.text == 'uwu')
      .listen((update) => methods.sendMessage(update.message.chat.id, 'owo'));

  // => If you want to manage events, just do as follows...
  paperplane
      .onMessage()
      .where((message) => message.text == 'cacca')
      .listen((message) => methods.sendPhoto(
          // Send an image from a URL.
          message.chat.id,
          'https://pbs.twimg.com/media/ETObHKAUUAE7nSM.jpg'));

  paperplane
      .onMessage()
      .where((message) => message.text == 'voice')
      .listen((message) => methods.sendAudio(
          // Send a File. You can also send a blob (Uint8List).
          message.chat.id,
          io.File('./files/voices/kokodayo.ogg')));

  // For more information about the methods, watch the wiki
  // (on pub.dev: https://pub.dev/packages/paperplane)!

  // you can also directly reply a message entity if you want...
  paperplane
      .onMessage()
      .where((message) => message.text == 'reply')
      .listen((message) => message.replyText('sure!'));

  // MORE TO COME... STAY SAFE AND FLY~ (Corona Virus FREE PaperPlanes)
}
