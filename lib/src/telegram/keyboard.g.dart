// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForceReply _$ForceReplyFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['force_reply']);
  return ForceReply(
    forceReply: json['force_reply'] as bool?,
    selective: json['selective'] as bool?,
  );
}

Map<String, dynamic> _$ForceReplyToJson(ForceReply instance) =>
    <String, dynamic>{
      'force_reply': ?instance.forceReply,
      'selective': ?instance.selective,
    };

InlineKeyboardButton _$InlineKeyboardButtonFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['text']);
  return InlineKeyboardButton(
    text: json['text'] as String?,
    url: json['url'] as String?,
    loginUrl: json['login_url'] == null
        ? null
        : LoginUrl.fromJson(json['login_url'] as Map<String, dynamic>),
    callbackData: json['callback_data'] as String?,
    switchInlineQuery: json['switch_inline_query'] as String?,
    switchInlineQueryCurrentChat:
        json['switch_inline_query_current_chat'] as String?,
    callbackGame: json['callback_game'] == null
        ? null
        : CallbackGame.fromJson(json['callback_game'] as Map<String, dynamic>),
    pay: json['pay'] as bool?,
  );
}

Map<String, dynamic> _$InlineKeyboardButtonToJson(
  InlineKeyboardButton instance,
) => <String, dynamic>{
  'text': ?instance.text,
  'url': ?instance.url,
  'login_url': ?instance.loginUrl,
  'callback_data': ?instance.callbackData,
  'switch_inline_query': ?instance.switchInlineQuery,
  'switch_inline_query_current_chat': ?instance.switchInlineQueryCurrentChat,
  'callback_game': ?instance.callbackGame,
  'pay': ?instance.pay,
};

InlineKeyboardMarkup _$InlineKeyboardMarkupFromJson(
  Map<String, dynamic> json,
) => InlineKeyboardMarkup(
  inline_keyboard: (json['inline_keyboard'] as List<dynamic>?)
      ?.map(
        (e) => (e as List<dynamic>)
            .map(
              (e) => InlineKeyboardButton.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      )
      .toList(),
);

Map<String, dynamic> _$InlineKeyboardMarkupToJson(
  InlineKeyboardMarkup instance,
) => <String, dynamic>{'inline_keyboard': ?instance.inline_keyboard};

KeyboardButton _$KeyboardButtonFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['text']);
  return KeyboardButton(
    text: json['text'] as String?,
    requestContact: json['request_contact'] as bool?,
    requestLocation: json['request_location'] as bool?,
    requestPoll: json['request_poll'] == null
        ? null
        : KeyboardButtonPollType.fromJson(
            json['request_poll'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$KeyboardButtonToJson(KeyboardButton instance) =>
    <String, dynamic>{
      'text': ?instance.text,
      'request_contact': ?instance.requestContact,
      'request_location': ?instance.requestLocation,
      'request_poll': ?instance.requestPoll,
    };

KeyboardButtonPollType _$KeyboardButtonPollTypeFromJson(
  Map<String, dynamic> json,
) => KeyboardButtonPollType(type: json['type'] as String?);

Map<String, dynamic> _$KeyboardButtonPollTypeToJson(
  KeyboardButtonPollType instance,
) => <String, dynamic>{'type': ?instance.type};

ReplyKeyboardMarkup _$ReplyKeyboardMarkupFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['keyboard']);
  return ReplyKeyboardMarkup(
    keyboard: (json['keyboard'] as List<dynamic>?)
        ?.map(
          (e) => (e as List<dynamic>)
              .map((e) => KeyboardButton.fromJson(e as Map<String, dynamic>))
              .toList(),
        )
        .toList(),
    resizeKeyboard: json['resize_keyboard'] as bool?,
    oneTimeKeyboard: json['one_time_keyboard'] as bool?,
    selective: json['selective'] as bool?,
  );
}

Map<String, dynamic> _$ReplyKeyboardMarkupToJson(
  ReplyKeyboardMarkup instance,
) => <String, dynamic>{
  'keyboard': ?instance.keyboard,
  'resize_keyboard': ?instance.resizeKeyboard,
  'one_time_keyboard': ?instance.oneTimeKeyboard,
  'selective': ?instance.selective,
};

ReplyKeyboardRemove _$ReplyKeyboardRemoveFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['remove_keyboard']);
  return ReplyKeyboardRemove(
    remove_keyboard: json['remove_keyboard'] as bool?,
    selective: json['selective'] as bool?,
  );
}

Map<String, dynamic> _$ReplyKeyboardRemoveToJson(
  ReplyKeyboardRemove instance,
) => <String, dynamic>{
  'remove_keyboard': ?instance.remove_keyboard,
  'selective': ?instance.selective,
};

ReplyMarkup _$ReplyMarkupFromJson(Map<String, dynamic> json) => ReplyMarkup();

Map<String, dynamic> _$ReplyMarkupToJson(ReplyMarkup instance) =>
    <String, dynamic>{};
