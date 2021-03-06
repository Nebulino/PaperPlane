//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

import 'dart:io' as io;
import 'dart:typed_data';

import 'package:meta/meta.dart';
import 'package:paperplane/paperplane_exceptions.dart';
import 'package:path/path.dart' as path;

/// This object represents the contents of a file to be uploaded.
/// Must be posted using multipart/form-data in the usual way that
/// files are uploaded via the browser.
///
/// *FunFact:* instead of calling it InputFile, I called Luggage,
/// because it's a PaperPlane (?)
/// Got it?! ^-^
///
/// [More info...]
///
/// [More info...]: https://core.telegram.org/bots/api#inputfile
class Luggage {
  /// The type of the Luggage content.
  /// It can be: io.File, bytes, url, file_id,
  String _type;

  /// The real content inside the luggage to be sent with the "PaperPlane".
  dynamic _content;

  Luggage._(this._type, this._content);

  factory Luggage.withFile({@required io.File file}) {
    return Luggage._('file', file);
  }

  factory Luggage.withBytes({@required Uint8List blob}) {
    return Luggage._('bytes', blob);
  }

  factory Luggage.withLink({@required String link}) {
    return Luggage._('link', link);
  }

  factory Luggage.withTGFileID({@required String fileId}) {
    return Luggage._('file_id', fileId);
  }

  String get type => _type;

  Uint8List getBytes() {
    if (_type == 'link' || _type == 'file_id') {
      throw PaperPlaneException(description: "Can't export as Bytes.");
    } else if (_type == 'file') {
      return (_content as io.File).readAsBytesSync();
    } else {
      return _content;
    }
  }

  String getName({
    String type,
  }) {
    if (_type == 'file') {
      return path.basename(_content.path);
    } else {
      return (type ?? 'paperplane') + '-${DateTime.now()}';
    }
  }

  @override
  String toString() {
    if (_type != 'link' && _type != 'file_id') {
      throw PaperPlaneException(description: "Can't export as String.");
    } else {
      return _content;
    }
  }
}
