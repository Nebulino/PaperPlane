/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:paperplane/paperplane.dart';
import 'package:paperplane/paperplane_exceptions.dart';
import 'package:paperplane/src/core/dispatcher.dart';
import 'package:paperplane/src/core/mode/long_polling.dart';
import 'package:paperplane/src/core/updater.dart';
import 'package:paperplane/src/helpers/paperplane_bot.dart';
import 'package:paperplane/types.dart';

/// This is the brain of my Wrapper.
/// You need to "import 'package:paperplane/paperplane.dart"
/// to create a simple Bot using PaperPlane.
class PaperPlane {
  Telegram api;
  Dispatcher dispatcher;

  Bot _me;
  LongPolling _polling;

  bool _is_flying = false;

  static PaperPlane _paperplane;

  PaperPlane._({this.api, bool dispatcher_sync}) {
    dispatcher = Dispatcher(sync: (dispatcher_sync ??= false));
  }

  /// Creates a PaperPlane instance from a String token.
  PaperPlane.createBot(String token, {bool dispatcher_sync})
      : this._(api: Telegram(token), dispatcher_sync: dispatcher_sync);

  /// Creates a PaperPlane instance from a BotFile.
  PaperPlane.createFromFile(BotFile botFile, {bool dispatcher_sync})
      : this._(
            api: Telegram(botFile.data.token),
            dispatcher_sync: dispatcher_sync);

  /// Creates a PaperPlane instance from a Telegram Object.
  PaperPlane.importApi(Telegram api) : this._(api: api);

  /// Buckle up. We're turning on the engine.
  /// It starts the api stuff...
  Future<Bot> engine() async {
    if (api.token == null) {
      throw PaperPlaneException(description: 'Api not created correctly');
    }
    await api.methods.getBot().then(_crosscheck);
    _paperplane = this;
    return _me;
  }

  /// Fasten your seat belts, we're going to fly.
  /// It set up the bot information.
  void _crosscheck(Bot bot) {
    print('Crosscheck...');
    _me = bot;
    _me.token = api.token;
    _is_flying = true;
    print('${_me.username} is ready to fly!');
  }

  /// Returns a Bot object if TelegramAPI is correct.
  Bot get me => _me;

  bool get isFlying => _is_flying;

  Updater get updater => _polling.updater;

  static PaperPlane get fly => _paperplane;

  // Export a Botfile in the same directory of the executable.
  void export({String file_name}) {
    BotFile.export(_me, file_name: file_name);
  }

  // Create an extension instead?
  Future<void> startPolling() async {
    _polling ??= LongPolling(api)
      ..start()
      // Every update inside the onUpdate are being dispatched.
      ..updater.onUpdate().listen((update) {
        _polling_helper(update);
      });
  }

  /// It helps sending the updates into the dispatcher.
  void _polling_helper(Update update) => dispatcher.dispatchUpdate(update);
}
