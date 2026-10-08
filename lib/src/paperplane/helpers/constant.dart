//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

/// Contains every telegram constants for future uses.
class Constant {
  // Telegram Limitations
  static const int MAX_MESSAGE_LENGTH = 4096;
  static const int MAX_CAPTION_LENGTH = 1024;
  static const int MAX_FILESIZE_DOWNLOAD = 20000000;
  static const int MAX_FILESIZE_UPLOAD = 50000000;
  static const int MAX_PHOTOSIZE_UPLOAD = 10000000;
  static const int MAX_MESSAGES_PER_SECOND_PER_CHAT = 1;
  static const int MAX_MESSAGES_PER_SECOND = 30;
  static const int MAX_MESSAGES_PER_MINUTE_PER_GROUP = 20;
  static const int MAX_MESSAGE_ENTITIES = 100;
  static const int MAX_INLINE_QUERY_RESULTS = 50;

  // LongPolling parameters
  static const int POLLING_OFFSET = 0;
  static const int POLLING_LIMIT = 100;
  static const int POLLING_TIMEOUT = 20;
  static const int MAX_POLLING_TIMEOUT = 50;

  // Webhook parameters
  static const int MAX_WEBHOOK_CONNECTIONS = 40;
  static const List<int> SUPPORT_WEBHOOK_PORTS = [443, 80, 88, 8443];
}
