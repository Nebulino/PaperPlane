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
  /// Unique query identifier.
  @JsonKey(name: 'id', required: true)
  String id;

  /// User who sent the query.
  @JsonKey(name: 'from', required: true)
  User from;

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

  PreCheckoutQuery(
      {this.id,
      this.from,
      this.currency,
      this.totalAmount,
      this.invoicePayload,
      this.shippingOptionID,
      this.orderInfo});

  factory PreCheckoutQuery.fromJson(Map<String, dynamic> json) =>
      _$PreCheckoutQueryFromJson(json);

  Map<String, dynamic> toJson() => _$PreCheckoutQueryToJson(this);
}
