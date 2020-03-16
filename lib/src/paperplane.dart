/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:paperplane/paperplane.dart';
import 'package:paperplane/paperplane_exceptions.dart';
import 'package:paperplane/src/helpers/paperplane_bot.dart';

/// PaperPlane Class
/// This is the brain of my Wrapper.
/// You need to import at least this to create a simple bot.
class PaperPlane {
  Telegram api;
  Bot _me;

  bool isReady = false;

  PaperPlane._({this.api});

  PaperPlane.createBot(String token) : this._(api: Telegram(token));

  PaperPlane.createFromFile(BotFile botFile)
      : this._(api: Telegram(botFile.data.token));

  PaperPlane.importApi(Telegram api) : this._(api: api);

  Future<PaperPlane> init() async {
    if (api.token == null) {
      throw PaperPlaneException(description: 'Api not created correctly');
    }
    await api.methods.getBot().then(_botSelfSetup);
    return this;
  }

  void _botSelfSetup(Bot bot) {
    _me = bot;
    _me.token = api.token;
    isReady = true;
  }

  Bot get me => _me;

  void export({String file_name}) {
    BotFile.export(_me, file_name: file_name);
  }
}
