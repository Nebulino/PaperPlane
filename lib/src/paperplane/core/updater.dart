/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'dart:async';

import 'package:paperplane/telegram.dart';

/// It helps fetching the updates.
/// The user can use this to manage the updates directly.
class Updater {
  StreamController<Update> _queue;

  Updater(bool sync) {
    _queue = StreamController.broadcast(sync: sync);
  }

  /// It adds a new update in the update queue.
  void updateQueue(Update update) {
    _queue.add(update);
  }

  /// Returns the stream. Helps listening the [Update] stream inside
  /// the [LongPolling] object.
  Stream<Update> onUpdate() => _queue.stream;
}
