//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

/// It implements [Exception] class.
/// You can find [description] that gives a description of what happened
/// inside the called Telegram method.
class ApiException implements Exception {
  final String? description;

  ApiException({this.description});

  @override
  String toString() =>
      '[ApiException]${description != null ? ': $description' : ''}';
}
