/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of payment;

/// This object represents a portion of the price for goods or services.
///
/// https://core.telegram.org/bots/api#labeledprice
@JsonSerializable(includeIfNull: false)
class LabeledPrice {
  String label;
  int amount;

  LabeledPrice({this.label, this.amount});

  factory LabeledPrice.fromJson(Map<String, dynamic> json) =>
      _$LabeledPriceFromJson(json);

  Map<String, dynamic> toJson() => _$LabeledPriceToJson(this);
}
