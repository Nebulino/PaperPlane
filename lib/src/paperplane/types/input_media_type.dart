/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

/// It helps getting and setting an [InputMedia] type.
class InputMediaType {
  final String _type;

  static const InputMediaType ANIMATION = InputMediaType._('animation');
  static const InputMediaType AUDIO = InputMediaType._('audio');
  static const InputMediaType PHOTO = InputMediaType._('photo');
  static const InputMediaType DOCUMENT = InputMediaType._('document');
  static const InputMediaType VIDEO = InputMediaType._('video');

  const InputMediaType._(this._type);

  @override
  String toString() => _type;
}
