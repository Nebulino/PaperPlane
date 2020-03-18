/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'dart:io' as io;

import 'package:paperplane/paperplane.dart';

void main() {
  // => Choose how to create your bot~:
  // - BotFile (async)
  // - io.File
  // - token
  var bot = PaperPlane.createFromFile(
      BotFile.fromFile(io.File('./PaperPlaneBot.json')));

  // => Turn on the engines. Okay it's a paperplane, but still looks cool?
  bot.engine();

  // => Choose your "flying" mode:
  // - polling
  // - webhook (to be implemented)
  bot.startPolling();

  // => Do you want to work directly with Telegram Methods and shrink the code?
  var methods = bot.api.methods;

  // => If you want to work with updates, you can!
  // 1. get the updater.
  var updater = bot.updater.onUpdate();

  // 2. set your conditions!
  updater
      .where((onUpdate) => onUpdate.message.text == 'uwu')
      .listen((update) => methods.sendMessage(update.message.chat.id, 'owo'));

  // => If you want to manage events, just do as follows...
  bot
      .onMessage()
      .where((message) => message.text == 'cacca')
      .listen((message) => methods.sendPhoto(
          // Send an image from a URL.
          message.chat.id,
          'https://pbs.twimg.com/media/ETObHKAUUAE7nSM.jpg'));

  bot
      .onMessage()
      .where((message) => message.text == 'voice')
      .listen((message) => methods.sendAudio(
          // Send a File. You can also send a blob (Uint8List).
          message.chat.id,
          io.File('./files/voices/kokodayo.ogg')));

  // For more information about the methods, watch the wiki
  // (on pub.dev: https://pub.dev/packages/paperplane)!

  // you can also directly reply a message entity if you want...
  bot
      .onMessage()
      .where((message) => message.text == 'reply')
      .listen((message) => message.replyText('sure!'));

  // MORE TO COME... STAY SAFE AND FLY~ (Corona Virus FREE PaperPlanes)
}
