/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of payment;

/// This object contains basic information about an invoice.
///
/// https://core.telegram.org/bots/api#invoice
@JsonSerializable()
class Invoice {
  String title;
  String description;
  String start_parameter;
  String currency;
  int total_amount;

  Invoice(
      {this.title,
      this.description,
      this.start_parameter,
      this.currency,
      this.total_amount});

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
}
