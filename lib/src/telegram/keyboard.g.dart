// GENERATED CODE - DO NOT MODIFY BY HAND

part of keyboard;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForceReply _$ForceReplyFromJson(Map<String, dynamic> json) {
  return ForceReply(
    force_reply: json['force_reply'] as bool,
    selective: json['selective'] as bool,
  );
}

Map<String, dynamic> _$ForceReplyToJson(ForceReply instance) =>
    <String, dynamic>{
      'force_reply': instance.force_reply,
      'selective': instance.selective,
    };

InlineKeyboardButton _$InlineKeyboardButtonFromJson(Map<String, dynamic> json) {
  return InlineKeyboardButton(
    text: json['text'] as String,
    url: json['url'] as String,
    login_url: json['login_url'] == null
        ? null
        : LoginUrl.fromJson(json['login_url'] as Map<String, dynamic>),
    callback_data: json['callback_data'] as String,
    switch_inline_query: json['switch_inline_query'] as String,
    switch_inline_query_current_chat:
        json['switch_inline_query_current_chat'] as String,
    callback_game: json['callback_game'] == null
        ? null
        : CallbackGame.fromJson(json['callback_game'] as Map<String, dynamic>),
    pay: json['pay'] as bool,
  );
}

Map<String, dynamic> _$InlineKeyboardButtonToJson(
        InlineKeyboardButton instance) =>
    <String, dynamic>{
      'text': instance.text,
      'url': instance.url,
      'login_url': instance.login_url,
      'callback_data': instance.callback_data,
      'switch_inline_query': instance.switch_inline_query,
      'switch_inline_query_current_chat':
          instance.switch_inline_query_current_chat,
      'callback_game': instance.callback_game,
      'pay': instance.pay,
    };

InlineKeyboardMarkup _$InlineKeyboardMarkupFromJson(Map<String, dynamic> json) {
  return InlineKeyboardMarkup(
    inline_keyboard: (json['inline_keyboard'] as List)
        ?.map((e) => (e as List)
            ?.map((e) => e == null
                ? null
                : InlineKeyboardButton.fromJson(e as Map<String, dynamic>))
            ?.toList())
        ?.toList(),
  );
}

Map<String, dynamic> _$InlineKeyboardMarkupToJson(
        InlineKeyboardMarkup instance) =>
    <String, dynamic>{
      'inline_keyboard': instance.inline_keyboard,
    };

KeyboardButton _$KeyboardButtonFromJson(Map<String, dynamic> json) {
  return KeyboardButton(
    text: json['text'] as String,
    request_contact: json['request_contact'] as bool,
    request_location: json['request_location'] as bool,
    request_poll: json['request_poll'] == null
        ? null
        : KeyboardButtonPollType.fromJson(
            json['request_poll'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$KeyboardButtonToJson(KeyboardButton instance) =>
    <String, dynamic>{
      'text': instance.text,
      'request_contact': instance.request_contact,
      'request_location': instance.request_location,
      'request_poll': instance.request_poll,
    };

KeyboardButtonPollType _$KeyboardButtonPollTypeFromJson(
    Map<String, dynamic> json) {
  return KeyboardButtonPollType(
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$KeyboardButtonPollTypeToJson(
        KeyboardButtonPollType instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

ReplyKeyboardMarkup _$ReplyKeyboardMarkupFromJson(Map<String, dynamic> json) {
  return ReplyKeyboardMarkup(
    keyboard: (json['keyboard'] as List)
        ?.map((e) => (e as List)
            ?.map((e) => e == null
                ? null
                : KeyboardButton.fromJson(e as Map<String, dynamic>))
            ?.toList())
        ?.toList(),
    resize_keyboard: json['resize_keyboard'] as bool,
    one_time_keyboard: json['one_time_keyboard'] as bool,
    selective: json['selective'] as bool,
  );
}

Map<String, dynamic> _$ReplyKeyboardMarkupToJson(
        ReplyKeyboardMarkup instance) =>
    <String, dynamic>{
      'keyboard': instance.keyboard,
      'resize_keyboard': instance.resize_keyboard,
      'one_time_keyboard': instance.one_time_keyboard,
      'selective': instance.selective,
    };

ReplyKeyboardRemove _$ReplyKeyboardRemoveFromJson(Map<String, dynamic> json) {
  return ReplyKeyboardRemove(
    remove_keyboard: json['remove_keyboard'] as bool,
    selective: json['selective'] as bool,
  );
}

Map<String, dynamic> _$ReplyKeyboardRemoveToJson(
        ReplyKeyboardRemove instance) =>
    <String, dynamic>{
      'remove_keyboard': instance.remove_keyboard,
      'selective': instance.selective,
    };

ReplyMarkup _$ReplyMarkupFromJson(Map<String, dynamic> json) {
  return ReplyMarkup();
}

Map<String, dynamic> _$ReplyMarkupToJson(ReplyMarkup instance) =>
    <String, dynamic>{};
