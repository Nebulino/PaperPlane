//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

part of '../message.dart';

/// Contains the quoted part of a message that is replied to.
///
/// See https://core.telegram.org/bots/api#textquote
@JsonSerializable(includeIfNull: false)
class TextQuote {
  /// Text of the quoted part of a message that is replied to by the given message.
  @JsonKey(name: 'text', required: true)
  String? text;

  /// Special entities that appear in the quote.
  ///
  /// Currently, only bold, italic, underline, strikethrough, spoiler, and custom_emoji
  /// entities are kept in quotes.
  @JsonKey(name: 'entities')
  List<MessageEntity>? entities;

  /// Approximate quote position in the original message in UTF-16 code units.
  @JsonKey(name: 'position', required: true)
  int? position;

  /// Whether the quote was chosen manually by the message sender.
  ///
  /// Otherwise, the quote was added automatically by the server.
  @JsonKey(name: 'is_manual')
  bool? isManual;

  TextQuote({
    this.text,
    this.entities,
    this.position,
    this.isManual,
  });

  factory TextQuote.fromJson(Map<String, dynamic> json) =>
      _$TextQuoteFromJson(json);

  Map<String, dynamic> toJson() => _$TextQuoteToJson(this);
}
