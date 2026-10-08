//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

/// You can find [description] that gives a brief error information.
class TelegramClientException implements Exception {
  final String? description;

  TelegramClientException({this.description});

  @override
  String toString() =>
      '[TelegramClientException]${description != null ? ': $description' : ''}';
}
