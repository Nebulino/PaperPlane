/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of payment;

/// ShippingAddress telegram.types Class
/// https://core.telegram.org/bots/api#shippingaddress
@JsonSerializable()
class ShippingAddress {
  String country_code;
  String state;
  String city;
  String street_line1;
  String street_line2;
  String post_code;

  ShippingAddress(
      {this.country_code,
      this.state,
      this.city,
      this.street_line1,
      this.street_line2,
      this.post_code});

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressToJson(this);
}
