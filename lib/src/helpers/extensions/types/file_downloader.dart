/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'dart:io' as io;
import 'dart:typed_data';

import 'package:paperplane/paperplane.dart';
import 'package:paperplane/paperplane_exceptions.dart';
import 'package:paperplane/types.dart';

extension FileDownloader on File {
  Methods get _methods => PaperPlane.fly.api.methods;

  Telegram get _api => PaperPlane.fly.api;

// TODO: implement FileDownloader

Future<dynamic> _downloadFile() {
    throw PaperPlaneException(description: 'Not yet implemented.');
  }

  Uint8List downloadBytes() {
    throw PaperPlaneException(description: 'Not yet implemented.');
  }

  io.File downloadFile() {
    // return io.File.fromRawPath(downloadBytes());
    throw PaperPlaneException(description: 'Not yet implemented.');
  }
}
