//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

part of keyboard;

/// Abstract object that represents a ReplyMarkup.
/// * [ReplyKeyboardMarkup](https://core.telegram.org/bots/api#replykeyboardmarkup)
/// * [ReplyKeyboardRemove](https://core.telegram.org/bots/api#replykeyboardremove)
/// * [InlineKeyboardMarkup](https://core.telegram.org/bots/api#inlinekeyboardmarkup)
/// * [ForceReply](https://core.telegram.org/bots/api#forcereply)
///
/// [inline keyboard]: https://core.telegram.org/bots#inline-keyboards-and-on-the-fly-updating
/// [custom reply keyboard]: https://core.telegram.org/bots#keyboards
@JsonSerializable(includeIfNull: false)
class ReplyMarkup {
  ReplyMarkup();

  factory ReplyMarkup.fromJson(Map<String, dynamic> json) =>
      _$ReplyMarkupFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyMarkupToJson(this);
}
