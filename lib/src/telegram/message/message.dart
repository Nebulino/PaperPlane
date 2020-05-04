/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of message;

/// This object represents a message.
///
/// https://core.telegram.org/bots/api#message
@JsonSerializable(includeIfNull: false)
class Message {
  /// Unique message identifier inside this chat.
  @JsonKey(name: 'message_id', required: true)
  int messageID;

  /// *Optional.* Sender, empty for messages sent to channels.
  @JsonKey(name: 'from')
  User from;

  /// Date the message was sent in Unix time.
  @JsonKey(
      name: 'date',
      required: true,
      fromJson: _dateTimeFromTelegramInt,
      toJson: _dateTimeToTelegramInt)
  DateTime date;

  /// Conversation the message belongs to.
  @JsonKey(name: 'chat', required: true)
  Chat chat;

  /// *Optional.* For forwarded messages, sender of the original message.
  @JsonKey(name: 'forward_from')
  User forwardFrom;

  /// *Optional.* For messages forwarded from channels,
  /// information about the original channel.
  @JsonKey(name: 'forward_from_chat')
  Chat forwardFromChat;

  /// *Optional.* For messages forwarded from channels,
  /// identifier of the original message in the channel.
  @JsonKey(name: 'forward_from_message_id')
  int forwardFromMessageID;

  /// *Optional.* For messages forwarded from channels,
  /// signature of the post author if present.
  @JsonKey(name: 'forward_signature')
  String forwardSignature;

  /// *Optional.* Sender's name for messages forwarded from users
  /// who disallow adding a link to their account in forwarded messages.
  @JsonKey(name: 'forward_sender_name')
  String forwardSenderName;

  /// *Optional.* For forwarded messages,
  /// date the original message was sent in Unix time.
  @JsonKey(
      name: 'forward_date',
      fromJson: _dateTimeFromTelegramInt,
      toJson: _dateTimeToTelegramInt)
  DateTime forwardDate;

  /// *Optional.* For replies, the original message.
  /// Note that the Message object in this field will
  /// not contain further reply_to_message fields even if it itself
  /// is a reply.
  @JsonKey(name: 'reply_to_message')
  Message replyToMessage;

  /// *Optional.* Date the message was last edited in Unix time.
  @JsonKey(
      name: 'edit_date',
      fromJson: _dateTimeFromTelegramInt,
      toJson: _dateTimeToTelegramInt)
  DateTime editDate;

  /// 	*Optional.*
  /// The unique identifier of a media message group this message belongs to.
  @JsonKey(name: 'media_group_id')
  String mediaGroupID;

  /// *Optional.* Signature of the post author for messages in channels.
  @JsonKey(name: 'author_signature')
  String authorSignature;

  /// *Optional.* For text messages,
  /// the actual UTF-8 text of the message, 0-4096 characters.
  @JsonKey(name: 'text')
  String text;

  /// *Optional.* For text messages, special entities like usernames, URLs,
  /// bot commands, etc. that appear in the text
  @JsonKey(name: 'entities')
  List<MessageEntity> entities;

  /// *Optional.* For messages with a caption, special entities like usernames,
  /// URLs, bot commands, etc. that appear in the caption
  @JsonKey(name: 'caption_entities')
  List<MessageEntity> captionEntities;

  /// *Optional.* Message is an audio file, information about the file.
  @JsonKey(name: 'audio')
  Audio audio;

  /// *Optional.* Message is a general file, information about the file.
  @JsonKey(name: 'document')
  Document document;

  /// *Optional.* Message is an animation,
  /// information about the animation.
  /// For backward compatibility, when this field is set,
  /// the *document* field will also be set.
  @JsonKey(name: 'animation')
  Animation animation;

  /// *Optional.*
  /// Message is a game, information about the game.
  /// [More about games »]
  ///
  /// [More about games »]: https://core.telegram.org/bots/api#games
  @JsonKey(name: 'game')
  Game game;

  /// *Optional.* Message is a photo, available sizes of the photo.
  @JsonKey(name: 'photo')
  List<PhotoSize> photo;

  /// *Optional.* Message is a sticker, information about the sticker.
  @JsonKey(name: 'sticker')
  Sticker sticker;

  /// *Optional.* Message is a video, information about the video.
  @JsonKey(name: 'video')
  Video video;

  /// *Optional.* Message is a voice message, information about the file.
  @JsonKey(name: 'voice')
  Voice voice;

  ///	*Optional.* Message is a [video note], information about the video message.
  ///
  /// [video note]: https://telegram.org/blog/video-messages-and-telescope
  @JsonKey(name: 'video_note')
  VideoNote videoNote;

  /// *Optional.* Caption for the animation, audio,
  /// document, photo, video or voice, 0-1024 characters.
  @JsonKey(name: 'caption')
  String caption;

  /// *Optional.* Message is a shared contact, information about the contact.
  @JsonKey(name: 'contact')
  Contact contact;

  ///	*Optional.* Message is a shared location, information about the location.
  @JsonKey(name: 'location')
  Location location;

  ///	*Optional.* Message is a venue, information about the venue.
  @JsonKey(name: 'venue')
  Venue venue;

  ///	*Optional.* Message is a native poll, information about the poll.
  @JsonKey(name: 'poll')
  Poll poll;

  /// *Optional.* Message is a dice with random value from 1 to 6.
  @JsonKey(name: 'dice')
  Dice dice;

  ///	*Optional.* New members that were added to the group or supergroup
  /// and information about them (the bot itself may be one of these members).
  @JsonKey(name: 'new_chat_members')
  List<User> newChatMembers;

  ///	*Optional.* A member was removed from the group, information about them
  /// (this member may be the bot itself).
  @JsonKey(name: 'left_chat_member')
  User leftChatMember;

  /// *Optional.* A chat title was changed to this value.
  @JsonKey(name: 'new_chat_title')
  String newChatTitle;

  ///	*Optional.* A chat photo was change to this value.
  @JsonKey(name: 'new_chat_photo')
  List<PhotoSize> newChatPhoto;

  /// *Optional.* Service message: the chat photo was deleted.
  @JsonKey(name: 'delete_chat_photo')
  bool deleteChatPhoto;

  /// *Optional.* Service message: the group has been created.
  @JsonKey(name: 'group_chat_created')
  bool groupChatCreated;

  /// *Optional.* Service message: the supergroup has been created.
  /// This field can‘t be received in a message coming through updates,
  /// because bot can’t be a member of a supergroup when it is created.
  /// It can only be found in reply_to_message if
  /// someone replies to a very first message in a directly created supergroup.
  @JsonKey(name: 'supergroup_chat_created')
  bool supergroupChatCreated;

  ///	*Optional.* Service message: the channel has been created.
  /// This field can‘t be received in a message coming through updates,
  /// because bot can’t be a member of a channel when it is created.
  /// It can only be found in reply_to_message if someone replies to a
  /// very first message in a channel.
  @JsonKey(name: 'channel_chat_created')
  bool channelChatCreated;

  /// *Optional.* The group has been migrated to a
  /// supergroup with the specified identifier.
  /// This number may be greater than 32 bits and
  /// some programming languages may have difficulty/silent defects
  /// in interpreting it. But it is smaller than 52 bits,
  /// so a signed 64 bit integer or double-precision float
  /// type are safe for storing this identifier.
  @JsonKey(name: 'migrate_to_chat_id')
  int migrateToChatID;

  /// *Optional.* The supergroup has been migrated from a group
  /// with the specified identifier. This number may be greater
  /// than 32 bits and some programming languages may have
  /// difficulty/silent defects in interpreting it. But it is smaller
  /// than 52 bits, so a signed 64 bit integer or double-precision
  /// float type are safe for storing this identifier.
  @JsonKey(name: 'migrate_from_chat_id')
  int migrateFromChatID;

  /// 	*Optional.* Specified message was pinned.
  /// Note that the Message object in this field will not
  /// contain further reply_to_message fields even if it is itself a reply.
  @JsonKey(name: 'pinned_message')
  Message pinnedMessage;

  /// *Optional.* Message is an invoice for a [payment],
  /// information about the invoice.
  /// [More about payments »]
  ///
  /// [payment]: https://core.telegram.org/bots/api#payments
  /// [More about payments »]: https://core.telegram.org/bots/api#payments
  @JsonKey(name: 'invoice')
  Invoice invoice;

  /// *Optional.* Message is a service message about a successful payment,
  /// information about the payment.
  /// [More about payments »]
  ///
  /// [More about payments »]: https://core.telegram.org/bots/api#payments
  @JsonKey(name: 'successful_payment')
  SuccessfulPayment successfulPayment;

  /// *Optional.* The domain name of the website on which
  /// the user has logged in.
  /// [More about Telegram Login »]
  ///
  /// [More about Telegram Login »]: https://core.telegram.org/widgets/login
  @JsonKey(name: 'connected_website')
  String connectedWebsite;

  /// *Optional.* Telegram Passport data.
  @JsonKey(name: 'passport_data')
  PassportData passportData;

  /// *Optional.* Inline keyboard attached to the message.
  /// [login_url] buttons are represented as ordinary [url] buttons.
  @JsonKey(name: 'reply_markup')
  InlineKeyboardMarkup replyMarkup;

  Message({
    this.messageID,
    this.from,
    this.date,
    this.chat,
    this.forwardFrom,
    this.forwardFromChat,
    this.forwardFromMessageID,
    this.forwardSignature,
    this.forwardSenderName,
    this.forwardDate,
    this.replyToMessage,
    this.editDate,
    this.mediaGroupID,
    this.authorSignature,
    this.text,
    this.entities,
    this.captionEntities,
    this.audio,
    this.document,
    this.animation,
    this.game,
    this.photo,
    this.sticker,
    this.video,
    this.voice,
    this.videoNote,
    this.caption,
    this.contact,
    this.location,
    this.venue,
    this.poll,
    this.newChatMembers,
    this.leftChatMember,
    this.newChatTitle,
    this.newChatPhoto,
    this.deleteChatPhoto,
    this.groupChatCreated,
    this.supergroupChatCreated,
    this.channelChatCreated,
    this.migrateToChatID,
    this.migrateFromChatID,
    this.pinnedMessage,
    this.invoice,
    this.successfulPayment,
    this.connectedWebsite,
    this.passportData,
    this.replyMarkup,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);

  /// Helper: converts into a DateTime type from
  /// a int (unix time) received from Telegram API.
  static DateTime _dateTimeFromTelegramInt(int unixTime) => unixTime == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);

  /// Helper: converts from a DateTime type into
  /// a int (unix time) to be sent to Telegram API.
  static int _dateTimeToTelegramInt(DateTime dateTime) => dateTime == null
      ? null
      : (dateTime.millisecondsSinceEpoch / 1000).round();
}
