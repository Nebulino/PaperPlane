/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of payment;

/// SuccessfulPayment telegram.types Class
/// https://core.telegram.org/bots/api#successfullpayment
@JsonSerializable()
class SuccessfulPayment {
  String currency;
  int total_amount;
  String invoice_payload;
  String shipping_option_id;
  OrderInfo order_info;
  String telegram_payment_charge_id;
  String provider_payment_charge_id;

  SuccessfulPayment(
      {this.currency,
      this.total_amount,
      this.invoice_payload,
      this.shipping_option_id,
      this.order_info,
      this.telegram_payment_charge_id,
      this.provider_payment_charge_id});

  factory SuccessfulPayment.fromJson(Map<String, dynamic> json) =>
      _$SuccessfulPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$SuccessfulPaymentToJson(this);
}
