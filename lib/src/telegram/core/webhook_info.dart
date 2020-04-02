/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of core;

/// Contains information about the current status of a webhook.
///
/// https://core.telegram.org/bots/api#webhookinfo
@JsonSerializable(includeIfNull: false)
class WebhookInfo {
  /// Webhook URL, may be empty if webhook is not set up.
  @JsonKey(name: 'url', required: true)
  String url;

  /// True, if a custom certificate was provided for webhook certificate checks.
  @JsonKey(name: 'has_custom_certificate', required: true)
  bool hasCustomCertificate;

  /// Number of updates awaiting delivery
  @JsonKey(name: 'pending_update_count', required: true)
  int pendingUpdateCount;

  /// *Optional.* Unix time for the most recent error that
  /// happened when trying to deliver an update via webhook.
  @JsonKey(
      name: 'last_error_date',
      fromJson: _dateTimeFromTelegramInt,
      toJson: _dateTimeToTelegramInt)
  DateTime lastErrorDate;

  /// *Optional.* Error message in human-readable format for the most recent error
  /// that happened when trying to deliver an update via webhook.
  @JsonKey(name: 'last_error_message')
  String lastErrorMessage;

  /// *Optional.* Maximum allowed number of simultaneous HTTPS connections to the
  /// webhook for update delivery.
  @JsonKey(name: 'max_connections')
  int maxConnections;

  /// *Optional.* A list of update types the bot is subscribed to.
  /// Defaults to all update types
  @JsonKey(name: 'allowed_updates')
  List<String> allowedUpdates;

  WebhookInfo(
      {this.url,
      this.hasCustomCertificate,
      this.pendingUpdateCount,
      this.lastErrorDate,
      this.lastErrorMessage,
      this.maxConnections,
      this.allowedUpdates});

  factory WebhookInfo.fromJson(Map<String, dynamic> json) =>
      _$WebhookInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WebhookInfoToJson(this);

  /// Helper: converts into a DateTime type from
  /// a int (unix time) received from Telegram API.
  static DateTime _dateTimeFromTelegramInt(int unixTime) =>
      unixTime == null ? null : DateTime.fromMillisecondsSinceEpoch(unixTime);

  /// Helper: converts from a DateTime type into
  /// a int (unix time) to be sent to Telegram API.
  static int _dateTimeToTelegramInt(DateTime dateTime) =>
      dateTime?.millisecondsSinceEpoch;
}
