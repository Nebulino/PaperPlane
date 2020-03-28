/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

/// It helps getting and setting an [InputMedia] type.
class InputMediaType {
  final String _type;

  const InputMediaType._(this._type);

  factory InputMediaType.Animation() {
    return InputMediaType._('animation');
  }

  factory InputMediaType.Audio() {
    return InputMediaType._('audio');
  }

  factory InputMediaType.Photo() {
    return InputMediaType._('photo');
  }

  factory InputMediaType.Document() {
    return InputMediaType._('document');
  }

  factory InputMediaType.Video() {
    return InputMediaType._('video');
  }

  String get type => _type;

  @override
  String toString() => _type;
}
