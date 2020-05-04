/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:json_annotation/json_annotation.dart';
import 'package:paperplane/telegram.dart';

part 'telegram_response.g.dart';

/// It helps formatting the received answer.
/// The response in input is managed and returned as it should be.
@JsonSerializable(includeIfNull: false)
class TelegramResponse {
  /// It says if the response is valid.
  @JsonKey(name: 'ok', required: true)
  bool valid;

  /// If the response is valid. It contains the result.
  @JsonKey(name: 'result')
  dynamic result;

  /// If the response is not valid, It contains the error code.
  @JsonKey(name: 'error_code')
  int errorCode;

  /// If the response is not valid, It contains the error description.
  @JsonKey(name: 'description')
  String description;

  /// If the response is valid, It can contains some important information.
  @JsonKey(name: 'response_parameters')
  ResponseParameters responseParameters;

  TelegramResponse({
    this.valid,
    this.result,
    this.errorCode,
    this.description,
    this.responseParameters,
  });

  factory TelegramResponse.fromJson(Map<String, dynamic> response) =>
      _$TelegramResponseFromJson(response);

  Map<String, dynamic> toJson() => _$TelegramResponseToJson(this);
}
