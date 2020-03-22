/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

/// A list of entity type you can find inside a message
class MessageEntityType {
  final String _type;

  const MessageEntityType._(this._type);

  static const MessageEntityType Bold = MessageEntityType._('bold');

  static const MessageEntityType Italic = MessageEntityType._('italic');

  static const MessageEntityType Code = MessageEntityType._('code');

  static const MessageEntityType Strike = MessageEntityType._('strike');

  static const MessageEntityType Underline = MessageEntityType._('underline');

  static const MessageEntityType Pre = MessageEntityType._('pre');

  static const MessageEntityType BotCommand =
      MessageEntityType._('bot_command');

  static const MessageEntityType CashTag = MessageEntityType._('cashtag');

  static const MessageEntityType Email = MessageEntityType._('email');

  static const MessageEntityType HashTag = MessageEntityType._('hashtag');

  static const MessageEntityType Mention = MessageEntityType._('mention');

  static const MessageEntityType PhoneNumber =
      MessageEntityType._('phone_number');

  static const MessageEntityType TextLink = MessageEntityType._('text_link');

  static const MessageEntityType TextMention =
      MessageEntityType._('text_mention');

  static const MessageEntityType Url = MessageEntityType._('url');

  @override
  String toString() => _type;
}
