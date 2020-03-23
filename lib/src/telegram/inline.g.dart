// GENERATED CODE - DO NOT MODIFY BY HAND

part of inline;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChosenInlineResult _$ChosenInlineResultFromJson(Map<String, dynamic> json) {
  return ChosenInlineResult(
    result_id: json['result_id'] as String,
    from: json['from'] == null
        ? null
        : User.fromJson(json['from'] as Map<String, dynamic>),
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    inline_message_id: json['inline_message_id'] as String,
    query: json['query'] as String,
  );
}

Map<String, dynamic> _$ChosenInlineResultToJson(ChosenInlineResult instance) =>
    <String, dynamic>{
      'result_id': instance.result_id,
      'from': instance.from,
      'location': instance.location,
      'inline_message_id': instance.inline_message_id,
      'query': instance.query,
    };

InlineQuery _$InlineQueryFromJson(Map<String, dynamic> json) {
  return InlineQuery(
    id: json['id'] as String,
    from: json['from'] == null
        ? null
        : User.fromJson(json['from'] as Map<String, dynamic>),
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    query: json['query'] as String,
    offset: json['offset'] as String,
  );
}

Map<String, dynamic> _$InlineQueryToJson(InlineQuery instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from': instance.from,
      'location': instance.location,
      'query': instance.query,
      'offset': instance.offset,
    };

InlineQueryResult _$InlineQueryResultFromJson(Map<String, dynamic> json) {
  return InlineQueryResult(
    type: json['type'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$InlineQueryResultToJson(InlineQueryResult instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
    };

InlineQueryResultArticle _$InlineQueryResultArticleFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultArticle(
    id: json['id'] as String,
    type: json['type'] as String,
    title: json['title'] as String,
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    url: json['url'] as String,
    hide_url: json['hide_url'] as bool,
    description: json['description'] as String,
    thumb_url: json['thumb_url'] as String,
    thumb_width: json['thumb_width'] as String,
    thumb_height: json['thumb_height'] as String,
  );
}

Map<String, dynamic> _$InlineQueryResultArticleToJson(
        InlineQueryResultArticle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'input_message_content': instance.input_message_content,
      'reply_markup': instance.reply_markup,
      'url': instance.url,
      'hide_url': instance.hide_url,
      'description': instance.description,
      'thumb_url': instance.thumb_url,
      'thumb_width': instance.thumb_width,
      'thumb_height': instance.thumb_height,
    };

InlineQueryResultAudio _$InlineQueryResultAudioFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultAudio(
    id: json['id'] as String,
    type: json['type'] as String,
    audio_url: json['audio_url'] as String,
    title: json['title'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    performer: json['performer'] as String,
    audio_duration: json['audio_duration'] as int,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultAudioToJson(
        InlineQueryResultAudio instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'audio_url': instance.audio_url,
      'title': instance.title,
      'caption': instance.caption,
      'parse_mode': instance.parse_mode,
      'performer': instance.performer,
      'audio_duration': instance.audio_duration,
      'reply_markup': instance.reply_markup,
      'input_message_content': instance.input_message_content,
    };

InlineQueryResultCachedAudio _$InlineQueryResultCachedAudioFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedAudio(
    id: json['id'] as String,
    type: json['type'] as String,
    audio_file_id: json['audio_file_id'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedAudioToJson(
        InlineQueryResultCachedAudio instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'audio_file_id': instance.audio_file_id,
      'caption': instance.caption,
      'parse_mode': instance.parse_mode,
      'reply_markup': instance.reply_markup,
      'input_message_content': instance.input_message_content,
    };

InlineQueryResultCachedDocument _$InlineQueryResultCachedDocumentFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedDocument(
    id: json['id'] as String,
    type: json['type'] as String,
    title: json['title'] as String,
    document_file_id: json['document_file_id'] as String,
    description: json['description'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedDocumentToJson(
        InlineQueryResultCachedDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'document_file_id': instance.document_file_id,
      'description': instance.description,
      'caption': instance.caption,
      'parse_mode': instance.parse_mode,
      'reply_markup': instance.reply_markup,
      'input_message_content': instance.input_message_content,
    };

InlineQueryResultCachedGif _$InlineQueryResultCachedGifFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedGif(
    id: json['id'] as String,
    type: json['type'] as String,
    gif_file_id: json['gif_file_id'] as String,
    title: json['title'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedGifToJson(
        InlineQueryResultCachedGif instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'gif_file_id': instance.gif_file_id,
      'title': instance.title,
      'caption': instance.caption,
      'parse_mode': instance.parse_mode,
      'reply_markup': instance.reply_markup,
      'input_message_content': instance.input_message_content,
    };

InlineQueryResultCachedMpeg4Gif _$InlineQueryResultCachedMpeg4GifFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedMpeg4Gif(
    id: json['id'] as String,
    type: json['type'] as String,
    mpeg4_file_id: json['mpeg4_file_id'] as String,
    title: json['title'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedMpeg4GifToJson(
        InlineQueryResultCachedMpeg4Gif instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'mpeg4_file_id': instance.mpeg4_file_id,
      'title': instance.title,
      'caption': instance.caption,
      'parse_mode': instance.parse_mode,
      'reply_markup': instance.reply_markup,
      'input_message_content': instance.input_message_content,
    };

InlineQueryResultCachedPhoto _$InlineQueryResultCachedPhotoFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedPhoto(
    id: json['id'] as String,
    type: json['type'] as String,
    photo_file_id: json['photo_file_id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedPhotoToJson(
        InlineQueryResultCachedPhoto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'photo_file_id': instance.photo_file_id,
      'title': instance.title,
      'description': instance.description,
      'caption': instance.caption,
      'parse_mode': instance.parse_mode,
      'reply_markup': instance.reply_markup,
      'input_message_content': instance.input_message_content,
    };

InlineQueryResultCachedSticker _$InlineQueryResultCachedStickerFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedSticker(
    id: json['id'] as String,
    type: json['type'] as String,
    sticker_file_id: json['sticker_file_id'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedStickerToJson(
        InlineQueryResultCachedSticker instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'sticker_file_id': instance.sticker_file_id,
      'reply_markup': instance.reply_markup,
      'input_message_content': instance.input_message_content,
    };

InlineQueryResultCachedVideo _$InlineQueryResultCachedVideoFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedVideo(
    id: json['id'] as String,
    type: json['type'] as String,
    video_file_id: json['video_file_id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedVideoToJson(
        InlineQueryResultCachedVideo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'video_file_id': instance.video_file_id,
      'title': instance.title,
      'description': instance.description,
      'caption': instance.caption,
      'parse_mode': instance.parse_mode,
      'reply_markup': instance.reply_markup,
      'input_message_content': instance.input_message_content,
    };

InlineQueryResultCachedVoice _$InlineQueryResultCachedVoiceFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedVoice(
    id: json['id'] as String,
    type: json['type'] as String,
    voice_file_id: json['voice_file_id'] as String,
    title: json['title'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedVoiceToJson(
        InlineQueryResultCachedVoice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'voice_file_id': instance.voice_file_id,
      'title': instance.title,
      'caption': instance.caption,
      'parse_mode': instance.parse_mode,
      'reply_markup': instance.reply_markup,
      'input_message_content': instance.input_message_content,
    };

InlineQueryResultContact _$InlineQueryResultContactFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultContact(
    id: json['id'] as String,
    type: json['type'] as String,
    phone_number: json['phone_number'] as String,
    first_name: json['first_name'] as String,
    last_name: json['last_name'] as String,
    vcard: json['vcard'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
    thumb_url: json['thumb_url'] as String,
    thumb_width: json['thumb_width'] as int,
    thumb_height: json['thumb_height'] as int,
  );
}

Map<String, dynamic> _$InlineQueryResultContactToJson(
        InlineQueryResultContact instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'phone_number': instance.phone_number,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'vcard': instance.vcard,
      'reply_markup': instance.reply_markup,
      'input_message_content': instance.input_message_content,
      'thumb_url': instance.thumb_url,
      'thumb_width': instance.thumb_width,
      'thumb_height': instance.thumb_height,
    };

InlineQueryResultDocument _$InlineQueryResultDocumentFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultDocument(
    id: json['id'] as String,
    type: json['type'] as String,
    title: json['title'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    document_url: json['document_url'] as String,
    mime_type: json['mime_type'] as String,
    description: json['description'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
    thumb_url: json['thumb_url'] as String,
    thumb_width: json['thumb_width'] as int,
    thumb_height: json['thumb_height'] as int,
  );
}

Map<String, dynamic> _$InlineQueryResultDocumentToJson(
        InlineQueryResultDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'caption': instance.caption,
      'parse_mode': instance.parse_mode,
      'document_url': instance.document_url,
      'mime_type': instance.mime_type,
      'description': instance.description,
      'reply_markup': instance.reply_markup,
      'input_message_content': instance.input_message_content,
      'thumb_url': instance.thumb_url,
      'thumb_width': instance.thumb_width,
      'thumb_height': instance.thumb_height,
    };

InlineQueryResultGame _$InlineQueryResultGameFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultGame(
    id: json['id'] as String,
    type: json['type'] as String,
    game_short_name: json['game_short_name'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultGameToJson(
        InlineQueryResultGame instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'game_short_name': instance.game_short_name,
      'reply_markup': instance.reply_markup,
    };

InlineQueryResultGif _$InlineQueryResultGifFromJson(Map<String, dynamic> json) {
  return InlineQueryResultGif(
    id: json['id'] as String,
    type: json['type'] as String,
    gif_url: json['gif_url'] as String,
    gif_width: json['gif_width'] as int,
    gif_height: json['gif_height'] as int,
    gif_duration: json['gif_duration'] as int,
    thumb_url: json['thumb_url'] as String,
    title: json['title'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultGifToJson(
        InlineQueryResultGif instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'gif_url': instance.gif_url,
      'gif_width': instance.gif_width,
      'gif_height': instance.gif_height,
      'gif_duration': instance.gif_duration,
      'thumb_url': instance.thumb_url,
      'title': instance.title,
      'caption': instance.caption,
      'parse_mode': instance.parse_mode,
      'reply_markup': instance.reply_markup,
      'input_message_content': instance.input_message_content,
    };

InlineQueryResultLocation _$InlineQueryResultLocationFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultLocation(
    id: json['id'] as String,
    type: json['type'] as String,
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    title: json['title'] as String,
    live_period: json['live_period'] as int,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
    thumb_url: json['thumb_url'] as String,
    thumb_width: json['thumb_width'] as int,
    thumb_height: json['thumb_height'] as int,
  );
}

Map<String, dynamic> _$InlineQueryResultLocationToJson(
        InlineQueryResultLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'title': instance.title,
      'live_period': instance.live_period,
      'reply_markup': instance.reply_markup,
      'input_message_content': instance.input_message_content,
      'thumb_url': instance.thumb_url,
      'thumb_width': instance.thumb_width,
      'thumb_height': instance.thumb_height,
    };

InlineQueryResultMpeg4Gif _$InlineQueryResultMpeg4GifFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultMpeg4Gif(
    id: json['id'] as String,
    type: json['type'] as String,
    mpeg4_url: json['mpeg4_url'] as String,
    mpeg4_width: json['mpeg4_width'] as int,
    mpeg4_height: json['mpeg4_height'] as int,
    mpeg4_duration: json['mpeg4_duration'] as int,
    thumb_url: json['thumb_url'] as String,
    title: json['title'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultMpeg4GifToJson(
        InlineQueryResultMpeg4Gif instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'mpeg4_url': instance.mpeg4_url,
      'mpeg4_width': instance.mpeg4_width,
      'mpeg4_height': instance.mpeg4_height,
      'mpeg4_duration': instance.mpeg4_duration,
      'thumb_url': instance.thumb_url,
      'title': instance.title,
      'caption': instance.caption,
      'parse_mode': instance.parse_mode,
      'reply_markup': instance.reply_markup,
      'input_message_content': instance.input_message_content,
    };

InlineQueryResultPhoto _$InlineQueryResultPhotoFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultPhoto(
    id: json['id'] as String,
    type: json['type'] as String,
    photo_url: json['photo_url'] as String,
    thumb_url: json['thumb_url'] as String,
    photo_width: json['photo_width'] as int,
    photo_height: json['photo_height'] as int,
    title: json['title'] as String,
    description: json['description'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultPhotoToJson(
        InlineQueryResultPhoto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'photo_url': instance.photo_url,
      'thumb_url': instance.thumb_url,
      'photo_width': instance.photo_width,
      'photo_height': instance.photo_height,
      'title': instance.title,
      'description': instance.description,
      'caption': instance.caption,
      'parse_mode': instance.parse_mode,
      'reply_markup': instance.reply_markup,
      'input_message_content': instance.input_message_content,
    };

InlineQueryResultVenue _$InlineQueryResultVenueFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultVenue(
    id: json['id'] as String,
    type: json['type'] as String,
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    title: json['title'] as String,
    address: json['address'] as String,
    foursquare_id: json['foursquare_id'] as String,
    foursquare_type: json['foursquare_type'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
    thumb_url: json['thumb_url'] as String,
    thumb_width: json['thumb_width'] as int,
    thumb_height: json['thumb_height'] as int,
  );
}

Map<String, dynamic> _$InlineQueryResultVenueToJson(
        InlineQueryResultVenue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'title': instance.title,
      'address': instance.address,
      'foursquare_id': instance.foursquare_id,
      'foursquare_type': instance.foursquare_type,
      'reply_markup': instance.reply_markup,
      'input_message_content': instance.input_message_content,
      'thumb_url': instance.thumb_url,
      'thumb_width': instance.thumb_width,
      'thumb_height': instance.thumb_height,
    };

InlineQueryResultVideo _$InlineQueryResultVideoFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultVideo(
    id: json['id'] as String,
    type: json['type'] as String,
    video_url: json['video_url'] as String,
    mime_type: json['mime_type'] as String,
    thumb_url: json['thumb_url'] as String,
    title: json['title'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    video_width: json['video_width'] as int,
    video_height: json['video_height'] as int,
    video_duration: json['video_duration'] as int,
    description: json['description'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultVideoToJson(
        InlineQueryResultVideo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'video_url': instance.video_url,
      'mime_type': instance.mime_type,
      'thumb_url': instance.thumb_url,
      'title': instance.title,
      'caption': instance.caption,
      'parse_mode': instance.parse_mode,
      'video_width': instance.video_width,
      'video_height': instance.video_height,
      'video_duration': instance.video_duration,
      'description': instance.description,
      'reply_markup': instance.reply_markup,
      'input_message_content': instance.input_message_content,
    };

InlineQueryResultVoice _$InlineQueryResultVoiceFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultVoice(
    id: json['id'] as String,
    type: json['type'] as String,
    voice_url: json['voice_url'] as String,
    title: json['title'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    voice_duration: json['voice_duration'] as int,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultVoiceToJson(
        InlineQueryResultVoice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'voice_url': instance.voice_url,
      'title': instance.title,
      'caption': instance.caption,
      'parse_mode': instance.parse_mode,
      'voice_duration': instance.voice_duration,
      'reply_markup': instance.reply_markup,
      'input_message_content': instance.input_message_content,
    };

InputContactMessageContent _$InputContactMessageContentFromJson(
    Map<String, dynamic> json) {
  return InputContactMessageContent(
    phone_number: json['phone_number'] as String,
    first_name: json['first_name'] as String,
    last_name: json['last_name'] as String,
    vcard: json['vcard'] as String,
  );
}

Map<String, dynamic> _$InputContactMessageContentToJson(
        InputContactMessageContent instance) =>
    <String, dynamic>{
      'phone_number': instance.phone_number,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'vcard': instance.vcard,
    };

InputLocationMessageContent _$InputLocationMessageContentFromJson(
    Map<String, dynamic> json) {
  return InputLocationMessageContent(
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    live_period: json['live_period'] as int,
  );
}

Map<String, dynamic> _$InputLocationMessageContentToJson(
        InputLocationMessageContent instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'live_period': instance.live_period,
    };

InputMessageContent _$InputMessageContentFromJson(Map<String, dynamic> json) {
  return InputMessageContent();
}

Map<String, dynamic> _$InputMessageContentToJson(
        InputMessageContent instance) =>
    <String, dynamic>{};

InputTextMessageContent _$InputTextMessageContentFromJson(
    Map<String, dynamic> json) {
  return InputTextMessageContent(
    message_text: json['message_text'] as String,
    parse_mode: json['parse_mode'] as String,
    disable_web_page_preview: json['disable_web_page_preview'] as bool,
  );
}

Map<String, dynamic> _$InputTextMessageContentToJson(
        InputTextMessageContent instance) =>
    <String, dynamic>{
      'message_text': instance.message_text,
      'parse_mode': instance.parse_mode,
      'disable_web_page_preview': instance.disable_web_page_preview,
    };

InputVenueMessageContent _$InputVenueMessageContentFromJson(
    Map<String, dynamic> json) {
  return InputVenueMessageContent(
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    title: json['title'] as String,
    address: json['address'] as String,
    foursquare_id: json['foursquare_id'] as String,
    foursquare_type: json['foursquare_type'] as String,
  );
}

Map<String, dynamic> _$InputVenueMessageContentToJson(
        InputVenueMessageContent instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'title': instance.title,
      'address': instance.address,
      'foursquare_id': instance.foursquare_id,
      'foursquare_type': instance.foursquare_type,
    };
