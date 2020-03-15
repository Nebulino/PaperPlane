/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of core;

/// Update telegram.types Class
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
