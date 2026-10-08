//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

import 'package:paperplane/paperplane_exceptions.dart';

/// This helps managing [chat_id] field in [API].
///
class ChatID {
  final dynamic _identifier;

  ChatID._(
    this._identifier,
  );

  /// It creates a ChatID using a integer chat_id.
  ChatID.fromID(
    int id,
  ) : this._(id);

  /// It creates a ChatID using a name of the Target Channel or Group.
  ChatID.fromName(
    String name,
  ) : this._(name);

  int get id {
    final identifier = _identifier;
    if (identifier is int) {
      return identifier;
    } else {
      throw PaperPlaneException(
          description: 'The contained identifier is not an ID in int');
    }
  }

  @override
  String toString() => _identifier.toString();
}
