/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of payment;

/// ShippingOption telegram.types Class
/// https://core.telegram.org/bots/api#shippingoption
@JsonSerializable()
class ShippingOption {
  String id;
  String title;
  List<LabeledPrice> prices;

  ShippingOption({this.id, this.title, this.prices});

  factory ShippingOption.fromJson(Map<String, dynamic> json) =>
      _$ShippingOptionFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingOptionToJson(this);
}
