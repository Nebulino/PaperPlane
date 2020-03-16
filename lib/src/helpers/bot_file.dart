/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'dart:convert';
import 'dart:io' as io;

import 'package:paperplane/paperplane.dart';
import 'package:paperplane/paperplane_exceptions.dart';

/// BotFile Class
/// It creates a virtual BotFile from a file.
/// It helps creating a PaperPlane instance from a file.
/// Because Dart doesn't allow Futures in constructor...
class BotFile {
  String file_name;
  final Bot _bot;

  BotFile._(this._bot, {this.file_name});

  static Future<BotFile> import(
      {String file_name = 'PaperPlaneBot.json'}) async {
    if (io.FileSystemEntity.typeSync('${file_name}') ==
        io.FileSystemEntityType.notFound) {
      throw PaperPlaneException(description: 'BotFile not found');
    }

    var content = await io.File(file_name).readAsString();
    return BotFile._(Bot.fromData(jsonDecode(content)), file_name: file_name);
  }

  static void export(Bot bot, {String file_name = 'PaperPlaneBot.json'}) {
    io.File(file_name).writeAsString(jsonEncode(bot.toJson()));
  }

  Bot get data {
    return _bot;
  }
}
