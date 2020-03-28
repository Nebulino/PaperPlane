/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:json_annotation/json_annotation.dart';
import 'package:paperplane/telegram.dart';

part 'package:paperplane/src/tools/client/telegram_response.g.dart';

/// It helps formatting the received answer.
/// The response in input is managed and returned as it should be.
@JsonSerializable(includeIfNull: false)
class TelegramResponse {
  bool valid;
  dynamic result;
  int error_code;
  String description;
  ResponseParameters responseParameters;

  TelegramResponse(
      {this.valid,
      this.result,
      this.error_code,
      this.description,
      this.responseParameters});

  factory TelegramResponse.fromJson(Map<String, dynamic> response) =>
      _$TelegramResponseFromJson(response);
}
