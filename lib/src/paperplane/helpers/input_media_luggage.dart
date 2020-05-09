//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:paperplane/helpers.dart';
import 'package:paperplane/paperplane_exceptions.dart';
import 'package:paperplane/src/tools/uuid/uuid_generator.dart';
import 'package:paperplane/telegram.dart';

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
  final MapEntry<String, MultipartFile> _thumbFile;

  InputMediaLuggage._(
    this._type,
    this._media,
    this._file,
    this._thumbFile,
  );

  /// Create an InputMedia with an Animation.
  factory InputMediaLuggage.withAnimation({
    @required Luggage animation,
    String caption,
    ParseMode parseMode,
    Luggage thumb,
    int width,
    int height,
    Duration duration,
  }) {
    MapEntry<String, MultipartFile> file;
    MapEntry<String, MultipartFile> thumbFile;

    final input_animation = InputMediaAnimation();
    input_animation.caption ??= caption;
    input_animation.parseMode = parseMode;
    input_animation.width = width;
    input_animation.height = height;
    input_animation.duration = duration;

    if (thumb != null) {
      if (thumb.type == 'file' || thumb.type == 'bytes') {
        final thumb_id = 'thumb_animation${Uuid.generate()}';
        input_animation.thumb = 'attach://${thumb_id}';
        thumbFile = MapEntry(
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
      final animation_id = 'animation_${Uuid.generate()}';
      input_animation.media = 'attach://${animation_id}';
      file = MapEntry(
          '${animation_id}',
          MultipartFile.fromBytes(animation.getBytes(),
              filename: animation.getName(type: 'animation')));
    } else {
      input_animation.media = animation.toString();
    }

    return InputMediaLuggage._(
      InputMediaType.ANIMATION,
      input_animation,
      file,
      thumbFile,
    );
  }

  /// Create an InputMedia with an Audio.
  factory InputMediaLuggage.withAudio({
    @required Luggage audio,
    String caption,
    ParseMode parseMode,
    Luggage thumb,
    Duration duration,
    String performer,
    String title,
  }) {
    MapEntry<String, MultipartFile> file;
    MapEntry<String, MultipartFile> thumbFile;

    final input_audio = InputMediaAudio();
    input_audio.caption = caption;
    input_audio.parseMode = parseMode;
    input_audio.duration = duration;
    input_audio.performer = performer;
    input_audio.title = title;

    if (thumb != null) {
      if (thumb.type == 'file' || thumb.type == 'bytes') {
        final thumb_id = 'thumb_audio${Uuid.generate()}';
        input_audio.thumb = 'attach://${thumb_id}';
        thumbFile = MapEntry(
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
      final audio_id = 'audio_${Uuid.generate()}';
      input_audio.media = 'attach://${audio_id}';
      file = MapEntry(
          '${audio_id}',
          MultipartFile.fromBytes(audio.getBytes(),
              filename: audio.getName(type: 'audio')));
    } else {
      input_audio.media = audio.toString();
    }

    return InputMediaLuggage._(
      InputMediaType.AUDIO,
      input_audio,
      file,
      thumbFile,
    );
  }

  /// Create an InputMedia with a Photo.
  factory InputMediaLuggage.withPhoto({
    @required Luggage photo,
    String caption,
    ParseMode parseMode,
  }) {
    MapEntry<String, MultipartFile> file;

    final input_photo = InputMediaPhoto(caption: caption, parseMode: parseMode);

    if (photo.type == 'file' || photo.type == 'bytes') {
      final photo_id = 'photo_${Uuid.generate()}';
      input_photo.media = 'attach://${photo_id}';
      file = MapEntry(
          '${photo_id}',
          MultipartFile.fromBytes(photo.getBytes(),
              filename: photo.getName(type: 'photo')));
    } else {
      input_photo.media = input_photo.toString();
    }

    return InputMediaLuggage._(
      InputMediaType.PHOTO,
      input_photo,
      file,
      null,
    );
  }

  /// Create an InputMedia with a Document.
  factory InputMediaLuggage.withDocument({
    @required Luggage document,
    String caption,
    ParseMode parseMode,
    Luggage thumb,
  }) {
    MapEntry<String, MultipartFile> file;
    MapEntry<String, MultipartFile> thumbFile;

    final input_document = InputMediaDocument();
    input_document.caption = caption;
    input_document.parseMode = parseMode;

    if (thumb != null) {
      if (thumb.type == 'file' || thumb.type == 'bytes') {
        final thumb_id = 'thumb_document_${Uuid.generate()}';
        input_document.thumb = 'attach://${thumb_id}';
        thumbFile = MapEntry(
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
      final document_id = 'document_${Uuid.generate()}';
      input_document.media = 'attach://${document_id}';
      file = MapEntry(
          '${document_id}',
          MultipartFile.fromBytes(document.getBytes(),
              filename: document.getName(type: 'document')));
    } else {
      input_document.media = document.toString();
    }

    return InputMediaLuggage._(
      InputMediaType.DOCUMENT,
      input_document,
      file,
      thumbFile,
    );
  }

  /// Create an InputMedia with a Video.
  factory InputMediaLuggage.withVideo({
    @required Luggage video,
    String caption,
    ParseMode parseMode,
    Luggage thumb,
    int width,
    int height,
    Duration duration,
    bool supportsStreaming,
  }) {
    MapEntry<String, MultipartFile> file;
    MapEntry<String, MultipartFile> thumbFile;

    final input_video = InputMediaVideo(
        caption: caption,
        parseMode: parseMode,
        width: width,
        height: height,
        duration: duration,
        supportsStreaming: supportsStreaming);

    if (thumb != null) {
      if (thumb.type == 'file' || thumb.type == 'bytes') {
        final thumb_id = 'thumb_video_${Uuid.generate()}';
        input_video.thumb = 'attach://${thumb_id}';
        thumbFile = MapEntry(
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
      final video_id = 'video_${Uuid.generate()}';
      input_video.media = 'attach://${video_id}';
      file = MapEntry(
          '${video_id}',
          MultipartFile.fromBytes(video.getBytes(),
              filename: video.getName(type: 'video')));
    } else {
      input_video.media = video.toString();
    }

    return InputMediaLuggage._(
      InputMediaType.VIDEO,
      input_video,
      file,
      thumbFile,
    );
  }

  String get type => _type.toString();

  InputMedia get media => _media;

  MapEntry<String, MultipartFile> get file => _file;

  MapEntry<String, MultipartFile> get thumb => _thumbFile;
}
