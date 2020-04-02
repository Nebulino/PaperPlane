/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inputmedia;

/// This object represents the content of a media
/// message to be sent. It should be one of
/// * [InputMediaAnimation](https://core.telegram.org/bots/api#inputmediaanimation)
/// * [InputMediaDocument](https://core.telegram.org/bots/api#inputmediadocument)
/// * [InputMediaAudio](https://core.telegram.org/bots/api#inputmediaaudio)
/// * [InputMediaPhoto](https://core.telegram.org/bots/api#inputmediaphoto)
/// * [InputMediaVideo](https://core.telegram.org/bots/api#inputmediavideo)
///
/// https://core.telegram.org/bots/api#inputmedia
@JsonSerializable(includeIfNull: false)
class InputMedia {
  /// Type of the result.
  @JsonKey(name: 'type', required: true)
  String type;

  /// Container of the media.
  @JsonKey(name: 'media', required: true)
  dynamic media;

  /// Caption, 0-1024 characters after entities parsing.
  @JsonKey(name: 'caption')
  String caption;

  /// Optional.
  /// Send *[Markdown]* or *[HTML]*,
  /// if you want Telegram apps to show [bold, italic,
  /// fixed-width text or inline URLs] in the media caption.
  ///
  /// [Markdown]: https://core.telegram.org/bots/api#markdown-style
  /// [HTML]: https://core.telegram.org/bots/api#html-style
  /// [bold, italic, fixed-width text or inline URLs]: https://core.telegram.org/bots/api#formatting-options
  @JsonKey(name: 'parse_mode')
  String parseMode;

  InputMedia({this.type, this.media, this.caption, this.parseMode});

  factory InputMedia.fromJson(Map<String, dynamic> json) =>
      _$InputMediaFromJson(json);

  Map<String, dynamic> toJson() => _$InputMediaToJson(this);
}
