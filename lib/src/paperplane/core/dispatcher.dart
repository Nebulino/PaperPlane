//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

import 'dart:async';

import 'package:paperplane/paperplane_exceptions.dart';
import 'package:paperplane/telegram.dart';

/// It dispatches the updates into different queues.
class Dispatcher {
  // All queues for different events...
  StreamController<Message> _messageDispatcher;
  StreamController<Message> _editedMessageDispatcher;
  StreamController<Message> _channelPostDispatcher;
  StreamController<Message> _editedChannelPostDispatcher;
  StreamController<InlineQuery> _inlineQueryDispatcher;
  StreamController<ChosenInlineResult> _chosenInlineResultDispatcher;
  StreamController<CallbackQuery> _callbackQueryDispatcher;
  StreamController<ShippingQuery> _shippingQueryDispatcher;
  StreamController<PreCheckoutQuery> _preCheckoutQueryDispatcher;
  StreamController<Poll> _PollDispatcher;
  StreamController<PollAnswer> _pollAnswerDispatcher;

  /// It creates the Dispatcher that helps dividing each updates into different
  /// queue.
  Dispatcher() {
    // Creating all StreamControllers...
    _messageDispatcher = StreamController.broadcast();
    _editedMessageDispatcher = StreamController.broadcast();
    _channelPostDispatcher = StreamController.broadcast();
    _editedChannelPostDispatcher = StreamController.broadcast();
    _inlineQueryDispatcher = StreamController.broadcast();
    _chosenInlineResultDispatcher = StreamController.broadcast();
    _callbackQueryDispatcher = StreamController.broadcast();
    _shippingQueryDispatcher = StreamController.broadcast();
    _preCheckoutQueryDispatcher = StreamController.broadcast();
    _PollDispatcher = StreamController.broadcast();
    _pollAnswerDispatcher = StreamController.broadcast();
  }

  /// Dispatch the update into each queues.
  void dispatchUpdate(Update update) {
    if (update == null) {
      throw PaperPlaneException(
          description: 'Error while dispatching: the update is null.');
    } else if (update.message != null) {
      _messageDispatcher.add(update.message);
    } else if (update.editedMessage != null) {
      _editedMessageDispatcher.add(update.editedMessage);
    } else if (update.channelPost != null) {
      _channelPostDispatcher.add(update.channelPost);
    } else if (update.editedMessage != null) {
      _editedChannelPostDispatcher.add(update.editedChannelPost);
    } else if (update.inlineQuery != null) {
      _inlineQueryDispatcher.add(update.inlineQuery);
    } else if (update.chosenInlineResult != null) {
      _chosenInlineResultDispatcher.add(update.chosenInlineResult);
    } else if (update.callbackQuery != null) {
      _callbackQueryDispatcher.add(update.callbackQuery);
    } else if (update.shippingQuery != null) {
      _shippingQueryDispatcher.add(update.shippingQuery);
    } else if (update.preCheckoutQuery != null) {
      _preCheckoutQueryDispatcher.add(update.preCheckoutQuery);
    } else if (update.poll != null) {
      _PollDispatcher.add(update.poll);
    } else if (update.pollAnswer != null) {
      _pollAnswerDispatcher.add(update.pollAnswer);
    } else {
      throw PaperPlaneException(
          description: 'The update cannot be dispatched.');
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
  Stream<Poll> onPoll() => _PollDispatcher.stream;

  /// When called returns the stream.
  Stream<PollAnswer> onPollAnswer() => _pollAnswerDispatcher.stream;
}
