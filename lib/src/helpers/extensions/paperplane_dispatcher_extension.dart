/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:paperplane/paperplane.dart';
import 'package:paperplane/src/core/dispatcher.dart';
import 'package:paperplane/types.dart';

/// It extends PaperPlane by adding dispatcher functions.
extension PaperPlaneDispatcherExtension on PaperPlane {
  Dispatcher get _dispatcher => dispatcher;

  Stream<Message> onMessage() => _dispatcher.onMessage();

  Stream<Message> onEditedMessage() => _dispatcher.onEditedMessage();

  Stream<Message> onChannelPost() => _dispatcher.onChannelPost();

  Stream<Message> onEditedChannelPost() => _dispatcher.onEditedChannelPost();

  Stream<InlineQuery> onInlineQuery() => _dispatcher.onInlineQuery();

  Stream<CallbackQuery> onCallbackQuery() => _dispatcher.onCallbackQuery();

  Stream<ShippingQuery> onShippingQuery() => _dispatcher.onShippingQuery();

  Stream<PreCheckoutQuery> onPreCheckoutQuery() =>
      _dispatcher.onPreCheckoutQuery();

  Stream<Poll> onPoll() => _dispatcher.onPoll();
}
