//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

part of inline;

/// Represents a contact with a phone number.
/// By default, the contact will be sent by the user.
/// Alternatively,
/// you can use *input_message_content* to send a
/// message with the specified content instead of the contact.
///
/// **Note:** This will only work in Telegram versions
/// released after 9 April, 2016.
///
/// Older clients will ignore them.
///
/// https://core.telegram.org/bots/api#inlinequeryresultcontact
@JsonSerializable(includeIfNull: false)
class InlineQueryResultContact implements InlineQueryResult {
  /// Type of the result, must be *contact*.
  @JsonKey(name: 'type', required: true)
  @override
  String type;

  /// Unique identifier for this result, 1-64 bytes.
  @JsonKey(name: 'id', required: true)
  @override
  String id;

  /// Contact's phone number.
  @JsonKey(name: 'phone_number', required: true)
  String phoneNumber;

  /// Contact's first name.
  @JsonKey(name: 'first_name', required: true)
  String firstName;

  /// *Optional.* Contact's last name.
  @JsonKey(name: 'last_name')
  String lastName;

  /// *Optional.* Additional data about the contact
  /// in the form of a [vCard], 0-2048 bytes.
  ///
  /// [vCard]: https://en.wikipedia.org/wiki/VCard
  @JsonKey(name: 'vcard')
  String vcard;

  /// *Optional.* [Inline keyboard] attached to the message.
  ///
  /// [Inline keyboard]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
  @JsonKey(name: 'reply_markup')
  InlineKeyboardMarkup replyMarkup;

  /// *Optional.*
  /// Content of the message to be sent instead of the contact
  @JsonKey(name: 'input_message_content')
  InputMessageContent inputMessageContent;

  /// *Optional.* Url of the thumbnail for the result.
  @JsonKey(name: 'thumb_url')
  String thumbUrl;

  /// *Optional.* Thumbnail width.
  @JsonKey(name: 'thumb_width')
  int thumbWidth;

  /// *Optional.* Thumbnail height.
  @JsonKey(name: 'thumb_height')
  int thumbHeight;

  InlineQueryResultContact({
    this.type = 'contact',
    this.id,
    this.phoneNumber,
    this.firstName,
    this.lastName,
    this.vcard,
    this.replyMarkup,
    this.inputMessageContent,
    this.thumbUrl,
    this.thumbWidth,
    this.thumbHeight,
  });

  factory InlineQueryResultContact.fromJson(Map<String, dynamic> json) =>
      _$InlineQueryResultContactFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InlineQueryResultContactToJson(this);
}
