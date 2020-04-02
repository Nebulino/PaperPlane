/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// This object represents one result of an inline query.
/// Telegram clients currently support results of the following 20 types:
/// * [InlineQueryResultCachedAudio](https://core.telegram.org/bots/api#inlinequeryresultcachedaudio)
/// * [InlineQueryResultCachedDocument](https://core.telegram.org/bots/api#inlinequeryresultcacheddocument)
/// * [InlineQueryResultCachedGif](https://core.telegram.org/bots/api#inlinequeryresultcachedgif)
/// * [InlineQueryResultCachedMpeg4Gif](https://core.telegram.org/bots/api#inlinequeryresultcachedmpeg4gif)
/// * [InlineQueryResultCachedPhoto](https://core.telegram.org/bots/api#inlinequeryresultcachedphoto)
/// * [InlineQueryResultCachedSticker](https://core.telegram.org/bots/api#inlinequeryresultcachedsticker)
/// * [InlineQueryResultCachedVideo](https://core.telegram.org/bots/api#inlinequeryresultcachedvideo)
/// * [InlineQueryResultCachedVoice](https://core.telegram.org/bots/api#inlinequeryresultcachedvoice)
/// * [InlineQueryResultArticle](https://core.telegram.org/bots/api#inlinequeryresultarticle)
/// * [InlineQueryResultAudio](https://core.telegram.org/bots/api#inlinequeryresultaudio)
/// * [InlineQueryResultContact](https://core.telegram.org/bots/api#inlinequeryresultcontact)
/// * [InlineQueryResultGame](https://core.telegram.org/bots/api#inlinequeryresultgame)
/// * [InlineQueryResultDocument](https://core.telegram.org/bots/api#inlinequeryresultdocument)
/// * [InlineQueryResultGif](https://core.telegram.org/bots/api#inlinequeryresultgif)
/// * [InlineQueryResultLocation](https://core.telegram.org/bots/api#inlinequeryresultlocation)
/// * [InlineQueryResultMpeg4Gif](https://core.telegram.org/bots/api#inlinequeryresultmpeg4gif)
/// * [InlineQueryResultPhoto](https://core.telegram.org/bots/api#inlinequeryresultphoto)
/// * [InlineQueryResultVenue](https://core.telegram.org/bots/api#inlinequeryresultvenue)
/// * [InlineQueryResultVideo](https://core.telegram.org/bots/api#inlinequeryresultvideo)
/// * [InlineQueryResultVoice](https://core.telegram.org/bots/api#inlinequeryresultvoice)
///
/// https://core.telegram.org/bots/api#inlinequeryresult
@JsonSerializable(includeIfNull: false)
class InlineQueryResult {
  /// Type of the result.
  @JsonKey(name: 'type', required: true)
  String type;

  /// Unique identifier for this result, 1-64 Bytes.
  @JsonKey(name: 'id', required: true)
  String id;

  InlineQueryResult({this.type, this.id});

  factory InlineQueryResult.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultFromJson(json);

  Map<String, dynamic> toJson() => _$InlineQueryResultToJson(this);
}
