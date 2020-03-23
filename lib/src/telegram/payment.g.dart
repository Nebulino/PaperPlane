// GENERATED CODE - DO NOT MODIFY BY HAND

part of payment;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invoice _$InvoiceFromJson(Map<String, dynamic> json) {
  return Invoice(
    title: json['title'] as String,
    description: json['description'] as String,
    start_parameter: json['start_parameter'] as String,
    currency: json['currency'] as String,
    total_amount: json['total_amount'] as int,
  );
}

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'start_parameter': instance.start_parameter,
      'currency': instance.currency,
      'total_amount': instance.total_amount,
    };

LabeledPrice _$LabeledPriceFromJson(Map<String, dynamic> json) {
  return LabeledPrice(
    label: json['label'] as String,
    amount: json['amount'] as int,
  );
}

Map<String, dynamic> _$LabeledPriceToJson(LabeledPrice instance) =>
    <String, dynamic>{
      'label': instance.label,
      'amount': instance.amount,
    };

OrderInfo _$OrderInfoFromJson(Map<String, dynamic> json) {
  return OrderInfo(
    name: json['name'] as String,
    phone_number: json['phone_number'] as String,
    email: json['email'] as String,
    shippingAddress: json['shippingAddress'] == null
        ? null
        : ShippingAddress.fromJson(
            json['shippingAddress'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OrderInfoToJson(OrderInfo instance) => <String, dynamic>{
      'name': instance.name,
      'phone_number': instance.phone_number,
      'email': instance.email,
      'shippingAddress': instance.shippingAddress,
    };

PreCheckoutQuery _$PreCheckoutQueryFromJson(Map<String, dynamic> json) {
  return PreCheckoutQuery(
    id: json['id'] as String,
    from: json['from'] == null
        ? null
        : User.fromJson(json['from'] as Map<String, dynamic>),
    currency: json['currency'] as String,
    total_amount: json['total_amount'] as int,
    invoice_payload: json['invoice_payload'] as String,
    shipping_option_id: json['shipping_option_id'] as String,
    order_info: json['order_info'] == null
        ? null
        : OrderInfo.fromJson(json['order_info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PreCheckoutQueryToJson(PreCheckoutQuery instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from': instance.from,
      'currency': instance.currency,
      'total_amount': instance.total_amount,
      'invoice_payload': instance.invoice_payload,
      'shipping_option_id': instance.shipping_option_id,
      'order_info': instance.order_info,
    };

ShippingAddress _$ShippingAddressFromJson(Map<String, dynamic> json) {
  return ShippingAddress(
    country_code: json['country_code'] as String,
    state: json['state'] as String,
    city: json['city'] as String,
    street_line1: json['street_line1'] as String,
    street_line2: json['street_line2'] as String,
    post_code: json['post_code'] as String,
  );
}

Map<String, dynamic> _$ShippingAddressToJson(ShippingAddress instance) =>
    <String, dynamic>{
      'country_code': instance.country_code,
      'state': instance.state,
      'city': instance.city,
      'street_line1': instance.street_line1,
      'street_line2': instance.street_line2,
      'post_code': instance.post_code,
    };

ShippingOption _$ShippingOptionFromJson(Map<String, dynamic> json) {
  return ShippingOption(
    id: json['id'] as String,
    title: json['title'] as String,
    prices: (json['prices'] as List)
        ?.map((e) =>
            e == null ? null : LabeledPrice.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ShippingOptionToJson(ShippingOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'prices': instance.prices,
    };

ShippingQuery _$ShippingQueryFromJson(Map<String, dynamic> json) {
  return ShippingQuery(
    id: json['id'] as String,
    from: json['from'] == null
        ? null
        : User.fromJson(json['from'] as Map<String, dynamic>),
    invoice_payload: json['invoice_payload'] as String,
    shipping_address: json['shipping_address'] == null
        ? null
        : ShippingAddress.fromJson(
            json['shipping_address'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ShippingQueryToJson(ShippingQuery instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from': instance.from,
      'invoice_payload': instance.invoice_payload,
      'shipping_address': instance.shipping_address,
    };

SuccessfulPayment _$SuccessfulPaymentFromJson(Map<String, dynamic> json) {
  return SuccessfulPayment(
    currency: json['currency'] as String,
    total_amount: json['total_amount'] as int,
    invoice_payload: json['invoice_payload'] as String,
    shipping_option_id: json['shipping_option_id'] as String,
    order_info: json['order_info'] == null
        ? null
        : OrderInfo.fromJson(json['order_info'] as Map<String, dynamic>),
    telegram_payment_charge_id: json['telegram_payment_charge_id'] as String,
    provider_payment_charge_id: json['provider_payment_charge_id'] as String,
  );
}

Map<String, dynamic> _$SuccessfulPaymentToJson(SuccessfulPayment instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'total_amount': instance.total_amount,
      'invoice_payload': instance.invoice_payload,
      'shipping_option_id': instance.shipping_option_id,
      'order_info': instance.order_info,
      'telegram_payment_charge_id': instance.telegram_payment_charge_id,
      'provider_payment_charge_id': instance.provider_payment_charge_id,
    };
