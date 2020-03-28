/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of core;

/// This object represents a parameter of the inline keyboard button used to
/// automatically authorize a user.
/// Serves as a great replacement for the [Telegram Login Widget] when the user
/// is coming from Telegram.
/// All the user needs to do is tap/click a button and confirm that they
/// want to log in.
///
/// Telegram apps support these buttons as of [version 5.7].
///
/// [Telegram Login Widget]: https://core.telegram.org/widgets/login
/// [version 5.7]: https://telegram.org/blog/privacy-discussions-web-bots#meet-seamless-web-bots
///
/// https://core.telegram.org/bots/api#loginurl
@JsonSerializable(includeIfNull: false)
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
