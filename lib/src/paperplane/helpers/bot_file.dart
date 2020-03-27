/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'dart:convert';
import 'dart:io' as io;

import 'package:meta/meta.dart';
import 'package:paperplane/helpers.dart';
import 'package:paperplane/paperplane_exceptions.dart';

/// It creates a virtual BotFile from a file.
/// It helps creating a PaperPlane instance from a file.
class BotFile {
  String file_name;
  final Bot _bot;

  BotFile._(this._bot, {this.file_name});

  /// Creates a BotFile from a file.
  factory BotFile.fromFile(io.File file) {
    return BotFile._(Bot.fromJson(jsonDecode(file.readAsStringSync())));
  }

  /// Import a PaperPlane file.
  static Future<BotFile> import(
      {String file_name = 'PaperPlaneBot.json'}) async {
    if (io.FileSystemEntity.typeSync('${file_name}') ==
        io.FileSystemEntityType.notFound) {
      throw PaperPlaneException(description: 'BotFile not found.');
    }

    final content = await io.File(file_name).readAsString();
    return BotFile._(Bot.fromJson(jsonDecode(content)), file_name: file_name);
  }

  /// Export a PaperPlane file.
  static void export(
      {@required Bot bot, String file_name = 'PaperPlaneBot.json'}) {
    io.File(file_name).writeAsString(jsonEncode(bot.toJson()));
  }

  /// Get a [Bot] object from the file.
  Bot get data => _bot;
}