// GENERATED CODE - DO NOT MODIFY BY HAND

part of core;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallbackQuery _$CallbackQueryFromJson(Map<String, dynamic> json) {
  return CallbackQuery(
    id: json['id'] as String,
    from: json['from'] == null
        ? null
        : User.fromJson(json['from'] as Map<String, dynamic>),
    message: json['message'] == null
        ? null
        : Message.fromJson(json['message'] as Map<String, dynamic>),
    inline_message_id: json['inline_message_id'] as String,
    chat_instance: json['chat_instance'] as String,
    data: json['data'] as String,
    game_short_name: json['game_short_name'] as String,
  );
}

Map<String, dynamic> _$CallbackQueryToJson(CallbackQuery instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from': instance.from,
      'message': instance.message,
      'inline_message_id': instance.inline_message_id,
      'chat_instance': instance.chat_instance,
      'data': instance.data,
      'game_short_name': instance.game_short_name,
    };

LoginUrl _$LoginUrlFromJson(Map<String, dynamic> json) {
  return LoginUrl(
    json['url'],
    forward_text: json['forward_text'] as String,
    bot_username: json['bot_username'] as String,
    request_write_access: json['request_write_access'] as bool,
  );
}

Map<String, dynamic> _$LoginUrlToJson(LoginUrl instance) => <String, dynamic>{
      'url': instance.url,
      'forward_text': instance.forward_text,
      'bot_username': instance.bot_username,
      'request_write_access': instance.request_write_access,
    };

ResponseParameters _$ResponseParametersFromJson(Map<String, dynamic> json) {
  return ResponseParameters(
    migrate_to_chat_id: json['migrate_to_chat_id'] as int,
    retry_after: json['retry_after'] as int,
  );
}

Map<String, dynamic> _$ResponseParametersToJson(ResponseParameters instance) =>
    <String, dynamic>{
      'migrate_to_chat_id': instance.migrate_to_chat_id,
      'retry_after': instance.retry_after,
    };

Update _$UpdateFromJson(Map<String, dynamic> json) {
  return Update(
    update_id: json['update_id'] as int,
    message: json['message'] == null
        ? null
        : Message.fromJson(json['message'] as Map<String, dynamic>),
    edited_message: json['edited_message'] == null
        ? null
        : Message.fromJson(json['edited_message'] as Map<String, dynamic>),
    channel_post: json['channel_post'] == null
        ? null
        : Message.fromJson(json['channel_post'] as Map<String, dynamic>),
    edited_channel_post: json['edited_channel_post'] == null
        ? null
        : Message.fromJson(json['edited_channel_post'] as Map<String, dynamic>),
    inline_query: json['inline_query'] == null
        ? null
        : InlineQuery.fromJson(json['inline_query'] as Map<String, dynamic>),
    chosen_inline_result: json['chosen_inline_result'] == null
        ? null
        : ChosenInlineResult.fromJson(
            json['chosen_inline_result'] as Map<String, dynamic>),
    callback_query: json['callback_query'] == null
        ? null
        : CallbackQuery.fromJson(
            json['callback_query'] as Map<String, dynamic>),
    shipping_query: json['shipping_query'] == null
        ? null
        : ShippingQuery.fromJson(
            json['shipping_query'] as Map<String, dynamic>),
    pre_checkout_query: json['pre_checkout_query'] == null
        ? null
        : PreCheckoutQuery.fromJson(
            json['pre_checkout_query'] as Map<String, dynamic>),
    poll: json['poll'] == null
        ? null
        : Poll.fromJson(json['poll'] as Map<String, dynamic>),
    poll_answer: json['poll_answer'] == null
        ? null
        : PollAnswer.fromJson(json['poll_answer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateToJson(Update instance) => <String, dynamic>{
      'update_id': instance.update_id,
      'message': instance.message,
      'edited_message': instance.edited_message,
      'channel_post': instance.channel_post,
      'edited_channel_post': instance.edited_channel_post,
      'inline_query': instance.inline_query,
      'chosen_inline_result': instance.chosen_inline_result,
      'callback_query': instance.callback_query,
      'shipping_query': instance.shipping_query,
      'pre_checkout_query': instance.pre_checkout_query,
      'poll': instance.poll,
      'poll_answer': instance.poll_answer,
    };

WebhookInfo _$WebhookInfoFromJson(Map<String, dynamic> json) {
  return WebhookInfo(
    url: json['url'] as String,
    has_custom_certificate: json['has_custom_certificate'] as bool,
    pending_update_count: json['pending_update_count'] as int,
    last_error_date: json['last_error_date'] as int,
    last_error_message: json['last_error_message'] as String,
    max_connections: json['max_connections'] as int,
    allowed_updates:
        (json['allowed_updates'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$WebhookInfoToJson(WebhookInfo instance) =>
    <String, dynamic>{
      'url': instance.url,
      'has_custom_certificate': instance.has_custom_certificate,
      'pending_update_count': instance.pending_update_count,
      'last_error_date': instance.last_error_date,
      'last_error_message': instance.last_error_message,
      'max_connections': instance.max_connections,
      'allowed_updates': instance.allowed_updates,
    };
