/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of payment;

/// This object represents one shipping option.
///
/// https://core.telegram.org/bots/api#shippingoption
@JsonSerializable(includeIfNull: false)
class ShippingOption {
  /// Shipping option identifier.
  @JsonKey(name: 'id', required: true)
  String id;

  /// Option title.
  @JsonKey(name: 'title', required: true)
  String title;

  /// List of price portions.
  @JsonKey(name: 'prices', required: true)
  List<LabeledPrice> prices;

  ShippingOption({
    this.id,
    this.title,
    this.prices,
  });

  factory ShippingOption.fromJson(Map<String, dynamic> json) =>
      _$ShippingOptionFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingOptionToJson(this);
}
