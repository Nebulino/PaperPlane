/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of payment;

/// LabeledPrice telegram.types Class
/// https://core.telegram.org/bots/api#labeled_price
@JsonSerializable()
class LabeledPrice {
  String label;
  int amount;

  LabeledPrice({this.label, this.amount});

  factory LabeledPrice.fromJson(Map<String, dynamic> json) =>
      _$LabeledPriceFromJson(json);

  Map<String, dynamic> toJson() => _$LabeledPriceToJson(this);
}
