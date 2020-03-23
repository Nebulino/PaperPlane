// GENERATED CODE - DO NOT MODIFY BY HAND

part of chat;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return Chat(
    id: json['id'] as int,
    type: json['type'] as String,
    title: json['title'] as String,
    username: json['username'] as String,
    first_name: json['first_name'] as String,
    last_name: json['last_name'] as String,
    all_members_are_administrators:
        json['all_members_are_administrators'] as bool,
    photo: json['photo'] == null
        ? null
        : ChatPhoto.fromJson(json['photo'] as Map<String, dynamic>),
    description: json['description'] as String,
    invite_link: json['invite_link'] as String,
    pinned_message: json['pinned_message'] == null
        ? null
        : Message.fromJson(json['pinned_message'] as Map<String, dynamic>),
    permissions: json['permissions'] == null
        ? null
        : ChatPermissions.fromJson(json['permissions'] as Map<String, dynamic>),
    slow_mode_delay: json['slow_mode_delay'] as int,
    sticker_set_name: json['sticker_set_name'] as String,
    can_set_sticker_set: json['can_set_sticker_set'] as bool,
  );
}

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'username': instance.username,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'all_members_are_administrators': instance.all_members_are_administrators,
      'photo': instance.photo,
      'description': instance.description,
      'invite_link': instance.invite_link,
      'pinned_message': instance.pinned_message,
      'permissions': instance.permissions,
      'slow_mode_delay': instance.slow_mode_delay,
      'sticker_set_name': instance.sticker_set_name,
      'can_set_sticker_set': instance.can_set_sticker_set,
    };

ChatMember _$ChatMemberFromJson(Map<String, dynamic> json) {
  return ChatMember(
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    status: json['status'] as String,
    custom_title: json['custom_title'] as String,
    until_date: json['until_date'] as int,
    can_be_edited: json['can_be_edited'] as bool,
    can_post_messages: json['can_post_messages'] as bool,
    can_edit_messages: json['can_edit_messages'] as bool,
    can_delete_messages: json['can_delete_messages'] as bool,
    can_restrict_members: json['can_restrict_members'] as bool,
    can_promote_members: json['can_promote_members'] as bool,
    can_change_info: json['can_change_info'] as bool,
    can_invite_users: json['can_invite_users'] as bool,
    can_pin_messages: json['can_pin_messages'] as bool,
    is_member: json['is_member'] as bool,
    can_send_messages: json['can_send_messages'] as bool,
    can_send_media_messages: json['can_send_media_messages'] as bool,
    can_send_polls: json['can_send_polls'] as bool,
    can_send_other_messages: json['can_send_other_messages'] as bool,
    can_add_web_page_previews: json['can_add_web_page_previews'] as bool,
  );
}

Map<String, dynamic> _$ChatMemberToJson(ChatMember instance) =>
    <String, dynamic>{
      'user': instance.user,
      'status': instance.status,
      'custom_title': instance.custom_title,
      'until_date': instance.until_date,
      'can_be_edited': instance.can_be_edited,
      'can_post_messages': instance.can_post_messages,
      'can_edit_messages': instance.can_edit_messages,
      'can_delete_messages': instance.can_delete_messages,
      'can_restrict_members': instance.can_restrict_members,
      'can_promote_members': instance.can_promote_members,
      'can_change_info': instance.can_change_info,
      'can_invite_users': instance.can_invite_users,
      'can_pin_messages': instance.can_pin_messages,
      'is_member': instance.is_member,
      'can_send_messages': instance.can_send_messages,
      'can_send_media_messages': instance.can_send_media_messages,
      'can_send_polls': instance.can_send_polls,
      'can_send_other_messages': instance.can_send_other_messages,
      'can_add_web_page_previews': instance.can_add_web_page_previews,
    };

ChatPermissions _$ChatPermissionsFromJson(Map<String, dynamic> json) {
  return ChatPermissions(
    can_send_messages: json['can_send_messages'] as bool,
    can_send_media_messages: json['can_send_media_messages'] as bool,
    can_send_polls: json['can_send_polls'] as bool,
    can_send_other_messages: json['can_send_other_messages'] as bool,
    can_add_web_page_previews: json['can_add_web_page_previews'] as bool,
    can_change_info: json['can_change_info'] as bool,
    can_invite_users: json['can_invite_users'] as bool,
    can_pin_messages: json['can_pin_messages'] as bool,
  );
}

Map<String, dynamic> _$ChatPermissionsToJson(ChatPermissions instance) =>
    <String, dynamic>{
      'can_send_messages': instance.can_send_messages,
      'can_send_media_messages': instance.can_send_media_messages,
      'can_send_polls': instance.can_send_polls,
      'can_send_other_messages': instance.can_send_other_messages,
      'can_add_web_page_previews': instance.can_add_web_page_previews,
      'can_change_info': instance.can_change_info,
      'can_invite_users': instance.can_invite_users,
      'can_pin_messages': instance.can_pin_messages,
    };

ChatPhoto _$ChatPhotoFromJson(Map<String, dynamic> json) {
  return ChatPhoto(
    small_file_id: json['small_file_id'] as String,
    small_file_unique_id: json['small_file_unique_id'] as String,
    big_file_id: json['big_file_id'] as String,
    big_file_unique_id: json['big_file_unique_id'] as String,
  );
}

Map<String, dynamic> _$ChatPhotoToJson(ChatPhoto instance) => <String, dynamic>{
      'small_file_id': instance.small_file_id,
      'small_file_unique_id': instance.small_file_unique_id,
      'big_file_id': instance.big_file_id,
      'big_file_unique_id': instance.big_file_unique_id,
    };
