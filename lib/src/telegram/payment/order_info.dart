/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of payment;

/// This object represents information about an order.
///
/// https://core.telegram.org/bots/api#orderinfo
@JsonSerializable()
class OrderInfo {
  String name;
  String phone_number;
  String email;
  ShippingAddress shippingAddress;

  OrderInfo({this.name, this.phone_number, this.email, this.shippingAddress});

  factory OrderInfo.fromJson(Map<String, dynamic> json) =>
      _$OrderInfoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderInfoToJson(this);
}
