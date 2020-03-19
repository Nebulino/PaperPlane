/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of core;

/// This [object] represents an incoming update.
/// At most **one** of the optional parameters can be present
/// in any given update.
///
/// **Optional** fields may be not returned when irrelevant.
///
/// [object]: https://core.telegram.org/bots/api#available-types
///
/// https://core.telegram.org/bots/api#update
@JsonSerializable()
class Update {
  int update_id;
  Message message;
  Message edited_message;
  Message channel_post;
  Message edited_channel_post;
  InlineQuery inline_query;
  ChosenInlineResult chosen_inline_result;
  CallbackQuery callback_query;
  ShippingQuery shipping_query;
  PreCheckoutQuery pre_checkout_query;
  Poll poll;

  Update(
      {this.update_id,
      this.message,
      this.edited_message,
      this.channel_post,
      this.edited_channel_post,
      this.inline_query,
      this.chosen_inline_result,
      this.callback_query,
      this.shipping_query,
      this.pre_checkout_query,
      this.poll});

  factory Update.fromJson(Map<String, dynamic> json) => _$UpdateFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateToJson(this);
}
