//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

part of payment;

/// This object represents a portion of the price for goods or services.
///
/// https://core.telegram.org/bots/api#labeledprice
@JsonSerializable(includeIfNull: false)
class LabeledPrice {
  /// Portion label.
  @JsonKey(name: 'label', required: true)
  String label;

  /// Total price in the *smallest units* of the currency
  /// (integer, not float/double). For example, for a price of [US$ 1.45]
  /// [pass amount = 145]. See the *exp* parameter in [currencies.json],
  /// it shows the number of digits past the decimal point for each
  /// currency (2 for the majority of currencies).
  ///
  /// [currencies.json]: https://core.telegram.org/bots/payments/currencies.json
  @JsonKey(name: 'amount', required: true)
  int amount;

  LabeledPrice({
    this.label,
    this.amount,
  });

  factory LabeledPrice.fromJson(Map<String, dynamic> json) =>
      _$LabeledPriceFromJson(json);

  Map<String, dynamic> toJson() => _$LabeledPriceToJson(this);
}
