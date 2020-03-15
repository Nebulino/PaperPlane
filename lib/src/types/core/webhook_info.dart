/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of core;

/// Webhook Info telegram.types Class
/// https://core.telegram.org/bots/api#webhookinfo
@JsonSerializable()
class WebhookInfo {
  String url;
  bool has_custom_certificate;
  int pending_update_count;
  int last_error_date;
  String last_error_message;
  int max_connections;
  List<String> allowed_updates;

  WebhookInfo(
      {this.url,
      this.has_custom_certificate,
      this.pending_update_count,
      this.last_error_date,
      this.last_error_message,
      this.max_connections,
      this.allowed_updates});

  factory WebhookInfo.fromJson(Map<String, dynamic> json) =>
      _$WebhookInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WebhookInfoToJson(this);
}
