/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:paperplane/src/core/methods.dart';
import 'package:paperplane/src/tools/http_client.dart';

/// Telegram Class
/// It helps connecting http_client and methods.
/// [_token] A token for using the Telegram API (required)
class Telegram {
  final HttpClient _client = HttpClient();
  final String _token;
  Methods _methods;

  Telegram(this._token) {
    _methods = Methods(this);
  }

  HttpClient get client => _client;

  String get token => _token;

  Methods get methods => _methods;
}
