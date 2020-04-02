/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inputmedia;

/// Represents a photo to be sent.
///
/// https://core.telegram.org/bots/api#inputmediaphoto
@JsonSerializable(includeIfNull: false)
class InputMediaPhoto implements InputMedia {
  /// Type of the result, must be *animation*
  @JsonKey(name: 'type', required: true)
  @override
  String type;

  /// File to send.
  /// Pass a file_id to send a file that exists on
  /// the Telegram servers (recommended),
  /// pass an HTTP URL for Telegram to get a file from the Internet,
  /// or pass “attach://<file_attach_name>” to upload a new
  /// one using multipart/form-data under <file_attach_name> name.
  /// [More info on Sending Files »]
  ///
  /// [More info on Sending Files »]: https://core.telegram.org/bots/api#sending-files
  @JsonKey(name: 'media', required: true)
  @override
  dynamic media;

  /// *Optional.* Caption of the audio to be sent,
  /// 0-1024 characters after entities parsing.
  @JsonKey(name: 'caption')
  @override
  String caption;

  /// *Optional.*
  /// Send *[Markdown]* or *[HTML]*,
  /// if you want Telegram apps to show [bold, italic,
  /// fixed-width text or inline URLs] in the media caption.
  ///
  /// [Markdown]: https://core.telegram.org/bots/api#markdown-style
  /// [HTML]: https://core.telegram.org/bots/api#html-style
  /// [bold, italic, fixed-width text or inline URLs]: https://core.telegram.org/bots/api#formatting-options
  @JsonKey(name: 'parse_mode')
  @override
  ParseMode parseMode;

  InputMediaPhoto(
      {this.type = 'photo', this.media, this.caption, this.parseMode});

  factory InputMediaPhoto.fromJson(Map<String, dynamic> json) =>
      _$InputMediaPhotoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InputMediaPhotoToJson(this);
}
