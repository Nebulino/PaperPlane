//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

/// You can find [errorCode] and [errorName] received from the Telegram Api.
class TelegramException implements Exception {
  final int errorCode;
  final String errorName;

  TelegramException({required this.errorCode, required this.errorName});

  @override
  String toString() => '[TelegramException]: $errorCode - $errorName';
}
