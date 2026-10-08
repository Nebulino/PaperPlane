// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChosenInlineResult _$ChosenInlineResultFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['result_id', 'from', 'query']);
  return ChosenInlineResult(
    resultID: json['result_id'] as String?,
    from: json['from'] == null
        ? null
        : User.fromJson(json['from'] as Map<String, dynamic>),
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    inlineMessageID: json['inline_message_id'] as String?,
    query: json['query'] as String?,
  );
}

Map<String, dynamic> _$ChosenInlineResultToJson(ChosenInlineResult instance) =>
    <String, dynamic>{
      'result_id': ?instance.resultID,
      'from': ?instance.from,
      'location': ?instance.location,
      'inline_message_id': ?instance.inlineMessageID,
      'query': ?instance.query,
    };

InlineQuery _$InlineQueryFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id', 'from', 'query', 'offset']);
  return InlineQuery(
    id: json['id'] as String?,
    from: json['from'] == null
        ? null
        : User.fromJson(json['from'] as Map<String, dynamic>),
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    query: json['query'] as String?,
    offset: json['offset'] as String?,
  );
}

Map<String, dynamic> _$InlineQueryToJson(InlineQuery instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'from': ?instance.from,
      'location': ?instance.location,
      'query': ?instance.query,
      'offset': ?instance.offset,
    };

InlineQueryResult _$InlineQueryResultFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['type', 'id']);
  return InlineQueryResult(
    type: json['type'] as String?,
    id: json['id'] as String?,
  );
}

Map<String, dynamic> _$InlineQueryResultToJson(InlineQueryResult instance) =>
    <String, dynamic>{'type': ?instance.type, 'id': ?instance.id};

InlineQueryResultArticle _$InlineQueryResultArticleFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    requiredKeys: const ['type', 'id', 'title', 'input_message_content'],
  );
  return InlineQueryResultArticle(
    type: json['type'] as String? ?? 'article',
    id: json['id'] as String?,
    title: json['title'] as String?,
    inputMessageContent: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>,
          ),
    replyMarkup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>,
          ),
    url: json['url'] as String?,
    hideUrl: json['hide_url'] as bool?,
    description: json['description'] as String?,
    thumbUrl: json['thumb_url'] as String?,
    thumbWidth: json['thumb_width'] as String?,
    thumbHeight: json['thumb_height'] as String?,
  );
}

Map<String, dynamic> _$InlineQueryResultArticleToJson(
  InlineQueryResultArticle instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'id': ?instance.id,
  'title': ?instance.title,
  'input_message_content': ?instance.inputMessageContent,
  'reply_markup': ?instance.replyMarkup,
  'url': ?instance.url,
  'hide_url': ?instance.hideUrl,
  'description': ?instance.description,
  'thumb_url': ?instance.thumbUrl,
  'thumb_width': ?instance.thumbWidth,
  'thumb_height': ?instance.thumbHeight,
};

InlineQueryResultAudio _$InlineQueryResultAudioFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, requiredKeys: const ['type', 'id', 'audio_url', 'title']);
  return InlineQueryResultAudio(
    type: json['type'] as String? ?? 'audio',
    id: json['id'] as String?,
    audioUrl: json['audio_url'] as String?,
    title: json['title'] as String?,
    caption: json['caption'] as String?,
    parseMode: $enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
    performer: json['performer'] as String?,
    audioDuration: InlineQueryResultAudio._durationFromTelegramSeconds(
      (json['audio_duration'] as num?)?.toInt(),
    ),
    replyMarkup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>,
          ),
    inputMessageContent: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$InlineQueryResultAudioToJson(
  InlineQueryResultAudio instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'id': ?instance.id,
  'audio_url': ?instance.audioUrl,
  'title': ?instance.title,
  'caption': ?instance.caption,
  'parse_mode': ?_$ParseModeEnumMap[instance.parseMode],
  'performer': ?instance.performer,
  'audio_duration': ?InlineQueryResultAudio._durationToTelegramSeconds(
    instance.audioDuration,
  ),
  'reply_markup': ?instance.replyMarkup,
  'input_message_content': ?instance.inputMessageContent,
};

const _$ParseModeEnumMap = {
  ParseMode.MARKDOWN: 'MARKDOWN',
  ParseMode.MARKDOWNV2: 'MARKDOWNV2',
  ParseMode.HTML: 'HTML',
};

InlineQueryResultCachedAudio _$InlineQueryResultCachedAudioFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, requiredKeys: const ['type', 'id', 'audio_file_id']);
  return InlineQueryResultCachedAudio(
    type: json['type'] as String? ?? 'audio',
    id: json['id'] as String?,
    audioFileID: json['audio_file_id'] as String?,
    caption: json['caption'] as String?,
    parseMode: $enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
    replyMarkup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>,
          ),
    inputMessageContent: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedAudioToJson(
  InlineQueryResultCachedAudio instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'id': ?instance.id,
  'audio_file_id': ?instance.audioFileID,
  'caption': ?instance.caption,
  'parse_mode': ?_$ParseModeEnumMap[instance.parseMode],
  'reply_markup': ?instance.replyMarkup,
  'input_message_content': ?instance.inputMessageContent,
};

InlineQueryResultCachedDocument _$InlineQueryResultCachedDocumentFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    requiredKeys: const ['type', 'id', 'title', 'document_file_id'],
  );
  return InlineQueryResultCachedDocument(
    type: json['type'] as String? ?? 'document',
    id: json['id'] as String?,
    title: json['title'] as String?,
    documentFileID: json['document_file_id'] as String?,
    description: json['description'] as String?,
    caption: json['caption'] as String?,
    parseMode: $enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
    replyMarkup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>,
          ),
    inputMessageContent: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedDocumentToJson(
  InlineQueryResultCachedDocument instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'id': ?instance.id,
  'title': ?instance.title,
  'document_file_id': ?instance.documentFileID,
  'description': ?instance.description,
  'caption': ?instance.caption,
  'parse_mode': ?_$ParseModeEnumMap[instance.parseMode],
  'reply_markup': ?instance.replyMarkup,
  'input_message_content': ?instance.inputMessageContent,
};

InlineQueryResultCachedGif _$InlineQueryResultCachedGifFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, requiredKeys: const ['type', 'id', 'gif_file_id']);
  return InlineQueryResultCachedGif(
    type: json['type'] as String? ?? 'gif',
    id: json['id'] as String?,
    gifFileID: json['gif_file_id'] as String?,
    title: json['title'] as String?,
    caption: json['caption'] as String?,
    parseMode: $enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
    replyMarkup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>,
          ),
    inputMessageContent: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedGifToJson(
  InlineQueryResultCachedGif instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'id': ?instance.id,
  'gif_file_id': ?instance.gifFileID,
  'title': ?instance.title,
  'caption': ?instance.caption,
  'parse_mode': ?_$ParseModeEnumMap[instance.parseMode],
  'reply_markup': ?instance.replyMarkup,
  'input_message_content': ?instance.inputMessageContent,
};

InlineQueryResultCachedMpeg4Gif _$InlineQueryResultCachedMpeg4GifFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    requiredKeys: const ['type', 'id', 'mpeg4_url', 'thumb_url'],
  );
  return InlineQueryResultCachedMpeg4Gif(
    type: json['type'] as String? ?? 'mpeg4_gif',
    id: json['id'] as String?,
    mpeg4Url: json['mpeg4_url'] as String?,
    mpeg4Width: (json['mpeg4_width'] as num?)?.toInt(),
    mpeg4Height: (json['mpeg4_height'] as num?)?.toInt(),
    mpeg4Duration: InlineQueryResultCachedMpeg4Gif._durationFromTelegramSeconds(
      (json['mpeg4_duration'] as num?)?.toInt(),
    ),
    thumbUrl: json['thumb_url'] as String?,
    title: json['title'] as String?,
    caption: json['caption'] as String?,
    parseMode: $enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
    replyMarkup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>,
          ),
    inputMessageContent: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedMpeg4GifToJson(
  InlineQueryResultCachedMpeg4Gif instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'id': ?instance.id,
  'mpeg4_url': ?instance.mpeg4Url,
  'mpeg4_width': ?instance.mpeg4Width,
  'mpeg4_height': ?instance.mpeg4Height,
  'mpeg4_duration': ?InlineQueryResultCachedMpeg4Gif._durationToTelegramSeconds(
    instance.mpeg4Duration,
  ),
  'thumb_url': ?instance.thumbUrl,
  'title': ?instance.title,
  'caption': ?instance.caption,
  'parse_mode': ?_$ParseModeEnumMap[instance.parseMode],
  'reply_markup': ?instance.replyMarkup,
  'input_message_content': ?instance.inputMessageContent,
};

InlineQueryResultCachedPhoto _$InlineQueryResultCachedPhotoFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, requiredKeys: const ['type', 'id', 'photo_file_id']);
  return InlineQueryResultCachedPhoto(
    type: json['type'] as String? ?? 'photo',
    id: json['id'] as String?,
    photoFileID: json['photo_file_id'] as String?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    caption: json['caption'] as String?,
    parseMode: $enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
    replyMarkup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>,
          ),
    inputMessageContent: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedPhotoToJson(
  InlineQueryResultCachedPhoto instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'id': ?instance.id,
  'photo_file_id': ?instance.photoFileID,
  'title': ?instance.title,
  'description': ?instance.description,
  'caption': ?instance.caption,
  'parse_mode': ?_$ParseModeEnumMap[instance.parseMode],
  'reply_markup': ?instance.replyMarkup,
  'input_message_content': ?instance.inputMessageContent,
};

InlineQueryResultCachedSticker _$InlineQueryResultCachedStickerFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, requiredKeys: const ['type', 'id', 'sticker_file_id']);
  return InlineQueryResultCachedSticker(
    type: json['type'] as String? ?? 'sticker',
    id: json['id'] as String?,
    stickerFileID: json['sticker_file_id'] as String?,
    replyMarkup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>,
          ),
    inputMessageContent: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedStickerToJson(
  InlineQueryResultCachedSticker instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'id': ?instance.id,
  'sticker_file_id': ?instance.stickerFileID,
  'reply_markup': ?instance.replyMarkup,
  'input_message_content': ?instance.inputMessageContent,
};

InlineQueryResultCachedVideo _$InlineQueryResultCachedVideoFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    requiredKeys: const ['type', 'id', 'video_file_id', 'title'],
  );
  return InlineQueryResultCachedVideo(
    type: json['type'] as String? ?? 'video',
    id: json['id'] as String?,
    videoFileID: json['video_file_id'] as String?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    caption: json['caption'] as String?,
    parseMode: $enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
    replyMarkup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>,
          ),
    inputMessageContent: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedVideoToJson(
  InlineQueryResultCachedVideo instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'id': ?instance.id,
  'video_file_id': ?instance.videoFileID,
  'title': ?instance.title,
  'description': ?instance.description,
  'caption': ?instance.caption,
  'parse_mode': ?_$ParseModeEnumMap[instance.parseMode],
  'reply_markup': ?instance.replyMarkup,
  'input_message_content': ?instance.inputMessageContent,
};

InlineQueryResultCachedVoice _$InlineQueryResultCachedVoiceFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, requiredKeys: const ['type', 'id', 'voice_file_id']);
  return InlineQueryResultCachedVoice(
    type: json['type'] as String? ?? 'voice',
    id: json['id'] as String?,
    voiceFileID: json['voice_file_id'] as String?,
    title: json['title'] as String?,
    caption: json['caption'] as String?,
    parseMode: $enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
    replyMarkup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>,
          ),
    inputMessageContent: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedVoiceToJson(
  InlineQueryResultCachedVoice instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'id': ?instance.id,
  'voice_file_id': ?instance.voiceFileID,
  'title': ?instance.title,
  'caption': ?instance.caption,
  'parse_mode': ?_$ParseModeEnumMap[instance.parseMode],
  'reply_markup': ?instance.replyMarkup,
  'input_message_content': ?instance.inputMessageContent,
};

InlineQueryResultContact _$InlineQueryResultContactFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    requiredKeys: const ['type', 'id', 'phone_number', 'first_name'],
  );
  return InlineQueryResultContact(
    type: json['type'] as String? ?? 'contact',
    id: json['id'] as String?,
    phoneNumber: json['phone_number'] as String?,
    firstName: json['first_name'] as String?,
    lastName: json['last_name'] as String?,
    vcard: json['vcard'] as String?,
    replyMarkup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>,
          ),
    inputMessageContent: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>,
          ),
    thumbUrl: json['thumb_url'] as String?,
    thumbWidth: (json['thumb_width'] as num?)?.toInt(),
    thumbHeight: (json['thumb_height'] as num?)?.toInt(),
  );
}

Map<String, dynamic> _$InlineQueryResultContactToJson(
  InlineQueryResultContact instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'id': ?instance.id,
  'phone_number': ?instance.phoneNumber,
  'first_name': ?instance.firstName,
  'last_name': ?instance.lastName,
  'vcard': ?instance.vcard,
  'reply_markup': ?instance.replyMarkup,
  'input_message_content': ?instance.inputMessageContent,
  'thumb_url': ?instance.thumbUrl,
  'thumb_width': ?instance.thumbWidth,
  'thumb_height': ?instance.thumbHeight,
};

InlineQueryResultDocument _$InlineQueryResultDocumentFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    requiredKeys: const ['type', 'id', 'title', 'document_url', 'mime_type'],
  );
  return InlineQueryResultDocument(
    type: json['type'] as String? ?? 'document',
    id: json['id'] as String?,
    title: json['title'] as String?,
    caption: json['caption'] as String?,
    parseMode: $enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
    documentUrl: json['document_url'] as String?,
    mimeType: json['mime_type'] as String?,
    description: json['description'] as String?,
    replyMarkup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>,
          ),
    inputMessageContent: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>,
          ),
    thumbUrl: json['thumb_url'] as String?,
    thumbWidth: (json['thumb_width'] as num?)?.toInt(),
    thumbHeight: (json['thumb_height'] as num?)?.toInt(),
  );
}

Map<String, dynamic> _$InlineQueryResultDocumentToJson(
  InlineQueryResultDocument instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'id': ?instance.id,
  'title': ?instance.title,
  'caption': ?instance.caption,
  'parse_mode': ?_$ParseModeEnumMap[instance.parseMode],
  'document_url': ?instance.documentUrl,
  'mime_type': ?instance.mimeType,
  'description': ?instance.description,
  'reply_markup': ?instance.replyMarkup,
  'input_message_content': ?instance.inputMessageContent,
  'thumb_url': ?instance.thumbUrl,
  'thumb_width': ?instance.thumbWidth,
  'thumb_height': ?instance.thumbHeight,
};

InlineQueryResultGame _$InlineQueryResultGameFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, requiredKeys: const ['type', 'id', 'game_short_name']);
  return InlineQueryResultGame(
    type: json['type'] as String? ?? 'game',
    id: json['id'] as String?,
    gameShortName: json['game_short_name'] as String?,
    replyMarkup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$InlineQueryResultGameToJson(
  InlineQueryResultGame instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'id': ?instance.id,
  'game_short_name': ?instance.gameShortName,
  'reply_markup': ?instance.replyMarkup,
};

InlineQueryResultGif _$InlineQueryResultGifFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['type', 'id', 'thumb_url']);
  return InlineQueryResultGif(
    type: json['type'] as String? ?? 'gif',
    id: json['id'] as String?,
    gifUrl: json['gif_url'] as String?,
    gifWidth: (json['gif_width'] as num?)?.toInt(),
    gifHeight: (json['gif_height'] as num?)?.toInt(),
    gifDuration: InlineQueryResultGif._durationFromTelegramSeconds(
      (json['gif_duration'] as num?)?.toInt(),
    ),
    thumbUrl: json['thumb_url'] as String?,
    title: json['title'] as String?,
    caption: json['caption'] as String?,
    parseMode: $enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
    replyMarkup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>,
          ),
    inputMessageContent: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$InlineQueryResultGifToJson(
  InlineQueryResultGif instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'id': ?instance.id,
  'gif_url': ?instance.gifUrl,
  'gif_width': ?instance.gifWidth,
  'gif_height': ?instance.gifHeight,
  'gif_duration': ?InlineQueryResultGif._durationToTelegramSeconds(
    instance.gifDuration,
  ),
  'thumb_url': ?instance.thumbUrl,
  'title': ?instance.title,
  'caption': ?instance.caption,
  'parse_mode': ?_$ParseModeEnumMap[instance.parseMode],
  'reply_markup': ?instance.replyMarkup,
  'input_message_content': ?instance.inputMessageContent,
};

InlineQueryResultLocation _$InlineQueryResultLocationFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    requiredKeys: const ['type', 'id', 'latitude', 'longitude', 'title'],
  );
  return InlineQueryResultLocation(
    type: json['type'] as String? ?? 'location',
    id: json['id'] as String?,
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
    title: json['title'] as String?,
    live_period: InlineQueryResultLocation._durationFromTelegramSeconds(
      (json['live_period'] as num?)?.toInt(),
    ),
    replyMarkup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>,
          ),
    inputMessageContent: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>,
          ),
    thumb_url: json['thumb_url'] as String?,
    thumb_width: (json['thumb_width'] as num?)?.toInt(),
    thumb_height: (json['thumb_height'] as num?)?.toInt(),
  );
}

Map<String, dynamic> _$InlineQueryResultLocationToJson(
  InlineQueryResultLocation instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'id': ?instance.id,
  'latitude': ?instance.latitude,
  'longitude': ?instance.longitude,
  'title': ?instance.title,
  'live_period': ?InlineQueryResultLocation._durationToTelegramSeconds(
    instance.live_period,
  ),
  'reply_markup': ?instance.replyMarkup,
  'input_message_content': ?instance.inputMessageContent,
  'thumb_url': ?instance.thumb_url,
  'thumb_width': ?instance.thumb_width,
  'thumb_height': ?instance.thumb_height,
};

InlineQueryResultMpeg4Gif _$InlineQueryResultMpeg4GifFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, requiredKeys: const ['type', 'id']);
  return InlineQueryResultMpeg4Gif(
    type: json['type'] as String? ?? 'mpeg4_gif',
    id: json['id'] as String?,
    mpeg4Url: json['mpeg4_url'] as String?,
    mpeg4Width: (json['mpeg4_width'] as num?)?.toInt(),
    mpeg4Height: (json['mpeg4_height'] as num?)?.toInt(),
    mpeg4Duration: InlineQueryResultMpeg4Gif._durationFromTelegramSeconds(
      (json['mpeg4_duration'] as num?)?.toInt(),
    ),
    thumbUrl: json['thumb_url'] as String?,
    title: json['title'] as String?,
    caption: json['caption'] as String?,
    parseMode: $enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
    replyMarkup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>,
          ),
    inputMessageContent: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$InlineQueryResultMpeg4GifToJson(
  InlineQueryResultMpeg4Gif instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'id': ?instance.id,
  'mpeg4_url': ?instance.mpeg4Url,
  'mpeg4_width': ?instance.mpeg4Width,
  'mpeg4_height': ?instance.mpeg4Height,
  'mpeg4_duration': ?InlineQueryResultMpeg4Gif._durationToTelegramSeconds(
    instance.mpeg4Duration,
  ),
  'thumb_url': ?instance.thumbUrl,
  'title': ?instance.title,
  'caption': ?instance.caption,
  'parse_mode': ?_$ParseModeEnumMap[instance.parseMode],
  'reply_markup': ?instance.replyMarkup,
  'input_message_content': ?instance.inputMessageContent,
};

InlineQueryResultPhoto _$InlineQueryResultPhotoFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    requiredKeys: const ['type', 'id', 'photo_url', 'thumb_url'],
  );
  return InlineQueryResultPhoto(
    type: json['type'] as String? ?? 'photo',
    id: json['id'] as String?,
    photoUrl: json['photo_url'] as String?,
    thumbUrl: json['thumb_url'] as String?,
    photoWidth: (json['photo_width'] as num?)?.toInt(),
    photoHeight: (json['photo_height'] as num?)?.toInt(),
    title: json['title'] as String?,
    description: json['description'] as String?,
    caption: json['caption'] as String?,
    parseMode: $enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
    replyMarkup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>,
          ),
    inputMessageContent: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$InlineQueryResultPhotoToJson(
  InlineQueryResultPhoto instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'id': ?instance.id,
  'photo_url': ?instance.photoUrl,
  'thumb_url': ?instance.thumbUrl,
  'photo_width': ?instance.photoWidth,
  'photo_height': ?instance.photoHeight,
  'title': ?instance.title,
  'description': ?instance.description,
  'caption': ?instance.caption,
  'parse_mode': ?_$ParseModeEnumMap[instance.parseMode],
  'reply_markup': ?instance.replyMarkup,
  'input_message_content': ?instance.inputMessageContent,
};

InlineQueryResultVenue _$InlineQueryResultVenueFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    requiredKeys: const [
      'type',
      'id',
      'latitude',
      'longitude',
      'title',
      'address',
    ],
  );
  return InlineQueryResultVenue(
    type: json['type'] as String? ?? 'venue',
    id: json['id'] as String?,
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
    title: json['title'] as String?,
    address: json['address'] as String?,
    foursquareID: json['foursquare_id'] as String?,
    foursquareType: json['foursquare_type'] as String?,
    replyMarkup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>,
          ),
    inputMessageContent: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>,
          ),
    thumbUrl: json['thumb_url'] as String?,
    thumbWidth: (json['thumb_width'] as num?)?.toInt(),
    thumbHeight: (json['thumb_height'] as num?)?.toInt(),
  );
}

Map<String, dynamic> _$InlineQueryResultVenueToJson(
  InlineQueryResultVenue instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'id': ?instance.id,
  'latitude': ?instance.latitude,
  'longitude': ?instance.longitude,
  'title': ?instance.title,
  'address': ?instance.address,
  'foursquare_id': ?instance.foursquareID,
  'foursquare_type': ?instance.foursquareType,
  'reply_markup': ?instance.replyMarkup,
  'input_message_content': ?instance.inputMessageContent,
  'thumb_url': ?instance.thumbUrl,
  'thumb_width': ?instance.thumbWidth,
  'thumb_height': ?instance.thumbHeight,
};

InlineQueryResultVideo _$InlineQueryResultVideoFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    requiredKeys: const [
      'type',
      'id',
      'video_url',
      'mime_type',
      'thumb_url',
      'title',
    ],
  );
  return InlineQueryResultVideo(
    id: json['id'] as String?,
    type: json['type'] as String? ?? 'video',
    videoUrl: json['video_url'] as String?,
    mimeType: json['mime_type'] as String?,
    thumbUrl: json['thumb_url'] as String?,
    title: json['title'] as String?,
    caption: json['caption'] as String?,
    parseMode: $enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
    videoWidth: (json['video_width'] as num?)?.toInt(),
    videoHeight: (json['video_height'] as num?)?.toInt(),
    videoDuration: InlineQueryResultVideo._durationFromTelegramSeconds(
      (json['video_duration'] as num?)?.toInt(),
    ),
    description: json['description'] as String?,
    replyMarkup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>,
          ),
    inputMessageContent: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$InlineQueryResultVideoToJson(
  InlineQueryResultVideo instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'id': ?instance.id,
  'video_url': ?instance.videoUrl,
  'mime_type': ?instance.mimeType,
  'thumb_url': ?instance.thumbUrl,
  'title': ?instance.title,
  'caption': ?instance.caption,
  'parse_mode': ?_$ParseModeEnumMap[instance.parseMode],
  'video_width': ?instance.videoWidth,
  'video_height': ?instance.videoHeight,
  'video_duration': ?InlineQueryResultVideo._durationToTelegramSeconds(
    instance.videoDuration,
  ),
  'description': ?instance.description,
  'reply_markup': ?instance.replyMarkup,
  'input_message_content': ?instance.inputMessageContent,
};

InlineQueryResultVoice _$InlineQueryResultVoiceFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, requiredKeys: const ['type', 'id', 'voice_url', 'title']);
  return InlineQueryResultVoice(
    type: json['type'] as String? ?? 'voice',
    id: json['id'] as String?,
    voiceUrl: json['voice_url'] as String?,
    title: json['title'] as String?,
    caption: json['caption'] as String?,
    parseMode: $enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
    voiceDuration: InlineQueryResultVoice._durationFromTelegramSeconds(
      (json['voice_duration'] as num?)?.toInt(),
    ),
    replyMarkup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>,
          ),
    inputMessageContent: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$InlineQueryResultVoiceToJson(
  InlineQueryResultVoice instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'id': ?instance.id,
  'voice_url': ?instance.voiceUrl,
  'title': ?instance.title,
  'caption': ?instance.caption,
  'parse_mode': ?_$ParseModeEnumMap[instance.parseMode],
  'voice_duration': ?InlineQueryResultVoice._durationToTelegramSeconds(
    instance.voiceDuration,
  ),
  'reply_markup': ?instance.replyMarkup,
  'input_message_content': ?instance.inputMessageContent,
};

InputContactMessageContent _$InputContactMessageContentFromJson(
  Map<String, dynamic> json,
) => InputContactMessageContent(
  phoneNumber: json['phone_number'] as String?,
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  vcard: json['vcard'] as String?,
);

Map<String, dynamic> _$InputContactMessageContentToJson(
  InputContactMessageContent instance,
) => <String, dynamic>{
  'phone_number': ?instance.phoneNumber,
  'first_name': ?instance.firstName,
  'last_name': ?instance.lastName,
  'vcard': ?instance.vcard,
};

InputLocationMessageContent _$InputLocationMessageContentFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, requiredKeys: const ['latitude', 'longitude']);
  return InputLocationMessageContent(
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
    live_period: InputLocationMessageContent._durationFromTelegramSeconds(
      (json['live_period'] as num?)?.toInt(),
    ),
  );
}

Map<String, dynamic> _$InputLocationMessageContentToJson(
  InputLocationMessageContent instance,
) => <String, dynamic>{
  'latitude': ?instance.latitude,
  'longitude': ?instance.longitude,
  'live_period': ?InputLocationMessageContent._durationToTelegramSeconds(
    instance.live_period,
  ),
};

InputMessageContent _$InputMessageContentFromJson(Map<String, dynamic> json) =>
    InputMessageContent();

Map<String, dynamic> _$InputMessageContentToJson(
  InputMessageContent instance,
) => <String, dynamic>{};

InputTextMessageContent _$InputTextMessageContentFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, requiredKeys: const ['message_text']);
  return InputTextMessageContent(
    messageText: json['message_text'] as String?,
    parseMode: $enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
    disableWebPagePreview: json['disable_web_page_preview'] as bool?,
  );
}

Map<String, dynamic> _$InputTextMessageContentToJson(
  InputTextMessageContent instance,
) => <String, dynamic>{
  'message_text': ?instance.messageText,
  'parse_mode': ?_$ParseModeEnumMap[instance.parseMode],
  'disable_web_page_preview': ?instance.disableWebPagePreview,
};

InputVenueMessageContent _$InputVenueMessageContentFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    requiredKeys: const ['latitude', 'longitude', 'title', 'address'],
  );
  return InputVenueMessageContent(
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
    title: json['title'] as String?,
    address: json['address'] as String?,
    foursquareID: json['foursquare_id'] as String?,
    foursquareType: json['foursquare_type'] as String?,
  );
}

Map<String, dynamic> _$InputVenueMessageContentToJson(
  InputVenueMessageContent instance,
) => <String, dynamic>{
  'latitude': ?instance.latitude,
  'longitude': ?instance.longitude,
  'title': ?instance.title,
  'address': ?instance.address,
  'foursquare_id': ?instance.foursquareID,
  'foursquare_type': ?instance.foursquareType,
};
