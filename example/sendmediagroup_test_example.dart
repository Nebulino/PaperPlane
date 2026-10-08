//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

import 'dart:convert';
import 'dart:io' as io;

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:paperplane/helpers.dart';
import 'package:paperplane/src/tools/client/telegram_client.dart';

import 'test_values.dart';

/// A simple Example...
void main() {
  var logger = Logger();
  var client = TelegramClient(token: TestValues.TOKEN);

  var userId = TestValues.MASTER;

  var imageTest = io.File('./files/photos/test.jpg');
  var luggagePhoto = Luggage.withFile(file: imageTest);

  var videoTest = io.File('./files/videos/gatcha_experience.mp4');
  var luggageVideo = Luggage.withFile(file: videoTest);

  var photoInputLuggage = InputMediaLuggage.withPhoto(
      photo: luggagePhoto, caption: 'photo_luggage_input_media');

  var videoInputLuggage = InputMediaLuggage.withVideo(
      video: luggageVideo, caption: 'video_luggage_input_media');

  logger.d('Photo media${photoInputLuggage.media}');
  logger.d('Video media${videoInputLuggage.media}');

  var media = [photoInputLuggage.media, videoInputLuggage.media];

  logger.d(media);

  var formData =
      FormData.fromMap({'chat_id': userId, 'media': jsonEncode(media)});

  final photoFile = photoInputLuggage.file;
  if (photoFile != null) {
    formData.files.add(photoFile);
  }
  final videoFile = videoInputLuggage.file;
  if (videoFile != null) {
    formData.files.add(videoFile);
  }

  client.post(method: 'sendMediaGroup', formData: formData);

  // ################################################################
}
