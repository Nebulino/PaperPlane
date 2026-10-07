// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['message_id', 'date', 'chat']);
  return Message(
      messageID: (json['message_id'] as num?)?.toInt(),
      from: json['from'] == null
          ? null
          : User.fromJson(json['from'] as Map<String, dynamic>),
      date: Message._dateTimeFromTelegramInt((json['date'] as num?)?.toInt()),
      chat: json['chat'] == null
          ? null
          : Chat.fromJson(json['chat'] as Map<String, dynamic>),
      forwardFrom: json['forward_from'] == null
          ? null
          : User.fromJson(json['forward_from'] as Map<String, dynamic>),
      forwardFromChat: json['forward_from_chat'] == null
          ? null
          : Chat.fromJson(json['forward_from_chat'] as Map<String, dynamic>),
      forwardFromMessageID: (json['forward_from_message_id'] as num?)?.toInt(),
      forwardSignature: json['forward_signature'] as String?,
      forwardSenderName: json['forward_sender_name'] as String?,
      forwardDate: Message._dateTimeFromTelegramInt(
        (json['forward_date'] as num?)?.toInt(),
      ),
      replyToMessage: json['reply_to_message'] == null
          ? null
          : Message.fromJson(json['reply_to_message'] as Map<String, dynamic>),
      editDate: Message._dateTimeFromTelegramInt(
        (json['edit_date'] as num?)?.toInt(),
      ),
      mediaGroupID: json['media_group_id'] as String?,
      authorSignature: json['author_signature'] as String?,
      text: json['text'] as String?,
      entities: (json['entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      captionEntities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      audio: json['audio'] == null
          ? null
          : Audio.fromJson(json['audio'] as Map<String, dynamic>),
      document: json['document'] == null
          ? null
          : Document.fromJson(json['document'] as Map<String, dynamic>),
      animation: json['animation'] == null
          ? null
          : Animation.fromJson(json['animation'] as Map<String, dynamic>),
      game: json['game'] == null
          ? null
          : Game.fromJson(json['game'] as Map<String, dynamic>),
      photo: (json['photo'] as List<dynamic>?)
          ?.map((e) => PhotoSize.fromJson(e as Map<String, dynamic>))
          .toList(),
      sticker: json['sticker'] == null
          ? null
          : Sticker.fromJson(json['sticker'] as Map<String, dynamic>),
      video: json['video'] == null
          ? null
          : Video.fromJson(json['video'] as Map<String, dynamic>),
      voice: json['voice'] == null
          ? null
          : Voice.fromJson(json['voice'] as Map<String, dynamic>),
      videoNote: json['video_note'] == null
          ? null
          : VideoNote.fromJson(json['video_note'] as Map<String, dynamic>),
      caption: json['caption'] as String?,
      contact: json['contact'] == null
          ? null
          : Contact.fromJson(json['contact'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      venue: json['venue'] == null
          ? null
          : Venue.fromJson(json['venue'] as Map<String, dynamic>),
      poll: json['poll'] == null
          ? null
          : Poll.fromJson(json['poll'] as Map<String, dynamic>),
      newChatMembers: (json['new_chat_members'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      leftChatMember: json['left_chat_member'] == null
          ? null
          : User.fromJson(json['left_chat_member'] as Map<String, dynamic>),
      newChatTitle: json['new_chat_title'] as String?,
      newChatPhoto: (json['new_chat_photo'] as List<dynamic>?)
          ?.map((e) => PhotoSize.fromJson(e as Map<String, dynamic>))
          .toList(),
      deleteChatPhoto: json['delete_chat_photo'] as bool?,
      groupChatCreated: json['group_chat_created'] as bool?,
      supergroupChatCreated: json['supergroup_chat_created'] as bool?,
      channelChatCreated: json['channel_chat_created'] as bool?,
      migrateToChatID: (json['migrate_to_chat_id'] as num?)?.toInt(),
      migrateFromChatID: (json['migrate_from_chat_id'] as num?)?.toInt(),
      pinnedMessage: json['pinned_message'] == null
          ? null
          : Message.fromJson(json['pinned_message'] as Map<String, dynamic>),
      invoice: json['invoice'] == null
          ? null
          : Invoice.fromJson(json['invoice'] as Map<String, dynamic>),
      successfulPayment: json['successful_payment'] == null
          ? null
          : SuccessfulPayment.fromJson(
              json['successful_payment'] as Map<String, dynamic>,
            ),
      connectedWebsite: json['connected_website'] as String?,
      passportData: json['passport_data'] == null
          ? null
          : PassportData.fromJson(
              json['passport_data'] as Map<String, dynamic>,
            ),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>,
            ),
    )
    ..dice = json['dice'] == null
        ? null
        : Dice.fromJson(json['dice'] as Map<String, dynamic>);
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
  'message_id': ?instance.messageID,
  'from': ?instance.from,
  'date': ?Message._dateTimeToTelegramInt(instance.date),
  'chat': ?instance.chat,
  'forward_from': ?instance.forwardFrom,
  'forward_from_chat': ?instance.forwardFromChat,
  'forward_from_message_id': ?instance.forwardFromMessageID,
  'forward_signature': ?instance.forwardSignature,
  'forward_sender_name': ?instance.forwardSenderName,
  'forward_date': ?Message._dateTimeToTelegramInt(instance.forwardDate),
  'reply_to_message': ?instance.replyToMessage,
  'edit_date': ?Message._dateTimeToTelegramInt(instance.editDate),
  'media_group_id': ?instance.mediaGroupID,
  'author_signature': ?instance.authorSignature,
  'text': ?instance.text,
  'entities': ?instance.entities,
  'caption_entities': ?instance.captionEntities,
  'audio': ?instance.audio,
  'document': ?instance.document,
  'animation': ?instance.animation,
  'game': ?instance.game,
  'photo': ?instance.photo,
  'sticker': ?instance.sticker,
  'video': ?instance.video,
  'voice': ?instance.voice,
  'video_note': ?instance.videoNote,
  'caption': ?instance.caption,
  'contact': ?instance.contact,
  'location': ?instance.location,
  'venue': ?instance.venue,
  'poll': ?instance.poll,
  'dice': ?instance.dice,
  'new_chat_members': ?instance.newChatMembers,
  'left_chat_member': ?instance.leftChatMember,
  'new_chat_title': ?instance.newChatTitle,
  'new_chat_photo': ?instance.newChatPhoto,
  'delete_chat_photo': ?instance.deleteChatPhoto,
  'group_chat_created': ?instance.groupChatCreated,
  'supergroup_chat_created': ?instance.supergroupChatCreated,
  'channel_chat_created': ?instance.channelChatCreated,
  'migrate_to_chat_id': ?instance.migrateToChatID,
  'migrate_from_chat_id': ?instance.migrateFromChatID,
  'pinned_message': ?instance.pinnedMessage,
  'invoice': ?instance.invoice,
  'successful_payment': ?instance.successfulPayment,
  'connected_website': ?instance.connectedWebsite,
  'passport_data': ?instance.passportData,
  'reply_markup': ?instance.replyMarkup,
};

MessageEntity _$MessageEntityFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['type', 'offset', 'length']);
  return MessageEntity(
    type: json['type'] as String?,
    offset: (json['offset'] as num?)?.toInt(),
    length: (json['length'] as num?)?.toInt(),
    url: json['url'] as String?,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    language: json['language'] as String?,
  );
}

Map<String, dynamic> _$MessageEntityToJson(MessageEntity instance) =>
    <String, dynamic>{
      'type': ?instance.type,
      'offset': ?instance.offset,
      'length': ?instance.length,
      'url': ?instance.url,
      'user': ?instance.user,
      'language': ?instance.language,
    };
