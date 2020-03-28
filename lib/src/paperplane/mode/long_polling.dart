/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:paperplane/helpers.dart';
import 'package:paperplane/paperplane.dart';
import 'package:paperplane/paperplane_exceptions.dart';

/// It helps creating a long polling bot.
class LongPolling {
  int offset;
  int limit;
  int timeout;
  List<UpdateType> allowed_updates;

  Updater updater;

  final Telegram _telegram;

  bool _polling = false;

  LongPolling(this._telegram,
      {this.offset = Constant.POLLING_OFFSET,
      this.limit = Constant.POLLING_LIMIT,
      this.timeout = Constant.POLLING_TIMEOUT,
      this.allowed_updates,
      bool sync_updater}) {
    if (limit > Constant.POLLING_LIMIT || limit < 1) {
      throw PaperPlaneException(description: 'Polling Offset is incoherent.');
    }

    if (timeout > Constant.MAX_POLLING_TIMEOUT) {
      throw PaperPlaneException(description: 'Timeout is not valid.');
    }

    updater = Updater(sync_updater);
  }

  /// Returns the status of the polling.
  bool get isPolling => _polling;

  /// It starts the bot ignoring previous not handled updates.
  void _cleanUpdates() {
    offset = -1;
    timeout = 0;
  }

  /// It starts the polling.
  void start(bool clean) {
    if (!_polling) {
      _polling = true;
      if (clean) _cleanUpdates();
      _long_polling();
    } else {
      PaperPlaneException(
          description: 'PaperPlane is already in polling mode.');
    }
  }

  /// It cycle the polling.
  void _long_polling() {
    if (_polling) {
      _telegram.methods
          .getUpdates(
              offset: offset,
              limit: limit,
              timeout: timeout,
              allowed_updates: allowed_updates)
          .then((updates) {
        if (updates.isNotEmpty) {
          for (var update in updates) {
            // It adds all the updates in the queue.
            updater.updateQueue(update);
            offset = update.update_id + 1;
          }
        }
        _long_polling();
      });
    }
  }

  /// It stops the polling.
  void stop_polling() {
    if (!_polling) {
      throw PaperPlaneException(description: 'No polling is running.');
    }
    _polling = false;
  }
}
