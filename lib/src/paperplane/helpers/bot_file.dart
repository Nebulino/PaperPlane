//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

import 'dart:convert';
import 'dart:io' as io;

import 'package:meta/meta.dart';
import 'package:paperplane/helpers.dart';
import 'package:paperplane/paperplane_exceptions.dart';

/// It creates a virtual BotFile from a file.
/// It helps creating a PaperPlane instance from a file.
class BotFile {
  String fileName;
  final Bot _bot;

  BotFile._(
    this._bot, {
    this.fileName,
  });

  /// Creates a BotFile from a file.
  factory BotFile.fromFile(
    io.File file,
  ) {
    return BotFile._(Bot.fromJson(jsonDecode(file.readAsStringSync())));
  }

  /// Import a PaperPlane file.
  static Future<BotFile> import({
    String fileName = 'PaperPlaneBot.json',
  }) async {
    if (io.FileSystemEntity.typeSync('${fileName}') ==
        io.FileSystemEntityType.notFound) {
      throw PaperPlaneException(description: 'BotFile not found.');
    }

    final content = await io.File(fileName).readAsString();
    return BotFile._(
      Bot.fromJson(jsonDecode(content)),
      fileName: fileName,
    );
  }

  /// Export a PaperPlane file.
  static void export({
    @required Bot bot,
    String fileName = 'PaperPlaneBot.json',
  }) {
    io.File(fileName).writeAsString(jsonEncode(bot.toJson()));
  }

  /// Get a [Bot] object from the file.
  Bot get data => _bot;
}
