//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

part of payment;

/// This object contains information about an incoming shipping query.
///
/// https://core.telegram.org/bots/api#shippingquery
@JsonSerializable(includeIfNull: false)
class ShippingQuery {
  /// Unique query identifier.
  @JsonKey(name: 'id', required: true)
  String id;

  /// User who sent the query.
  @JsonKey(name: 'from', required: true)
  User from;

  /// Bot specified invoice payload.
  @JsonKey(name: 'invoice_payload', required: true)
  String invoicePayload;

  /// User specified shipping address.
  @JsonKey(name: 'shipping_address', required: true)
  ShippingAddress shippingAddress;

  ShippingQuery({
    this.id,
    this.from,
    this.invoicePayload,
    this.shippingAddress,
  });

  factory ShippingQuery.fromJson(Map<String, dynamic> json) =>
      _$ShippingQueryFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingQueryToJson(this);
}
