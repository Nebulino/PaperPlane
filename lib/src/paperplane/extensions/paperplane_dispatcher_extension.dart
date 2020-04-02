/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:paperplane/paperplane.dart';
import 'package:paperplane/telegram.dart';

/// It extends PaperPlane by adding dispatcher functions.
extension PaperPlaneDispatcherExtension on PaperPlane {
  Dispatcher get _dispatcher => dispatcher;

  /// When called it calls the dispatcher.
  Stream<Message> onMessage() => _dispatcher.onMessage();

  /// When called it calls the dispatcher.
  Stream<Message> onEditedMessage() => _dispatcher.onEditedMessage();

  /// When called it calls the dispatcher.
  Stream<Message> onChannelPost() => _dispatcher.onChannelPost();

  /// When called it calls the dispatcher.
  Stream<Message> onEditedChannelPost() => _dispatcher.onEditedChannelPost();

  /// When called it calls the dispatcher.
  Stream<InlineQuery> onInlineQuery() => _dispatcher.onInlineQuery();

  /// When called it calls the dispatcher.
  Stream<CallbackQuery> onCallbackQuery() => _dispatcher.onCallbackQuery();

  /// When called it calls the dispatcher.
  Stream<ShippingQuery> onShippingQuery() => _dispatcher.onShippingQuery();

  /// When called it calls the dispatcher.
  Stream<PreCheckoutQuery> onPreCheckoutQuery() =>
      _dispatcher.onPreCheckoutQuery();

  /// When called it calls the dispatcher.
  Stream<Poll> onPoll() => _dispatcher.onPoll();

  /// When called it calls the dispatcher.
  Stream<PollAnswer> onPollAnswer() => _dispatcher.onPollAnswer();
}
