//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

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
  UPLOAD_VIDEO_NOTE,
}

extension ChatActionExtension on ChatAction {
  String get action => switch (this) {
        ChatAction.TYPING => 'typing',
        ChatAction.UPLOAD_PHOTO => 'upload_photo',
        ChatAction.RECORD_VIDEO => 'record_video',
        ChatAction.RECORD_AUDIO => 'record_audio',
        ChatAction.UPLOAD_AUDIO => 'upload_audio',
        ChatAction.UPLOAD_DOCUMENT => 'upload_document',
        ChatAction.FIND_LOCATION => 'find_location',
        ChatAction.RECORD_VIDEO_NOTE => 'record_video_note',
        ChatAction.UPLOAD_VIDEO_NOTE => 'upload_video_note',
      };
}
