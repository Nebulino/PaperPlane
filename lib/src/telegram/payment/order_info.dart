//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

part of payment;

/// This object represents information about an order.
///
/// https://core.telegram.org/bots/api#orderinfo
@JsonSerializable(includeIfNull: false)
class OrderInfo {
  /// *Optional.* User name.
  @JsonKey(name: 'name')
  String name;

  /// *Optional.* User's phone number.
  @JsonKey(name: 'phone_number')
  String phoneNumber;

  /// *Optional.* User email.
  @JsonKey(name: 'email')
  String email;

  /// *Optional.* User shipping address.
  @JsonKey(name: 'shipping_address')
  ShippingAddress shippingAddress;

  OrderInfo({
    this.name,
    this.phoneNumber,
    this.email,
    this.shippingAddress,
  });

  factory OrderInfo.fromJson(Map<String, dynamic> json) =>
      _$OrderInfoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderInfoToJson(this);
}
