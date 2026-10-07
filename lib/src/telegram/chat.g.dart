// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id', 'type']);
  return Chat(
    id: (json['id'] as num?)?.toInt(),
    type: json['type'] as String?,
    title: json['title'] as String?,
    username: json['username'] as String?,
    firstName: json['first_name'] as String?,
    lastName: json['last_name'] as String?,
    photo: json['photo'] == null
        ? null
        : ChatPhoto.fromJson(json['photo'] as Map<String, dynamic>),
    description: json['description'] as String?,
    inviteLink: json['invite_link'] as String?,
    pinnedMessage: json['pinned_message'] == null
        ? null
        : Message.fromJson(json['pinned_message'] as Map<String, dynamic>),
    permissions: json['permissions'] == null
        ? null
        : ChatPermissions.fromJson(json['permissions'] as Map<String, dynamic>),
    slowModeDelay: (json['slow_mode_delay'] as num?)?.toInt(),
    stickerSetName: json['sticker_set_name'] as String?,
    canSetStickerSet: json['can_set_sticker_set'] as bool?,
  );
}

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
  'id': ?instance.id,
  'type': ?instance.type,
  'title': ?instance.title,
  'username': ?instance.username,
  'first_name': ?instance.firstName,
  'last_name': ?instance.lastName,
  'photo': ?instance.photo,
  'description': ?instance.description,
  'invite_link': ?instance.inviteLink,
  'pinned_message': ?instance.pinnedMessage,
  'permissions': ?instance.permissions,
  'slow_mode_delay': ?instance.slowModeDelay,
  'sticker_set_name': ?instance.stickerSetName,
  'can_set_sticker_set': ?instance.canSetStickerSet,
};

ChatMember _$ChatMemberFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['user', 'status']);
  return ChatMember(
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    status: json['status'] as String?,
    customTitle: json['custom_title'] as String?,
    untilDate: ChatMember._dateTimeFromTelegramInt(
      (json['until_date'] as num?)?.toInt(),
    ),
    canBeEdited: json['can_be_edited'] as bool?,
    canPostMessages: json['can_post_messages'] as bool?,
    canEditMessages: json['can_edit_messages'] as bool?,
    canDeleteMessages: json['can_delete_messages'] as bool?,
    canRestrictMembers: json['can_restrict_members'] as bool?,
    canPromoteMembers: json['can_promote_members'] as bool?,
    canChangeInfo: json['can_change_info'] as bool?,
    canInviteUsers: json['can_invite_users'] as bool?,
    canPinMessages: json['can_pin_messages'] as bool?,
    isMember: json['is_member'] as bool?,
    canSendMessages: json['can_send_messages'] as bool?,
    canSendMediaMessages: json['can_send_media_messages'] as bool?,
    canSendPolls: json['can_send_polls'] as bool?,
    canSendOtherMessages: json['can_send_other_messages'] as bool?,
    canAddWebPagePreviews: json['can_add_web_page_previews'] as bool?,
  );
}

Map<String, dynamic> _$ChatMemberToJson(ChatMember instance) =>
    <String, dynamic>{
      'user': ?instance.user,
      'status': ?instance.status,
      'custom_title': ?instance.customTitle,
      'until_date': ?ChatMember._dateTimeToTelegramInt(instance.untilDate),
      'can_be_edited': ?instance.canBeEdited,
      'can_post_messages': ?instance.canPostMessages,
      'can_edit_messages': ?instance.canEditMessages,
      'can_delete_messages': ?instance.canDeleteMessages,
      'can_restrict_members': ?instance.canRestrictMembers,
      'can_promote_members': ?instance.canPromoteMembers,
      'can_change_info': ?instance.canChangeInfo,
      'can_invite_users': ?instance.canInviteUsers,
      'can_pin_messages': ?instance.canPinMessages,
      'is_member': ?instance.isMember,
      'can_send_messages': ?instance.canSendMessages,
      'can_send_media_messages': ?instance.canSendMediaMessages,
      'can_send_polls': ?instance.canSendPolls,
      'can_send_other_messages': ?instance.canSendOtherMessages,
      'can_add_web_page_previews': ?instance.canAddWebPagePreviews,
    };

ChatPermissions _$ChatPermissionsFromJson(Map<String, dynamic> json) =>
    ChatPermissions(
      canSendMessages: json['can_send_messages'] as bool?,
      canSendMediaMessages: json['can_send_media_messages'] as bool?,
      canSendPolls: json['can_send_polls'] as bool?,
      canSendOtherMessages: json['can_send_other_messages'] as bool?,
      canAddWebPagePreviews: json['can_add_web_page_previews'] as bool?,
      canChangeInfo: json['can_change_info'] as bool?,
      canInviteUsers: json['can_invite_users'] as bool?,
      canPinMessages: json['can_pin_messages'] as bool?,
    );

Map<String, dynamic> _$ChatPermissionsToJson(ChatPermissions instance) =>
    <String, dynamic>{
      'can_send_messages': ?instance.canSendMessages,
      'can_send_media_messages': ?instance.canSendMediaMessages,
      'can_send_polls': ?instance.canSendPolls,
      'can_send_other_messages': ?instance.canSendOtherMessages,
      'can_add_web_page_previews': ?instance.canAddWebPagePreviews,
      'can_change_info': ?instance.canChangeInfo,
      'can_invite_users': ?instance.canInviteUsers,
      'can_pin_messages': ?instance.canPinMessages,
    };

ChatPhoto _$ChatPhotoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'small_file_id',
      'small_file_unique_id',
      'big_file_id',
      'big_file_unique_id',
    ],
  );
  return ChatPhoto(
    smallFileID: json['small_file_id'] as String?,
    smallFileUniqueID: json['small_file_unique_id'] as String?,
    bigFileID: json['big_file_id'] as String?,
    bigFileUniqueID: json['big_file_unique_id'] as String?,
  );
}

Map<String, dynamic> _$ChatPhotoToJson(ChatPhoto instance) => <String, dynamic>{
  'small_file_id': ?instance.smallFileID,
  'small_file_unique_id': ?instance.smallFileUniqueID,
  'big_file_id': ?instance.bigFileID,
  'big_file_unique_id': ?instance.bigFileUniqueID,
};
