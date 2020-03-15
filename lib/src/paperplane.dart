/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

/// PaperPlane Class
/// This is the brain of my Wrapper.
/// You need to import at least this to create a simple bot.
class PaperPlane {
  String _token;

  PaperPlane._(this._token);

  PaperPlane.createBot(String token) : this._(token);

  String get token => _token;
}
