/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// InputMessageContent telegram.types Class
/// https://core.telegram.org/bots/api#inputmessagecontent
@JsonSerializable()
class InputMessageContent {
  InputMessageContent();

  factory InputMessageContent.fromJson(Map<String, dynamic> json) =>
      _$InputMessageContentFromJson(json);

  Map<String, dynamic> toJson() => _$InputMessageContentToJson(this);
}
