/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:meta/meta.dart';
import 'package:paperplane/src/paperplane/core/api.dart';
import 'package:paperplane/src/tools/telegram_client.dart';

/// It helps connecting http_client and methods.
/// It also contains the bot token.
/// It's the Telegram API headquarter, it builds all the methods.
class Telegram {
  final String _token;

  TelegramClient _client;
  API _api;

  Telegram._(this._token, {String proxy}) {
    _client = TelegramClient(token: _token, proxy: proxy);
    _api = API(_client);
  }

  /// Helps the user understanding how to create a [Telegram] object.
  Telegram({@required String token, String proxy})
      : this._(token, proxy: proxy);

  /// Return the token used to create the [APIs].
  ///
  /// [APIs]: [API]
  String get token => _token;

  /// Returns a [API] object, so the user can use every [telegram] methods.
  ///
  /// [telegram]
  API get methods => _api;
}
