// GENERATED CODE - DO NOT MODIFY BY HAND

part of inputmedia;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InputMedia _$InputMediaFromJson(Map<String, dynamic> json) {
  return InputMedia(
    type: json['type'] as String,
    media: json['media'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
  );
}

Map<String, dynamic> _$InputMediaToJson(InputMedia instance) =>
    <String, dynamic>{
      'type': instance.type,
      'media': instance.media,
      'caption': instance.caption,
      'parse_mode': instance.parse_mode,
    };

InputMediaAnimation _$InputMediaAnimationFromJson(Map<String, dynamic> json) {
  return InputMediaAnimation(
    type: json['type'] as String,
    media: json['media'] as String,
    thumb: json['thumb'],
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    duration: json['duration'] as int,
  );
}

Map<String, dynamic> _$InputMediaAnimationToJson(
        InputMediaAnimation instance) =>
    <String, dynamic>{
      'caption': instance.caption,
      'media': instance.media,
      'parse_mode': instance.parse_mode,
      'type': instance.type,
      'thumb': instance.thumb,
      'width': instance.width,
      'height': instance.height,
      'duration': instance.duration,
    };

InputMediaAudio _$InputMediaAudioFromJson(Map<String, dynamic> json) {
  return InputMediaAudio(
    type: json['type'] as String,
    media: json['media'] as String,
    thumb: json['thumb'],
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    duration: json['duration'] as int,
    performer: json['performer'] as String,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$InputMediaAudioToJson(InputMediaAudio instance) =>
    <String, dynamic>{
      'caption': instance.caption,
      'media': instance.media,
      'parse_mode': instance.parse_mode,
      'type': instance.type,
      'thumb': instance.thumb,
      'duration': instance.duration,
      'performer': instance.performer,
      'title': instance.title,
    };

InputMediaDocument _$InputMediaDocumentFromJson(Map<String, dynamic> json) {
  return InputMediaDocument(
    type: json['type'] as String,
    media: json['media'] as String,
    thumb: json['thumb'],
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
  );
}

Map<String, dynamic> _$InputMediaDocumentToJson(InputMediaDocument instance) =>
    <String, dynamic>{
      'caption': instance.caption,
      'media': instance.media,
      'parse_mode': instance.parse_mode,
      'type': instance.type,
      'thumb': instance.thumb,
    };

InputMediaPhoto _$InputMediaPhotoFromJson(Map<String, dynamic> json) {
  return InputMediaPhoto(
    type: json['type'] as String,
    media: json['media'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
  );
}

Map<String, dynamic> _$InputMediaPhotoToJson(InputMediaPhoto instance) =>
    <String, dynamic>{
      'caption': instance.caption,
      'media': instance.media,
      'parse_mode': instance.parse_mode,
      'type': instance.type,
    };

InputMediaVideo _$InputMediaVideoFromJson(Map<String, dynamic> json) {
  return InputMediaVideo(
    type: json['type'] as String,
    media: json['media'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    thumb: json['thumb'],
    width: json['width'] as int,
    height: json['height'] as int,
    duration: json['duration'] as int,
    supports_streaming: json['supports_streaming'] as bool,
  );
}

Map<String, dynamic> _$InputMediaVideoToJson(InputMediaVideo instance) =>
    <String, dynamic>{
      'caption': instance.caption,
      'media': instance.media,
      'parse_mode': instance.parse_mode,
      'type': instance.type,
      'thumb': instance.thumb,
      'width': instance.width,
      'height': instance.height,
      'duration': instance.duration,
      'supports_streaming': instance.supports_streaming,
    };
