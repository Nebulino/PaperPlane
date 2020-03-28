/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inputmedia;

/// Represents a general file to be sent.
///
/// https://core.telegram.org/bots/api#inputmediadocument
@JsonSerializable(includeIfNull: false)
class InputMediaDocument implements InputMedia {
  @override
  String caption;
  @override
  String media;
  @override
  String parse_mode;
  @override
  String type;
  dynamic thumb;

  InputMediaDocument(
      {this.type = 'document',
      this.media,
      this.thumb,
      this.caption,
      this.parse_mode});

  factory InputMediaDocument.fromJson(Map<String, dynamic> json) =>
      _$InputMediaDocumentFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InputMediaDocumentToJson(this);
}
