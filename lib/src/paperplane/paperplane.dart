/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'dart:io' as io;

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
  bool _isFlying = false;

  Dispatcher dispatcher;

  PaperPlane._(this._telegram) {
    dispatcher = Dispatcher();
    _logger = Logger(
        level: Level.info,
        printer: PrettyPrinter(
            methodCount: 0,
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
    _isFlying = true;
    _logger.i('${_me.username} is ready to fly!');
  }

  /// It exports a [BotFile] in the same directory of the executable.
  void export({@required Bot bot, String file_name}) {
    if (_isFlying) {
      _logger.i('Exporting occurs on landing...');
      BotFile.export(bot: bot, fileName: file_name);
    } else {
      throw PaperPlaneException(
          description: "Can't export... "
              'PaperPlane is not ready...');
    }
  }

  /// Setup the [LongPolling] before running it.
  void setupLongPolling(
      {int offset = 0,
      int limit = 100,
      int timeout = 30,
      List<String> allowedUpdates}) {
    _polling = LongPolling(_telegram,
        offset: offset,
        limit: limit,
        timeout: timeout,
        allowedUpdates: allowedUpdates,
        );
  }

  /// Starts a [Bot] as [LongPolling].
  Future<void> startPolling(
      {bool clean = false}) async {
    _logger.d('Start Polling with clean: ${false}');
    if (_isFlying) {
      throw PaperPlaneException(
          description: 'The PaperPlane is already on air.');
    }

    _polling ??= LongPolling(_telegram);
    _polling
      ..start(clean)
      ..updater.onUpdate().listen(_dispatchUpdate);
  }

  /// It sends the [Update] in the [Dispatcher].
  void _dispatchUpdate(Update update) => dispatcher.dispatchUpdate(update);

  /// Setup the [Webhook] before running it.
  Future<void> setupWebhook(
      {@required url,
      @required secretPath,
      io.File certificate,
      io.File privateKey,
      int port = 443,
      bool toBeUploaded = false,
      int maxConnections = Constant.MAX_WEBHOOK_CONNECTIONS,
      List<UpdateType> allowedUpdates}) async {
    _webhook = Webhook(_telegram,
        url: url,
        secretPath: secretPath,
        certificate: certificate,
        privateKey: privateKey);

    await _webhook.setWebhook();
  }

  /// Starts a [Bot] as [Webhook].
  Future<void> startWebhook() async {
    if (_isFlying) {
      throw PaperPlaneException(
          description: 'The PaperPlane is already on air.');
    }

    if (_webhook == null) {
      throw PaperPlaneException(description: 'No webhook to be runned.');
    }

    await _webhook.start();
    _webhook.updater.onUpdate().listen(_dispatchUpdate);
  }

  /// It stops the bot.
  void stop() {
    if (!_isFlying) {
      throw PaperPlaneException(description: 'No PaperPlane departed.');
    }
    _logger.i('${_me.username} is landing...');

    if (_polling != null) {
      _polling.stopPolling();
      _polling = null;
    }

    if (_webhook != null) {
      _webhook.deleteWebhook().then((_) {
        _webhook.stopServer();
        _webhook = null;
      });
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
    if (_polling != null) {
      return _polling.updater;
    } else if (_webhook != null) {
      return _webhook.updater;
    } else {
      throw PaperPlaneException(
          description: "Can't get the updater, "
              "You're not running the bot as LongPolling or Webhook.");
    }
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
  bool get isFlying => _isFlying;
}
