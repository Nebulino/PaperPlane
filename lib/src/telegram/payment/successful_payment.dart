/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of payment;

/// This object contains basic information about a successful payment.
///
/// https://core.telegram.org/bots/api#successfulpayment
@JsonSerializable(includeIfNull: false)
class SuccessfulPayment {
  /// Three-letter ISO 4217 [currency] code.
  ///
  /// [currency]: https://core.telegram.org/bots/payments#supported-currencies
  @JsonKey(name: 'currency', required: true)
  String currency;

  /// Total price in the *smallest units* of the currency
  /// (integer, not float/double). For example, for a price of [US$ 1.45]
  /// [pass amount = 145]. See the *exp* parameter in [currencies.json],
  /// it shows the number of digits past the decimal point for each
  /// currency (2 for the majority of currencies).
  ///
  /// [currencies.json]: https://core.telegram.org/bots/payments/currencies.json
  @JsonKey(name: 'total_amount', required: true)
  int totalAmount;

  /// Bot specified invoice payload.
  @JsonKey(name: 'invoice_payload', required: true)
  String invoicePayload;

  /// *Optional.* Identifier of the shipping option chosen by the user.
  @JsonKey(name: 'shipping_option_id')
  String shippingOptionID;

  /// *Optional.* Order info provided by the user.
  @JsonKey(name: 'order_info')
  OrderInfo orderInfo;

  /// Telegram payment identifier.
  @JsonKey(name: 'telegram_payment_charge_id')
  String telegramPaymentChargeID;

  /// Provider payment identifier.
  @JsonKey(name: 'provider_payment_charge_id')
  String providerPaymentChargeID;

  SuccessfulPayment({
    this.currency,
    this.totalAmount,
    this.invoicePayload,
    this.shippingOptionID,
    this.orderInfo,
    this.telegramPaymentChargeID,
    this.providerPaymentChargeID,
  });

  factory SuccessfulPayment.fromJson(Map<String, dynamic> json) =>
      _$SuccessfulPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$SuccessfulPaymentToJson(this);
}
