/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

/// Contains every type of [chat action].
///
/// [chat action] : [API]
enum ChatAction {
  TYPING,
  UPLOAD_PHOTO,
  RECORD_VIDEO,
  RECORD_AUDIO,
  UPLOAD_AUDIO,
  UPLOAD_DOCUMENT,
  FIND_LOCATION,
  RECORD_VIDEO_NOTE,
  UPLOAD_VIDEO_NOTE
}

extension ChatActionExtension on ChatAction {
  String get action {
    switch (this) {
      case ChatAction.TYPING:
        return 'typing';
      case ChatAction.UPLOAD_PHOTO:
        return 'upload_photo';
      case ChatAction.RECORD_VIDEO:
        return 'record_video';
      case ChatAction.RECORD_AUDIO:
        return 'record_audio';
      case ChatAction.UPLOAD_AUDIO:
        return 'upload_audio';
      case ChatAction.UPLOAD_DOCUMENT:
        return 'upload_document';
      case ChatAction.FIND_LOCATION:
        return 'find_location';
      case ChatAction.RECORD_VIDEO_NOTE:
        return 'record_video_note';
      case ChatAction.UPLOAD_VIDEO_NOTE:
        return 'upload_video_note';
      default:
        return null;
    }
  }
}
