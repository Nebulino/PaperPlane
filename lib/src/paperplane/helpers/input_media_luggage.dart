/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:paperplane/helpers.dart';
import 'package:paperplane/paperplane_exceptions.dart';
import 'package:paperplane/telegram.dart';
import 'package:uuid/uuid.dart';

/// It helps creating an Input Media for [TelegramAPIs].
/// For example you can find it useful when sending a [sendMediaGroup].
/// For now [sendMediaGroup] accepts only [photos] and [videos].
///
/// [TelegramAPIs]: [Telegram]
/// [sendMediaGroup]: [API]
/// [photos]: [PhotoSize]
/// [videos]: [Video]
class InputMediaLuggage {
  final InputMediaType _type;
  final InputMedia _media;
  final MapEntry<String, MultipartFile> _file;
  final MapEntry<String, MultipartFile> _thumb_file;

  InputMediaLuggage._(this._type, this._media, this._file, this._thumb_file);

  /// Create an InputMedia with an Animation.
  factory InputMediaLuggage.withAnimation(
      {@required Luggage animation,
      String caption,
      ParseMode parse_mode,
      Luggage thumb,
      int width,
      int height,
      Duration duration}) {
    MapEntry<String, MultipartFile> file;
    MapEntry<String, MultipartFile> thumb_file;

    final input_animation = InputMediaAnimation();
    input_animation.caption ??= caption;
    input_animation.parse_mode = parse_mode?.getMode();
    input_animation.width = width;
    input_animation.height = height;
    input_animation.duration = duration?.inSeconds;

    final uuid_generator = Uuid();

    if (thumb != null) {
      if (thumb.type == 'file' || thumb.type == 'bytes') {
        final thumb_id = 'thumb_animation${uuid_generator.v1()}';
        input_animation.thumb = 'attach://${thumb_id}';
        thumb_file = MapEntry(
            '${thumb_id}',
            MultipartFile.fromBytes(thumb.getBytes(),
                filename: thumb.getName(type: 'thumb')));
      } else {
        throw PaperPlaneException(
            description: "Thumbnails can't be reused "
                'and can be only uploaded as a new file.');
      }
    }

    if (animation.type == 'file' || animation.type == 'bytes') {
      final animation_id = 'animation_${uuid_generator.v1()}';
      input_animation.media = 'attach://${animation_id}';
      file = MapEntry(
          '${animation_id}',
          MultipartFile.fromBytes(animation.getBytes(),
              filename: animation.getName(type: 'animation')));
    } else {
      input_animation.media = animation.toString();
    }

    return InputMediaLuggage._(
        InputMediaType.Animation(), input_animation, file, thumb_file);
  }

  /// Create an InputMedia with an Audio.
  factory InputMediaLuggage.withAudio(
      {@required Luggage audio,
      String caption,
      ParseMode parse_mode,
      Luggage thumb,
      Duration duration,
      String performer,
      String title}) {
    MapEntry<String, MultipartFile> file;
    MapEntry<String, MultipartFile> thumb_file;

    final input_audio = InputMediaAudio();
    input_audio.caption = caption;
    input_audio.parse_mode = parse_mode?.getMode();
    input_audio.duration = duration?.inSeconds;
    input_audio.performer = performer;
    input_audio.title = title;

    final uuid_generator = Uuid();

    if (thumb != null) {
      if (thumb.type == 'file' || thumb.type == 'bytes') {
        final thumb_id = 'thumb_audio${uuid_generator.v1()}';
        input_audio.thumb = 'attach://${thumb_id}';
        thumb_file = MapEntry(
            '${thumb_id}',
            MultipartFile.fromBytes(thumb.getBytes(),
                filename: thumb.getName(type: 'thumb')));
      } else {
        throw PaperPlaneException(
            description: "Thumbnails can't be reused "
                'and can be only uploaded as a new file.');
      }
    }

    if (audio.type == 'file' || audio.type == 'bytes') {
      final audio_id = 'audio_${uuid_generator.v1()}';
      input_audio.media = 'attach://${audio_id}';
      file = MapEntry(
          '${audio_id}',
          MultipartFile.fromBytes(audio.getBytes(),
              filename: audio.getName(type: 'audio')));
    } else {
      input_audio.media = audio.toString();
    }

    return InputMediaLuggage._(
        InputMediaType.Audio(), input_audio, file, thumb_file);
  }

  /// Create an InputMedia with a Photo.
  factory InputMediaLuggage.withPhoto({
    @required Luggage photo,
    String caption,
    ParseMode parse_mode,
  }) {
    MapEntry<String, MultipartFile> file;

    final uuid_generator = Uuid();

    final input_photo =
        InputMediaPhoto(caption: caption, parse_mode: parse_mode?.getMode());

    if (photo.type == 'file' || photo.type == 'bytes') {
      final photo_id = 'photo_${uuid_generator.v1()}';
      input_photo.media = 'attach://${photo_id}';
      file = MapEntry(
          '${photo_id}',
          MultipartFile.fromBytes(photo.getBytes(),
              filename: photo.getName(type: 'photo')));
    } else {
      input_photo.media = input_photo.toString();
    }

    return InputMediaLuggage._(InputMediaType.Photo(), input_photo, file, null);
  }

  /// Create an InputMedia with a Document.
  factory InputMediaLuggage.withDocument(
      {@required Luggage document,
      String caption,
      ParseMode parse_mode,
      Luggage thumb}) {
    MapEntry<String, MultipartFile> file;
    MapEntry<String, MultipartFile> thumb_file;

    final input_document = InputMediaDocument();
    input_document.caption = caption;
    input_document.parse_mode = parse_mode?.getMode();

    final uuid_generator = Uuid();

    if (thumb != null) {
      if (thumb.type == 'file' || thumb.type == 'bytes') {
        final thumb_id = 'thumb_document_${uuid_generator.v1()}';
        input_document.thumb = 'attach://${thumb_id}';
        thumb_file = MapEntry(
            '${thumb_id}',
            MultipartFile.fromBytes(thumb.getBytes(),
                filename: thumb.getName(type: 'thumb')));
      } else {
        throw PaperPlaneException(
            description: "Thumbnails can't be reused "
                'and can be only uploaded as a new file.');
      }
    }

    if (document.type == 'file' || document.type == 'bytes') {
      final document_id = 'document_${uuid_generator.v1()}';
      input_document.media = 'attach://${document_id}';
      file = MapEntry(
          '${document_id}',
          MultipartFile.fromBytes(document.getBytes(),
              filename: document.getName(type: 'document')));
    } else {
      input_document.media = document.toString();
    }

    return InputMediaLuggage._(
        InputMediaType.Document(), input_document, file, thumb_file);
  }

  /// Create an InputMedia with a Video.
  factory InputMediaLuggage.withVideo(
      {@required Luggage video,
      String caption,
      ParseMode parse_mode,
      Luggage thumb,
      int width,
      int height,
      Duration duration,
      bool supports_streaming}) {
    MapEntry<String, MultipartFile> file;
    MapEntry<String, MultipartFile> thumb_file;

    final input_video = InputMediaVideo(
        caption: caption,
        parse_mode: parse_mode?.getMode(),
        width: width,
        height: height,
        duration: duration?.inSeconds,
        supports_streaming: supports_streaming);

    final uuid_generator = Uuid();

    if (thumb != null) {
      if (thumb.type == 'file' || thumb.type == 'bytes') {
        final thumb_id = 'thumb_video_${uuid_generator.v1()}';
        input_video.thumb = 'attach://${thumb_id}';
        thumb_file = MapEntry(
            '${thumb_id}',
            MultipartFile.fromBytes(thumb.getBytes(),
                filename: thumb.getName(type: 'thumb')));
      } else {
        throw PaperPlaneException(
            description: "Thumbnails can't be reused "
                'and can be only uploaded as a new file.');
      }
    }

    if (video.type == 'file' || video.type == 'bytes') {
      final video_id = 'video_${uuid_generator.v1()}';
      input_video.media = 'attach://${video_id}';
      file = MapEntry(
          '${video_id}',
          MultipartFile.fromBytes(video.getBytes(),
              filename: video.getName(type: 'video')));
    } else {
      input_video.media = video.toString();
    }

    return InputMediaLuggage._(
        InputMediaType.Video(), input_video, file, thumb_file);
  }

  String get type => _type.type;

  InputMedia get media => _media;

  MapEntry<String, MultipartFile> get file => _file;

  MapEntry<String, MultipartFile> get thumb => _thumb_file;
}
