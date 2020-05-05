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
  /// An HTTP URL to be opened with user authorization
  /// data added to the query string when the button is pressed.
  /// If the user refuses to provide authorization data,
  /// the original URL without information about the
  /// user will be opened. The data added is the same as
  /// described in [Receiving authorization data].
  ///
  /// **NOTE:** You must always check the hash of the received data
  /// to verify the authentication and the integrity of the data as described
  /// in [Checking authorization].
  ///
  /// [Receiving authorization data]: https://core.telegram.org/widgets/login#receiving-authorization-data
  /// [Checking authorization]: https://core.telegram.org/widgets/login#checking-authorization
  @JsonKey(name: 'url', required: true)
  String url;

  /// *Optional.* New text of the button in forwarded messages.
  @JsonKey(name: 'forward_text')
  String forwardText;

  /// *Optional.* Username of a bot, which will be used for user authorization.
  /// See [Setting up a bot] for more details.
  /// If not specified, the current bot's username will be assumed.
  /// The *url*'s domain must be the same as the domain linked with the bot.
  /// See [Linking your domain to the bot] for more details.
  ///
  /// [Setting up a bot]: https://core.telegram.org/widgets/login#setting-up-a-bot
  /// [Linking your domain to the bot]: https://core.telegram.org/widgets/login#linking-your-domain-to-the-bot
  @JsonKey(name: 'bot_username')
  String botUsername;

  /// *Optional.* Pass True to request the permission
  /// for your bot to send messages to the user.
  @JsonKey(name: 'request_write_access')
  bool requestWriteAccess;

  LoginUrl({
    this.url,
    this.forwardText,
    this.botUsername,
    this.requestWriteAccess,
  });

  factory LoginUrl.fromJson(Map<String, dynamic> json) =>
      _$LoginUrlFromJson(json);

  Map<String, dynamic> toJson(Map<String, dynamic> json) =>
      _$LoginUrlToJson(this);
}
