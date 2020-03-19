/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents a link to a voice recording
/// in an .ogg container encoded with OPUS.
/// By default, this voice recording will
/// be sent by the user.
/// Alternatively,
/// you can use *input_message_content*
/// to send a message with the specified content instead
/// of the the voice message.
///
/// **Note:** This will only work in Telegram
/// versions released after 9 April, 2016.
///
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultvoice
@JsonSerializable()
class InlineQueryResultVoice implements InlineQueryResult {
  @override
  String id;
  @override
  String type;
  String voice_url;
  String title;
  String caption;
  String parse_mode;
  int voice_duration;
  InlineKeyboardMarkup reply_markup;
  InputMessageContent input_message_content;

  InlineQueryResultVoice(
      {this.id,
      this.type = 'voice',
      this.voice_url,
      this.title,
      this.caption,
      this.parse_mode,
      this.voice_duration,
      this.reply_markup,
      this.input_message_content});

  factory InlineQueryResultVoice.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultVoiceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultVoiceToJson(this);
}
