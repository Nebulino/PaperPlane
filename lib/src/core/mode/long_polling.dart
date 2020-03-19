/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:paperplane/paperplane.dart';
import 'package:paperplane/paperplane_exceptions.dart';
import 'package:paperplane/src/core/updater.dart';
import 'package:paperplane/src/helpers/constant.dart';

/// It helps creating a long polling bot.
class LongPolling {
  int offset;
  int limit;
  int timeout;
  List<String> allowed_updates;

  Updater updater;

  final Telegram _api;

  bool _polling = false;

  LongPolling(this._api,
      {this.offset = Constant.POLLING_OFFSET,
      this.limit = Constant.POLLING_LIMIT,
      this.timeout = Constant.POLLING_TIMEOUT,
      this.allowed_updates}) {
    if (limit > Constant.POLLING_LIMIT || limit < 1) {
      throw PaperPlaneException(description: 'Polling Offset is incoherent.');
    }

    if (timeout > Constant.MAX_POLLING_TIMEOUT) {
      throw PaperPlaneException(description: 'TIMEOUT not valid.');
    }

    updater = Updater();
  }

  bool get isPolling => _polling;

  void _cleanUpdates() {
    offset = -1;
    timeout = 0;
  }

  void start({bool clean = false}) {
    if (!_polling) {
      _polling = true;
      if (clean) _cleanUpdates();
      _long_polling();
    } else {
      PaperPlaneException(
          description: 'PaperPlane is already in polling mode.');
    }
  }

  void _long_polling() {
    if (_polling) {
      _api.methods
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

  void stop_polling() {
    if (!_polling) {
      throw PaperPlaneException(description: 'No polling is running.');
    }
    _polling = false;
  }
}
