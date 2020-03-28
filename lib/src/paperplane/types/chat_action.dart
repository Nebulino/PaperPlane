/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

/// Contains every type of [chat action]
///
/// [chat action] : [API]
class ChatAction {
  final String _action;

  static const ChatAction TYPING = ChatAction._('TYPING');
  static const ChatAction UPLOAD_PHOTO = ChatAction._('UPLOAD_PHOTO');
  static const ChatAction RECORD_VIDEO = ChatAction._('RECORD_VIDEO');
  static const ChatAction UPLOAD_VIDEO = ChatAction._('UPLOAD_VIDEO');
  static const ChatAction RECORD_AUDIO = ChatAction._('RECORD_AUDIO');
  static const ChatAction UPLOAD_AUDIO = ChatAction._('UPLOAD_AUDIO');
  static const ChatAction UPLOAD_DOCUMENT = ChatAction._('UPLOAD_DOCUMENT');
  static const ChatAction FIND_LOCATION = ChatAction._('FIND_LOCATION');
  static const ChatAction RECORD_VIDEO_NOTE = ChatAction._('RECORD_VIDEO_NOTE');
  static const ChatAction UPLOAD_VIDEO_NOTE = ChatAction._('UPLOAD_VIDEO_NOTE');

  const ChatAction._(this._action);

  @override
  String toString() => _action;
}
