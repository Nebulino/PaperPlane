/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of payment;

/// This object contains basic information about an invoice.
///
/// https://core.telegram.org/bots/api#invoice
@JsonSerializable(includeIfNull: false)
class Invoice {
  /// Product name.
  @JsonKey(name: 'title', required: true)
  String title;

  /// Product description.
  @JsonKey(name: 'description', required: true)
  String description;

  /// Unique bot deep-linking parameter that can be used
  /// to generate this invoice.
  @JsonKey(name: 'start_parameter', required: true)
  String start_parameter;

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
  int total_amount;

  Invoice(
      {this.title,
      this.description,
      this.start_parameter,
      this.currency,
      this.total_amount});

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
}
