/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of payment;

/// This object contains information about an incoming shipping query.
///
/// https://core.telegram.org/bots/api#shippingquery
@JsonSerializable()
class ShippingQuery {
  String id;
  User from;
  String invoice_payload;
  ShippingAddress shipping_address;

  ShippingQuery(
      {this.id, this.from, this.invoice_payload, this.shipping_address});

  factory ShippingQuery.fromJson(Map<String, dynamic> json) =>
      _$ShippingQueryFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingQueryToJson(this);
}
