//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

import 'dart:async';

import 'package:paperplane/telegram.dart';

/// It dispatches the updates into different queues.
class Dispatcher {
  // All queues for different events...
  final StreamController<Message> _messageDispatcher =
      StreamController.broadcast();
  final StreamController<Message> _editedMessageDispatcher =
      StreamController.broadcast();
  final StreamController<Message> _channelPostDispatcher =
      StreamController.broadcast();
  final StreamController<Message> _editedChannelPostDispatcher =
      StreamController.broadcast();
  final StreamController<InlineQuery> _inlineQueryDispatcher =
      StreamController.broadcast();
  final StreamController<ChosenInlineResult> _chosenInlineResultDispatcher =
      StreamController.broadcast();
  final StreamController<CallbackQuery> _callbackQueryDispatcher =
      StreamController.broadcast();
  final StreamController<ShippingQuery> _shippingQueryDispatcher =
      StreamController.broadcast();
  final StreamController<PreCheckoutQuery> _preCheckoutQueryDispatcher =
      StreamController.broadcast();
  final StreamController<Poll> _pollDispatcher =
      StreamController.broadcast();
  final StreamController<PollAnswer> _pollAnswerDispatcher =
      StreamController.broadcast();

  Dispatcher();

  /// Dispatch the update into each queues.
  void dispatchUpdate(Update update) {
    if (update.message != null) {
      _messageDispatcher.add(update.message!);
    }
    if (update.editedMessage != null) {
      _editedMessageDispatcher.add(update.editedMessage!);
    }
    if (update.channelPost != null) {
      _channelPostDispatcher.add(update.channelPost!);
    }
    if (update.editedChannelPost != null) {
      _editedChannelPostDispatcher.add(update.editedChannelPost!);
    }
    if (update.inlineQuery != null) {
      _inlineQueryDispatcher.add(update.inlineQuery!);
    }
    if (update.chosenInlineResult != null) {
      _chosenInlineResultDispatcher.add(update.chosenInlineResult!);
    }
    if (update.callbackQuery != null) {
      _callbackQueryDispatcher.add(update.callbackQuery!);
    }
    if (update.shippingQuery != null) {
      _shippingQueryDispatcher.add(update.shippingQuery!);
    }
    if (update.preCheckoutQuery != null) {
      _preCheckoutQueryDispatcher.add(update.preCheckoutQuery!);
    }
    if (update.poll != null) {
      _pollDispatcher.add(update.poll!);
    }
    if (update.pollAnswer != null) {
      _pollAnswerDispatcher.add(update.pollAnswer!);
    }
  }

  /// When called returns the stream.
  Stream<Message> onMessage() => _messageDispatcher.stream;

  /// When called returns the stream.
  Stream<Message> onEditedMessage() => _editedMessageDispatcher.stream;

  /// When called returns the stream.
  Stream<Message> onChannelPost() => _channelPostDispatcher.stream;

  /// When called returns the stream.
  Stream<Message> onEditedChannelPost() => _editedChannelPostDispatcher.stream;

  /// When called returns the stream.
  Stream<InlineQuery> onInlineQuery() => _inlineQueryDispatcher.stream;

  /// When called returns the stream.
  Stream<ChosenInlineResult> onChosenInlineResult() =>
      _chosenInlineResultDispatcher.stream;

  /// When called returns the stream.
  Stream<CallbackQuery> onCallbackQuery() => _callbackQueryDispatcher.stream;

  /// When called returns the stream.
  Stream<ShippingQuery> onShippingQuery() => _shippingQueryDispatcher.stream;

  /// When called returns the stream.
  Stream<PreCheckoutQuery> onPreCheckoutQuery() =>
      _preCheckoutQueryDispatcher.stream;

  /// When called returns the stream.
  Stream<Poll> onPoll() => _pollDispatcher.stream;

  /// When called returns the stream.
  Stream<PollAnswer> onPollAnswer() => _pollAnswerDispatcher.stream;
}
