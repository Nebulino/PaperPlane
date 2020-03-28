/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

/// A list of update type, usable for filtering the updates.
class UpdateType {
  final String _type;

  static const UpdateType Message = UpdateType._('message');
  static const UpdateType EditedMessage = UpdateType._('edited_message');
  static const UpdateType ChannelPost = UpdateType._('channel_post');
  static const UpdateType EditedChannelPost =
      UpdateType._('edited_channel_post');
  static const UpdateType ChosenInlineResult =
      UpdateType._('chosen_inline_result');
  static const UpdateType CallbackQuery = UpdateType._('callback_query');
  static const UpdateType ShippingQuery = UpdateType._('shipping_query');
  static const UpdateType Poll = UpdateType._('poll');
  static const UpdateType PollAnswer = UpdateType._('poll_answer');

  const UpdateType._(this._type);

  @override
  String toString() => _type;
}
