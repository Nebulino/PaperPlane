/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of payment;

/// This object contains information about an incoming pre-checkout query.
///
/// https://core.telegram.org/bots/api#precheckoutquery
@JsonSerializable(includeIfNull: false)
class PreCheckoutQuery {
  String id;
  User from;
  String currency;
  int total_amount;
  String invoice_payload;
  String shipping_option_id;
  OrderInfo order_info;

  PreCheckoutQuery(
      {this.id,
      this.from,
      this.currency,
      this.total_amount,
      this.invoice_payload,
      this.shipping_option_id,
      this.order_info});

  factory PreCheckoutQuery.fromJson(Map<String, dynamic> json) =>
      _$PreCheckoutQueryFromJson(json);

  Map<String, dynamic> toJson() => _$PreCheckoutQueryToJson(this);
}
