/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:paperplane/helpers.dart';
import 'package:paperplane/paperplane.dart';
import 'package:paperplane/paperplane_exceptions.dart';
import 'package:paperplane/src/paperplane/core/api.dart';
import 'package:paperplane/src/paperplane/core/dispatcher.dart';
import 'package:paperplane/src/paperplane/core/updater.dart';
import 'package:paperplane/src/paperplane/helpers/bot_file.dart';
import 'package:paperplane/src/paperplane/helpers/paperplane_bot.dart';
import 'package:paperplane/src/paperplane/mode/long_polling.dart';
import 'package:paperplane/src/paperplane/mode/webhook.dart';
import 'package:paperplane/telegram.dart';

/// This is the brain of my Wrapper.
/// You need at least "import 'package:paperplane/paperplane.dart'"
/// to create a simple Bot using PaperPlane.
class PaperPlane {
  static PaperPlane _paperplane;

  final Telegram _telegram;

  Logger _logger;
  LongPolling _polling;
  Webhook _webhook;
  Bot _me;
  bool _is_flying = false;

  Dispatcher dispatcher;

  PaperPlane._(this._telegram, {bool sync = false}) {
    dispatcher = Dispatcher(sync: sync);
    _logger = Logger(
        level: Level.info,
        printer: PrettyPrinter(
            methodCount: 2,
            errorMethodCount: 8,
            lineLength: 120,
            colors: true,
            printEmojis: true,
            printTime: false));
  }

  /// Creates a PaperPlane instance from a token.
  PaperPlane.createBot({@required String token})
      : this._(Telegram(token: token));

  /// Creates a PaperPlane instance from a [BotFile] object.
  PaperPlane.createFromFile({@required BotFile bot_file})
      : this._(Telegram(token: (bot_file.data.token)));

  /// Creates a PaperPlane instance from a [Telegram] Object.
  PaperPlane.importTelegram({@required Telegram telegram}) : this._(telegram);

  /// Buckle up. We're turning on the engine.
  /// It starts the api stuff...
  Future<Bot> engine() async {
    _logger.d('Starting the engine~');
    if (_telegram.token == null) {
      throw PaperPlaneException(description: 'API not created correctly.');
    }

    await _telegram.methods.getBot().then(_crosscheck);
    _paperplane = this;
    return _me;
  }

  /// Fasten your seat belts, we're going to fly.
  /// It set up the [Bot] information.
  void _crosscheck(Bot bot) {
    _logger.d('Starting the crosscheck.');
    _me = bot;
    _me.token = _telegram.token;
    _is_flying = true;
    _logger.i('${_me.username} is ready to fly!');
  }

  /// It exports a [BotFile] in the same directory of the executable.
  void export({@required Bot bot, String file_name}) {
    if (_is_flying) {
      _logger.i('Exporting occurs on landing...');
      BotFile.export(bot: bot, file_name: file_name);
    } else {
      throw PaperPlaneException(
          description: "Can't export... "
              'PaperPlane is not ready...');
    }
  }

  void setupLongPolling(
      {int offset = 0,
      int limit = 100,
      int timeout = 30,
      List<UpdateType> allowed_updates,
      bool sync_updater = false}) {
    _polling = LongPolling(_telegram,
        offset: offset,
        limit: limit,
        timeout: timeout,
        allowed_updates: allowed_updates,
        sync_updater: sync_updater);
  }

  /// Starts a [Bot] as [LongPolling].
  Future<void> startPolling(
      {bool clean = false, bool sync_updater = false}) async {
    _logger.d('Start Polling with clean: ${false}');
    if (_is_flying) {
      throw PaperPlaneException(
          description: 'The PaperPlane is already on air.');
    }

    _polling ??= LongPolling(_telegram, sync_updater: sync_updater)
      ..start(clean)
      ..updater.onUpdate().listen((update) => _polling_helper);
  }

  /// It sends the updates in the dispatcher.
  void _polling_helper(Update update) => dispatcher.dispatchUpdate(update);

  /// It stops the bot.
  void stop() {
    if (!_is_flying) {
      throw PaperPlaneException(description: 'No PaperPlane departed.');
    }
    _logger.i('${_me.username} is landing...');

    if (_polling != null) {
      _polling.stop_polling();
      _polling = null;
    }

    if (_webhook != null) {
      // TODO: implement webhook
      _webhook = null;
    }
  }

  /// It scraps the PaperPlane.
  void scrapPaperPlane() {
    _paperplane = null;
    _me = null;
  }

  /// Set a log level. The default is **Level.info**.
  void setLoggerLevel({@required Level level}) {
    Logger.level = level;
    _logger.d('Settings the logger level to ${level}.');
  }

  /// Get the [Updater] if you want to work directly with the [updates].
  ///
  /// [updates]: [Update]
  Updater get updater {
    if (_polling == null) {
      throw PaperPlaneException(
          description: "Can't get the updater, "
              "You're not running a LongPolling bot.");
    }
    return _polling.updater;
  }

  /// Returns the [PaperPlane] instance.
  static PaperPlane get fly => _paperplane;

  /// Returns all the methods possible.
  API get api => _telegram.methods;

  /// Returns the token.
  String get token => _telegram.token;

  /// Returns the [Logger] if you want to use it somewhere else...
  Logger get logger => _logger;

  /// Obtain the [Bot] object if created correctly.
  Bot get pilot => _me;

  /// Return **true** if the bot is running.
  bool get isFlying => _is_flying;
}
