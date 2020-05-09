//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

import 'package:meta/meta.dart';

/// It implements [Exception] class.
/// You can find [description] that gives a description of what happened
/// inside the called Telegram method.
class ApiException implements Exception {
  String description;

  ApiException({@required this.description});

  @override
  String toString() => '[ApiException]: ${description}';
}
