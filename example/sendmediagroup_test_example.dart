/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

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

  var user_id = TestValues.MASTER;

  var image_test = io.File('./files/photos/test.jpg');
  var luggage_photo = Luggage.withFile(file: image_test);

  var video_test = io.File('./files/videos/gatcha_experience.mp4');
  var luggage_video = Luggage.withFile(file: video_test);

  var photo_input_luggage = InputMediaLuggage.withPhoto(
      photo: luggage_photo, caption: 'photo_luggage_input_media');

  var video_input_luggage = InputMediaLuggage.withVideo(
      video: luggage_video, caption: 'video_luggage_input_media');

  logger.d('Photo media' + photo_input_luggage.media.toString());
  logger.d('Video media' + video_input_luggage.media.toString());

  var media = [photo_input_luggage.media, video_input_luggage.media];

  logger.d(media);

  var form_data =
      FormData.fromMap({'chat_id': user_id, 'media': jsonEncode(media)});

  form_data.files.add(photo_input_luggage.file);
  form_data.files.add(video_input_luggage.file);

  client.post(method: 'sendMediaGroup', form_data: form_data);

  // ################################################################
}
