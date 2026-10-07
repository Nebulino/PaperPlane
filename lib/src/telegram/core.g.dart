// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotCommand _$BotCommandFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['command', 'description']);
  return BotCommand(
    command: json['command'] as String?,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$BotCommandToJson(BotCommand instance) =>
    <String, dynamic>{
      'command': ?instance.command,
      'description': ?instance.description,
    };

CallbackQuery _$CallbackQueryFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id', 'from', 'chat_instance']);
  return CallbackQuery(
    id: json['id'] as String?,
    from: json['from'] == null
        ? null
        : User.fromJson(json['from'] as Map<String, dynamic>),
    message: json['message'] == null
        ? null
        : Message.fromJson(json['message'] as Map<String, dynamic>),
    inlineMessageID: json['inline_message_id'] as String?,
    chatInstance: json['chat_instance'] as String?,
    data: json['data'] as String?,
    gameShortName: json['game_short_name'] as String?,
  );
}

Map<String, dynamic> _$CallbackQueryToJson(CallbackQuery instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'from': ?instance.from,
      'message': ?instance.message,
      'inline_message_id': ?instance.inlineMessageID,
      'chat_instance': ?instance.chatInstance,
      'data': ?instance.data,
      'game_short_name': ?instance.gameShortName,
    };

Dice _$DiceFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['value']);
  return Dice(
    emoji: json['emoji'] as String?,
    value: (json['value'] as num?)?.toInt(),
  );
}

Map<String, dynamic> _$DiceToJson(Dice instance) => <String, dynamic>{
  'emoji': ?instance.emoji,
  'value': ?instance.value,
};

LoginUrl _$LoginUrlFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['url']);
  return LoginUrl(
    url: json['url'] as String?,
    forwardText: json['forward_text'] as String?,
    botUsername: json['bot_username'] as String?,
    requestWriteAccess: json['request_write_access'] as bool?,
  );
}

Map<String, dynamic> _$LoginUrlToJson(LoginUrl instance) => <String, dynamic>{
  'url': ?instance.url,
  'forward_text': ?instance.forwardText,
  'bot_username': ?instance.botUsername,
  'request_write_access': ?instance.requestWriteAccess,
};

ResponseParameters _$ResponseParametersFromJson(Map<String, dynamic> json) =>
    ResponseParameters(
      migrateToChatID: (json['migrate_to_chat_id'] as num?)?.toInt(),
      retryAfter: (json['retry_after'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ResponseParametersToJson(ResponseParameters instance) =>
    <String, dynamic>{
      'migrate_to_chat_id': ?instance.migrateToChatID,
      'retry_after': ?instance.retryAfter,
    };

Update _$UpdateFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['update_id']);
  return Update(
    updateID: (json['update_id'] as num?)?.toInt(),
    message: json['message'] == null
        ? null
        : Message.fromJson(json['message'] as Map<String, dynamic>),
    editedMessage: json['edited_message'] == null
        ? null
        : Message.fromJson(json['edited_message'] as Map<String, dynamic>),
    channelPost: json['channel_post'] == null
        ? null
        : Message.fromJson(json['channel_post'] as Map<String, dynamic>),
    editedChannelPost: json['edited_channel_post'] == null
        ? null
        : Message.fromJson(json['edited_channel_post'] as Map<String, dynamic>),
    inlineQuery: json['inline_query'] == null
        ? null
        : InlineQuery.fromJson(json['inline_query'] as Map<String, dynamic>),
    chosenInlineResult: json['chosen_inline_result'] == null
        ? null
        : ChosenInlineResult.fromJson(
            json['chosen_inline_result'] as Map<String, dynamic>,
          ),
    callbackQuery: json['callback_query'] == null
        ? null
        : CallbackQuery.fromJson(
            json['callback_query'] as Map<String, dynamic>,
          ),
    shippingQuery: json['shipping_query'] == null
        ? null
        : ShippingQuery.fromJson(
            json['shipping_query'] as Map<String, dynamic>,
          ),
    preCheckoutQuery: json['pre_checkout_query'] == null
        ? null
        : PreCheckoutQuery.fromJson(
            json['pre_checkout_query'] as Map<String, dynamic>,
          ),
    poll: json['poll'] == null
        ? null
        : Poll.fromJson(json['poll'] as Map<String, dynamic>),
    pollAnswer: json['poll_answer'] == null
        ? null
        : PollAnswer.fromJson(json['poll_answer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateToJson(Update instance) => <String, dynamic>{
  'update_id': ?instance.updateID,
  'message': ?instance.message,
  'edited_message': ?instance.editedMessage,
  'channel_post': ?instance.channelPost,
  'edited_channel_post': ?instance.editedChannelPost,
  'inline_query': ?instance.inlineQuery,
  'chosen_inline_result': ?instance.chosenInlineResult,
  'callback_query': ?instance.callbackQuery,
  'shipping_query': ?instance.shippingQuery,
  'pre_checkout_query': ?instance.preCheckoutQuery,
  'poll': ?instance.poll,
  'poll_answer': ?instance.pollAnswer,
};

WebhookInfo _$WebhookInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'url',
      'has_custom_certificate',
      'pending_update_count',
    ],
  );
  return WebhookInfo(
    url: json['url'] as String?,
    hasCustomCertificate: json['has_custom_certificate'] as bool?,
    pendingUpdateCount: (json['pending_update_count'] as num?)?.toInt(),
    lastErrorDate: WebhookInfo._dateTimeFromTelegramInt(
      (json['last_error_date'] as num?)?.toInt(),
    ),
    lastErrorMessage: json['last_error_message'] as String?,
    maxConnections: (json['max_connections'] as num?)?.toInt(),
    allowedUpdates: (json['allowed_updates'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$WebhookInfoToJson(WebhookInfo instance) =>
    <String, dynamic>{
      'url': ?instance.url,
      'has_custom_certificate': ?instance.hasCustomCertificate,
      'pending_update_count': ?instance.pendingUpdateCount,
      'last_error_date': ?WebhookInfo._dateTimeToTelegramInt(
        instance.lastErrorDate,
      ),
      'last_error_message': ?instance.lastErrorMessage,
      'max_connections': ?instance.maxConnections,
      'allowed_updates': ?instance.allowedUpdates,
    };
