/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of payment;

/// This object represents a shipping address.
///
/// https://core.telegram.org/bots/api#shippingaddress
@JsonSerializable(includeIfNull: false)
class ShippingAddress {
  /// ISO 3166-1 alpha-2 country code.
  @JsonKey(name: 'country_code', required: true)
  String countryCode;

  /// State, if applicable.
  @JsonKey(name: 'state', required: true)
  String state;

  /// City.
  @JsonKey(name: 'city', required: true)
  String city;

  /// First line for the address.
  @JsonKey(name: 'street_line1', required: true)
  String streetLine1;

  /// Second line for the address.
  @JsonKey(name: 'street_line2', required: true)
  String streetLine2;

  /// Address post code.
  @JsonKey(name: 'post_code', required: true)
  String postcode;

  ShippingAddress({
    this.countryCode,
    this.state,
    this.city,
    this.streetLine1,
    this.streetLine2,
    this.postcode,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressToJson(this);
}
