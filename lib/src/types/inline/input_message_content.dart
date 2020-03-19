/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// This object represents the content of a message
/// to be sent as a result of an inline query.
/// Telegram clients currently support the following 4 types:
/// * [InputTextMessageContent](https://core.telegram.org/bots/api#inputtextmessagecontent)
/// * [InputLocationMessageContent](https://core.telegram.org/bots/api#inputlocationmessagecontent)
/// * [InputVenueMessageContent](https://core.telegram.org/bots/api#inputvenuemessagecontent)
/// * [InputContactMessageContent](https://core.telegram.org/bots/api#inputcontactmessagecontent)
///
/// https://core.telegram.org/bots/api#inputmessagecontent
@JsonSerializable()
class InputMessageContent {
  InputMessageContent();

  factory InputMessageContent.fromJson(Map<String, dynamic> json) =>
      _$InputMessageContentFromJson(json);

  Map<String, dynamic> toJson() => _$InputMessageContentToJson(this);
}
