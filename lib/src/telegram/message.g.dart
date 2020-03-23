// GENERATED CODE - DO NOT MODIFY BY HAND

part of message;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    message_id: json['message_id'] as int,
    from: json['from'] == null
        ? null
        : User.fromJson(json['from'] as Map<String, dynamic>),
    date: json['date'] as int,
    chat: json['chat'] == null
        ? null
        : Chat.fromJson(json['chat'] as Map<String, dynamic>),
    forward_from: json['forward_from'] == null
        ? null
        : User.fromJson(json['forward_from'] as Map<String, dynamic>),
    forward_from_chat: json['forward_from_chat'] == null
        ? null
        : Chat.fromJson(json['forward_from_chat'] as Map<String, dynamic>),
    forward_from_message_id: json['forward_from_message_id'] as int,
    forward_signature: json['forward_signature'] as String,
    forward_sender_name: json['forward_sender_name'] as String,
    forward_date: json['forward_date'] as int,
    reply_to_message: json['reply_to_message'] == null
        ? null
        : Message.fromJson(json['reply_to_message'] as Map<String, dynamic>),
    edit_date: json['edit_date'] as int,
    media_group_id: json['media_group_id'] as String,
    author_signature: json['author_signature'] as String,
    text: json['text'] as String,
    entities: (json['entities'] as List)
        ?.map((e) => e == null
            ? null
            : MessageEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    caption_entities: (json['caption_entities'] as List)
        ?.map((e) => e == null
            ? null
            : MessageEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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
    photo: (json['photo'] as List)
        ?.map((e) =>
            e == null ? null : PhotoSize.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sticker: json['sticker'] == null
        ? null
        : Sticker.fromJson(json['sticker'] as Map<String, dynamic>),
    video: json['video'] == null
        ? null
        : Video.fromJson(json['video'] as Map<String, dynamic>),
    voice: json['voice'] == null
        ? null
        : Voice.fromJson(json['voice'] as Map<String, dynamic>),
    video_note: json['video_note'] == null
        ? null
        : VideoNote.fromJson(json['video_note'] as Map<String, dynamic>),
    caption: json['caption'] as String,
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
    new_chat_members: (json['new_chat_members'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    left_chat_member: json['left_chat_member'] == null
        ? null
        : User.fromJson(json['left_chat_member'] as Map<String, dynamic>),
    new_chat_title: json['new_chat_title'] as String,
    new_chat_photo: (json['new_chat_photo'] as List)
        ?.map((e) =>
            e == null ? null : PhotoSize.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    delete_chat_photo: json['delete_chat_photo'] as bool,
    group_chat_created: json['group_chat_created'] as bool,
    supergroup_chat_created: json['supergroup_chat_created'] as bool,
    channel_chat_created: json['channel_chat_created'] as bool,
    migrate_to_chat_id: json['migrate_to_chat_id'] as int,
    migrate_from_chat_id: json['migrate_from_chat_id'] as int,
    pinned_message: json['pinned_message'] == null
        ? null
        : Message.fromJson(json['pinned_message'] as Map<String, dynamic>),
    invoice: json['invoice'] == null
        ? null
        : Invoice.fromJson(json['invoice'] as Map<String, dynamic>),
    successful_payment: json['successful_payment'] == null
        ? null
        : SuccessfulPayment.fromJson(
            json['successful_payment'] as Map<String, dynamic>),
    connected_website: json['connected_website'] as String,
    passport_data: json['passport_data'] == null
        ? null
        : PassportData.fromJson(json['passport_data'] as Map<String, dynamic>),
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'message_id': instance.message_id,
      'from': instance.from,
      'date': instance.date,
      'chat': instance.chat,
      'forward_from': instance.forward_from,
      'forward_from_chat': instance.forward_from_chat,
      'forward_from_message_id': instance.forward_from_message_id,
      'forward_signature': instance.forward_signature,
      'forward_sender_name': instance.forward_sender_name,
      'forward_date': instance.forward_date,
      'reply_to_message': instance.reply_to_message,
      'edit_date': instance.edit_date,
      'media_group_id': instance.media_group_id,
      'author_signature': instance.author_signature,
      'text': instance.text,
      'entities': instance.entities,
      'caption_entities': instance.caption_entities,
      'audio': instance.audio,
      'document': instance.document,
      'animation': instance.animation,
      'game': instance.game,
      'photo': instance.photo,
      'sticker': instance.sticker,
      'video': instance.video,
      'voice': instance.voice,
      'video_note': instance.video_note,
      'caption': instance.caption,
      'contact': instance.contact,
      'location': instance.location,
      'venue': instance.venue,
      'poll': instance.poll,
      'new_chat_members': instance.new_chat_members,
      'left_chat_member': instance.left_chat_member,
      'new_chat_title': instance.new_chat_title,
      'new_chat_photo': instance.new_chat_photo,
      'delete_chat_photo': instance.delete_chat_photo,
      'group_chat_created': instance.group_chat_created,
      'supergroup_chat_created': instance.supergroup_chat_created,
      'channel_chat_created': instance.channel_chat_created,
      'migrate_to_chat_id': instance.migrate_to_chat_id,
      'migrate_from_chat_id': instance.migrate_from_chat_id,
      'pinned_message': instance.pinned_message,
      'invoice': instance.invoice,
      'successful_payment': instance.successful_payment,
      'connected_website': instance.connected_website,
      'passport_data': instance.passport_data,
      'reply_markup': instance.reply_markup,
    };

MessageEntity _$MessageEntityFromJson(Map<String, dynamic> json) {
  return MessageEntity(
    type: json['type'] as String,
    offset: json['offset'] as int,
    length: json['length'] as int,
    url: json['url'] as String,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    language: json['language'] as String,
  );
}

Map<String, dynamic> _$MessageEntityToJson(MessageEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'offset': instance.offset,
      'length': instance.length,
      'url': instance.url,
      'user': instance.user,
      'language': instance.language,
    };
