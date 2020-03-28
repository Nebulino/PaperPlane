/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of inline;

/// Represents the [content] of a contact message to be sent
/// as the result of an inline query.
///
/// [content]: https://core.telegram.org/bots/api#inputmessagecontent
///
/// https://core.telegram.org/bots/api#inputcontactmessagecontent
@JsonSerializable(includeIfNull: false)
class InputContactMessageContent implements InputMessageContent {
  String phone_number;
  String first_name;
  String last_name;
  String vcard;

  InputContactMessageContent(
      {this.phone_number, this.first_name, this.last_name, this.vcard});

  factory InputContactMessageContent.fromJson(Map<String, dynamic> json) =>
      _$InputContactMessageContentFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InputContactMessageContentToJson(this);
}
