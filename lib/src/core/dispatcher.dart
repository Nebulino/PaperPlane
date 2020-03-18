/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'dart:async';

import 'package:paperplane/paperplane_exceptions.dart';
import 'package:paperplane/types.dart';

/// It dispatches the updates into different queues.
class Dispatcher {
  // All queues for different events...
  StreamController<Message> _message_dispatcher;
  StreamController<Message> _edited_message_dispatcher;
  StreamController<Message> _channel_post_dispatcher;
  StreamController<Message> _edited_channel_post_dispatcher;
  StreamController<InlineQuery> _inline_query_dispatcher;
  StreamController<ChosenInlineResult> _chosen_inline_result_dispatcher;
  StreamController<CallbackQuery> _callback_query_dispatcher;
  StreamController<ShippingQuery> _shipping_query_dispatcher;
  StreamController<PreCheckoutQuery> _precheckout_query_dispatcher;
  StreamController<Poll> _poll_dispatcher;

  Dispatcher({bool sync = false}) {
    // Creating all StreamControllers...
    _message_dispatcher = StreamController.broadcast(sync: sync);
    _edited_message_dispatcher = StreamController.broadcast(sync: sync);
    _channel_post_dispatcher = StreamController.broadcast(sync: sync);
    _edited_channel_post_dispatcher = StreamController.broadcast(sync: sync);
    _chosen_inline_result_dispatcher = StreamController.broadcast(sync: sync);
    _callback_query_dispatcher = StreamController.broadcast(sync: sync);
    _shipping_query_dispatcher = StreamController.broadcast(sync: sync);
    _poll_dispatcher = StreamController.broadcast(sync: sync);
  }

  // Dispatch the update into each queues.
  void dispatchUpdate(Update update) {
    if (update == null) {
      throw DispatcherException(description: 'Update received is null.');
    } else if (update.message != null) {
      _message_dispatcher.add(update.message);
    } else if (update.edited_message != null) {
      _edited_message_dispatcher.add(update.edited_message);
    } else if (update.channel_post != null) {
      _channel_post_dispatcher.add(update.channel_post);
    } else if (update.edited_channel_post != null) {
      _edited_channel_post_dispatcher.add(update.edited_channel_post);
    } else if (update.inline_query != null) {
      _inline_query_dispatcher.add(update.inline_query);
    } else if (update.chosen_inline_result != null) {
      _chosen_inline_result_dispatcher.add(update.chosen_inline_result);
    } else if (update.callback_query != null) {
      _callback_query_dispatcher.add(update.callback_query);
    } else if (update.shipping_query != null) {
      _shipping_query_dispatcher.add(update.shipping_query);
    } else if (update.pre_checkout_query != null) {
      _precheckout_query_dispatcher.add(update.pre_checkout_query);
    } else if (update.poll != null) {
      _poll_dispatcher.add(update.poll);
    } else {
      throw DispatcherException(description: 'The update can not be handled.');
    }
  }

  // They returns different streams of different type of updates.
  Stream<Message> onMessage() => _message_dispatcher.stream;

  Stream<Message> onEditedMessage() => _edited_message_dispatcher.stream;

  Stream<Message> onChannelPost() => _channel_post_dispatcher.stream;

  Stream<Message> onEditedChannelPost() =>
      _edited_channel_post_dispatcher.stream;

  Stream<InlineQuery> onInlineQuery() => _inline_query_dispatcher.stream;

  Stream<ChosenInlineResult> onChosenInlineResult() =>
      _chosen_inline_result_dispatcher.stream;

  Stream<CallbackQuery> onCallbackQuery() => _callback_query_dispatcher.stream;

  Stream<ShippingQuery> onShippingQuery() => _shipping_query_dispatcher.stream;

  Stream<PreCheckoutQuery> onPreCheckoutQuery() =>
      _precheckout_query_dispatcher.stream;

  Stream<Poll> onPoll() => _poll_dispatcher.stream;
}
