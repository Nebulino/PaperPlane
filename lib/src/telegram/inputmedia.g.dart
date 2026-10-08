// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inputmedia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InputMedia _$InputMediaFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['type', 'media']);
  return InputMedia(
    type: json['type'] as String?,
    media: json['media'],
    caption: json['caption'] as String?,
    parseMode: $enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
  );
}

Map<String, dynamic> _$InputMediaToJson(InputMedia instance) =>
    <String, dynamic>{
      'type': ?instance.type,
      'media': ?instance.media,
      'caption': ?instance.caption,
      'parse_mode': ?_$ParseModeEnumMap[instance.parseMode],
    };

const _$ParseModeEnumMap = {
  ParseMode.MARKDOWN: 'MARKDOWN',
  ParseMode.MARKDOWNV2: 'MARKDOWNV2',
  ParseMode.HTML: 'HTML',
};

InputMediaAnimation _$InputMediaAnimationFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['type', 'media']);
  return InputMediaAnimation(
    type: json['type'] as String? ?? 'animation',
    media: json['media'],
    thumb: json['thumb'],
    caption: json['caption'] as String?,
    parseMode: $enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
    width: (json['width'] as num?)?.toInt(),
    height: (json['height'] as num?)?.toInt(),
    duration: InputMediaAnimation._durationFromTelegramSeconds(
      (json['duration'] as num?)?.toInt(),
    ),
  );
}

Map<String, dynamic> _$InputMediaAnimationToJson(
  InputMediaAnimation instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'media': ?instance.media,
  'thumb': ?instance.thumb,
  'caption': ?instance.caption,
  'parse_mode': ?_$ParseModeEnumMap[instance.parseMode],
  'width': ?instance.width,
  'height': ?instance.height,
  'duration': ?InputMediaAnimation._durationToTelegramSeconds(
    instance.duration,
  ),
};

InputMediaAudio _$InputMediaAudioFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['type', 'media']);
  return InputMediaAudio(
    type: json['type'] as String? ?? 'audio',
    media: json['media'],
    thumb: json['thumb'],
    caption: json['caption'] as String?,
    parseMode: $enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
    duration: InputMediaAudio._durationFromTelegramSeconds(
      (json['duration'] as num?)?.toInt(),
    ),
    performer: json['performer'] as String?,
    title: json['title'] as String?,
  );
}

Map<String, dynamic> _$InputMediaAudioToJson(
  InputMediaAudio instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'media': ?instance.media,
  'thumb': ?instance.thumb,
  'caption': ?instance.caption,
  'parse_mode': ?_$ParseModeEnumMap[instance.parseMode],
  'duration': ?InputMediaAudio._durationToTelegramSeconds(instance.duration),
  'performer': ?instance.performer,
  'title': ?instance.title,
};

InputMediaDocument _$InputMediaDocumentFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['type', 'media']);
  return InputMediaDocument(
    type: json['type'] as String? ?? 'document',
    media: json['media'],
    thumb: json['thumb'],
    caption: json['caption'] as String?,
    parseMode: $enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
  );
}

Map<String, dynamic> _$InputMediaDocumentToJson(InputMediaDocument instance) =>
    <String, dynamic>{
      'type': ?instance.type,
      'media': ?instance.media,
      'thumb': ?instance.thumb,
      'caption': ?instance.caption,
      'parse_mode': ?_$ParseModeEnumMap[instance.parseMode],
    };

InputMediaPhoto _$InputMediaPhotoFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['type', 'media']);
  return InputMediaPhoto(
    type: json['type'] as String? ?? 'photo',
    media: json['media'],
    caption: json['caption'] as String?,
    parseMode: $enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
  );
}

Map<String, dynamic> _$InputMediaPhotoToJson(InputMediaPhoto instance) =>
    <String, dynamic>{
      'type': ?instance.type,
      'media': ?instance.media,
      'caption': ?instance.caption,
      'parse_mode': ?_$ParseModeEnumMap[instance.parseMode],
    };

InputMediaVideo _$InputMediaVideoFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['type', 'media', 'supports_streaming']);
  return InputMediaVideo(
    type: json['type'] as String? ?? 'video',
    media: json['media'],
    thumb: json['thumb'],
    caption: json['caption'] as String?,
    parseMode: $enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
    width: (json['width'] as num?)?.toInt(),
    height: (json['height'] as num?)?.toInt(),
    duration: InputMediaVideo._durationFromTelegramSeconds(
      (json['duration'] as num?)?.toInt(),
    ),
    supportsStreaming: json['supports_streaming'] as bool?,
  );
}

Map<String, dynamic> _$InputMediaVideoToJson(
  InputMediaVideo instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'media': ?instance.media,
  'thumb': ?instance.thumb,
  'caption': ?instance.caption,
  'parse_mode': ?_$ParseModeEnumMap[instance.parseMode],
  'width': ?instance.width,
  'height': ?instance.height,
  'duration': ?InputMediaVideo._durationToTelegramSeconds(instance.duration),
  'supports_streaming': ?instance.supportsStreaming,
};
