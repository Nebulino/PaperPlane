//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

part of user;

/// This object represents a Telegram user or bot.
///
/// https://core.telegram.org/bots/api#user
@JsonSerializable(includeIfNull: false)
class User {
  /// Unique identifier for this user or bot.
  @JsonKey(name: 'id', required: true)
  int id;

  /// True, if this user is a bot.
  @JsonKey(name: 'is_bot', required: true)
  bool isBot;

  /// User‘s or bot’s first name.
  @JsonKey(name: 'first_name', required: true)
  String firstName;

  /// *Optional.* User‘s or bot’s last name.
  @JsonKey(name: 'last_name')
  String lastName;

  /// *Optional.* User‘s or bot’s username.
  @JsonKey(name: 'username')
  String username;

  /// *Optional.* [IETF language tag] of the user's language.
  ///
  /// [IETF language tag]: https://en.wikipedia.org/wiki/IETF_language_tag
  @JsonKey(name: 'language_code')
  String languageCode;

  User({
    this.id,
    this.isBot,
    this.firstName,
    this.lastName,
    this.username,
    this.languageCode,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
