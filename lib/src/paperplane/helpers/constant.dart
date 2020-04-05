/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

/// Contains every telegram constants for future uses.
class Constant {
  // Telegram Limitations
  static const int MAX_MESSAGE_LENGTH = 4096;
  static const int MAX_CAPTION_LENGTH = 1024;
  static int MAX_FILESIZE_DOWNLOAD = (20E6 as int);
  static int MAX_FILESIZE_UPLOAD = 50E6 as int;
  static int MAX_PHOTOSIZE_UPLOAD = 10E6 as int;
  static const int MAX_MESSAGES_PER_SECOND_PER_CHAT = 1;
  static const int MAX_MESSAGES_PER_SECOND = 30;
  static const int MAX_MESSAGES_PER_MINUTE_PER_GROUP = 20;
  static const int MAX_MESSAGE_ENTITIES = 100;
  static const int MAX_INLINE_QUERY_RESULTS = 50;

  // LongPolling parameters
  static const POLLING_OFFSET = 0;
  static const POLLING_LIMIT = 100;
  static const POLLING_TIMEOUT = 20;
  static const MAX_POLLING_TIMEOUT = 50;

  // Webhook parameters
  static const int MAX_WEBHOOK_CONNECTIONS = 40;
  static const List<int> SUPPORT_WEBHOOK_PORTS = [443, 80, 88, 8443];
}
