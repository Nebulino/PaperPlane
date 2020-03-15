/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of core;

/// CallbackUrl telegram.types Class
/// https://core.telegram.org/bots/api#callbackurl
@JsonSerializable()
class LoginUrl {
  String url;
  String forward_text;
  String bot_username;
  bool request_write_access;

  LoginUrl(url,
      {this.forward_text, this.bot_username, this.request_write_access});

  factory LoginUrl.fromJson(Map<String, dynamic> json) =>
      _$LoginUrlFromJson(json);

  Map<String, dynamic> toJson(Map<String, dynamic> json) =>
      _$LoginUrlToJson(this);
}
