// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telegram_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TelegramResponse _$TelegramResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['ok']);
  return TelegramResponse(
    valid: json['ok'] as bool?,
    result: json['result'],
    errorCode: (json['error_code'] as num?)?.toInt(),
    description: json['description'] as String?,
    responseParameters: json['response_parameters'] == null
        ? null
        : ResponseParameters.fromJson(
            json['response_parameters'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$TelegramResponseToJson(TelegramResponse instance) =>
    <String, dynamic>{
      'ok': ?instance.valid,
      'result': ?instance.result,
      'error_code': ?instance.errorCode,
      'description': ?instance.description,
      'response_parameters': ?instance.responseParameters,
    };
