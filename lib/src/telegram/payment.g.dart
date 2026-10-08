// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invoice _$InvoiceFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'title',
      'description',
      'start_parameter',
      'currency',
      'total_amount',
    ],
  );
  return Invoice(
    title: json['title'] as String?,
    description: json['description'] as String?,
    start_parameter: json['start_parameter'] as String?,
    currency: json['currency'] as String?,
    total_amount: (json['total_amount'] as num?)?.toInt(),
  );
}

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
  'title': ?instance.title,
  'description': ?instance.description,
  'start_parameter': ?instance.start_parameter,
  'currency': ?instance.currency,
  'total_amount': ?instance.total_amount,
};

LabeledPrice _$LabeledPriceFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['label', 'amount']);
  return LabeledPrice(
    label: json['label'] as String?,
    amount: (json['amount'] as num?)?.toInt(),
  );
}

Map<String, dynamic> _$LabeledPriceToJson(LabeledPrice instance) =>
    <String, dynamic>{'label': ?instance.label, 'amount': ?instance.amount};

OrderInfo _$OrderInfoFromJson(Map<String, dynamic> json) => OrderInfo(
  name: json['name'] as String?,
  phoneNumber: json['phone_number'] as String?,
  email: json['email'] as String?,
  shippingAddress: json['shipping_address'] == null
      ? null
      : ShippingAddress.fromJson(
          json['shipping_address'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$OrderInfoToJson(OrderInfo instance) => <String, dynamic>{
  'name': ?instance.name,
  'phone_number': ?instance.phoneNumber,
  'email': ?instance.email,
  'shipping_address': ?instance.shippingAddress,
};

PreCheckoutQuery _$PreCheckoutQueryFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'id',
      'from',
      'currency',
      'total_amount',
      'invoice_payload',
    ],
  );
  return PreCheckoutQuery(
    id: json['id'] as String?,
    from: json['from'] == null
        ? null
        : User.fromJson(json['from'] as Map<String, dynamic>),
    currency: json['currency'] as String?,
    totalAmount: (json['total_amount'] as num?)?.toInt(),
    invoicePayload: json['invoice_payload'] as String?,
    shippingOptionID: json['shipping_option_id'] as String?,
    orderInfo: json['order_info'] == null
        ? null
        : OrderInfo.fromJson(json['order_info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PreCheckoutQueryToJson(PreCheckoutQuery instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'from': ?instance.from,
      'currency': ?instance.currency,
      'total_amount': ?instance.totalAmount,
      'invoice_payload': ?instance.invoicePayload,
      'shipping_option_id': ?instance.shippingOptionID,
      'order_info': ?instance.orderInfo,
    };

ShippingAddress _$ShippingAddressFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'country_code',
      'state',
      'city',
      'street_line1',
      'street_line2',
      'post_code',
    ],
  );
  return ShippingAddress(
    countryCode: json['country_code'] as String?,
    state: json['state'] as String?,
    city: json['city'] as String?,
    streetLine1: json['street_line1'] as String?,
    streetLine2: json['street_line2'] as String?,
    postcode: json['post_code'] as String?,
  );
}

Map<String, dynamic> _$ShippingAddressToJson(ShippingAddress instance) =>
    <String, dynamic>{
      'country_code': ?instance.countryCode,
      'state': ?instance.state,
      'city': ?instance.city,
      'street_line1': ?instance.streetLine1,
      'street_line2': ?instance.streetLine2,
      'post_code': ?instance.postcode,
    };

ShippingOption _$ShippingOptionFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id', 'title', 'prices']);
  return ShippingOption(
    id: json['id'] as String?,
    title: json['title'] as String?,
    prices: (json['prices'] as List<dynamic>?)
        ?.map((e) => LabeledPrice.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ShippingOptionToJson(ShippingOption instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'title': ?instance.title,
      'prices': ?instance.prices,
    };

ShippingQuery _$ShippingQueryFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'from', 'invoice_payload', 'shipping_address'],
  );
  return ShippingQuery(
    id: json['id'] as String?,
    from: json['from'] == null
        ? null
        : User.fromJson(json['from'] as Map<String, dynamic>),
    invoicePayload: json['invoice_payload'] as String?,
    shippingAddress: json['shipping_address'] == null
        ? null
        : ShippingAddress.fromJson(
            json['shipping_address'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$ShippingQueryToJson(ShippingQuery instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'from': ?instance.from,
      'invoice_payload': ?instance.invoicePayload,
      'shipping_address': ?instance.shippingAddress,
    };

SuccessfulPayment _$SuccessfulPaymentFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['currency', 'total_amount', 'invoice_payload'],
  );
  return SuccessfulPayment(
    currency: json['currency'] as String?,
    totalAmount: (json['total_amount'] as num?)?.toInt(),
    invoicePayload: json['invoice_payload'] as String?,
    shippingOptionID: json['shipping_option_id'] as String?,
    orderInfo: json['order_info'] == null
        ? null
        : OrderInfo.fromJson(json['order_info'] as Map<String, dynamic>),
    telegramPaymentChargeID: json['telegram_payment_charge_id'] as String?,
    providerPaymentChargeID: json['provider_payment_charge_id'] as String?,
  );
}

Map<String, dynamic> _$SuccessfulPaymentToJson(SuccessfulPayment instance) =>
    <String, dynamic>{
      'currency': ?instance.currency,
      'total_amount': ?instance.totalAmount,
      'invoice_payload': ?instance.invoicePayload,
      'shipping_option_id': ?instance.shippingOptionID,
      'order_info': ?instance.orderInfo,
      'telegram_payment_charge_id': ?instance.telegramPaymentChargeID,
      'provider_payment_charge_id': ?instance.providerPaymentChargeID,
    };
