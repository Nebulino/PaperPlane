//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

import 'package:dio/dio.dart';
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
  final MapEntry<String, MultipartFile>? _file;
  final MapEntry<String, MultipartFile>? _thumbFile;

  InputMediaLuggage._(
    this._type,
    this._media,
    this._file,
    this._thumbFile,
  );

  /// Create an InputMedia with an Animation.
  factory InputMediaLuggage.withAnimation({
    required Luggage animation,
    String? caption,
    ParseMode? parseMode,
    Luggage? thumb,
    int? width,
    int? height,
    Duration? duration,
  }) {
    MapEntry<String, MultipartFile>? file;
    MapEntry<String, MultipartFile>? thumbFile;

    final inputAnimation = InputMediaAnimation();
    inputAnimation.caption = caption;
    inputAnimation.parseMode = parseMode;
    inputAnimation.width = width;
    inputAnimation.height = height;
    inputAnimation.duration = duration;

    if (thumb != null) {
      if (thumb.type == 'file' || thumb.type == 'bytes') {
        final thumbId = 'thumb_animation${Uuid.generate()}';
        inputAnimation.thumb = 'attach://$thumbId';
        thumbFile = MapEntry(
            thumbId,
            MultipartFile.fromBytes(thumb.getBytes(),
                filename: thumb.getName(type: 'thumb')));
      } else {
        throw PaperPlaneException(
            description: "Thumbnails can't be reused "
                'and can be only uploaded as a new file.');
      }
    }

    if (animation.type == 'file' || animation.type == 'bytes') {
      final animationId = 'animation_${Uuid.generate()}';
      inputAnimation.media = 'attach://$animationId';
      file = MapEntry(
          animationId,
          MultipartFile.fromBytes(animation.getBytes(),
              filename: animation.getName(type: 'animation')));
    } else {
      inputAnimation.media = animation.toString();
    }

    return InputMediaLuggage._(
      InputMediaType.ANIMATION,
      inputAnimation,
      file,
      thumbFile,
    );
  }

  /// Create an InputMedia with an Audio.
  factory InputMediaLuggage.withAudio({
    required Luggage audio,
    String? caption,
    ParseMode? parseMode,
    Luggage? thumb,
    Duration? duration,
    String? performer,
    String? title,
  }) {
    MapEntry<String, MultipartFile>? file;
    MapEntry<String, MultipartFile>? thumbFile;

    final inputAudio = InputMediaAudio();
    inputAudio.caption = caption;
    inputAudio.parseMode = parseMode;
    inputAudio.duration = duration;
    inputAudio.performer = performer;
    inputAudio.title = title;

    if (thumb != null) {
      if (thumb.type == 'file' || thumb.type == 'bytes') {
        final thumbId = 'thumb_audio${Uuid.generate()}';
        inputAudio.thumb = 'attach://$thumbId';
        thumbFile = MapEntry(
            thumbId,
            MultipartFile.fromBytes(thumb.getBytes(),
                filename: thumb.getName(type: 'thumb')));
      } else {
        throw PaperPlaneException(
            description: "Thumbnails can't be reused "
                'and can be only uploaded as a new file.');
      }
    }

    if (audio.type == 'file' || audio.type == 'bytes') {
      final audioId = 'audio_${Uuid.generate()}';
      inputAudio.media = 'attach://$audioId';
      file = MapEntry(
          audioId,
          MultipartFile.fromBytes(audio.getBytes(),
              filename: audio.getName(type: 'audio')));
    } else {
      inputAudio.media = audio.toString();
    }

    return InputMediaLuggage._(
      InputMediaType.AUDIO,
      inputAudio,
      file,
      thumbFile,
    );
  }

  /// Create an InputMedia with a Photo.
  factory InputMediaLuggage.withPhoto({
    required Luggage photo,
    String? caption,
    ParseMode? parseMode,
  }) {
    MapEntry<String, MultipartFile>? file;

    final inputPhoto = InputMediaPhoto(caption: caption, parseMode: parseMode);

    if (photo.type == 'file' || photo.type == 'bytes') {
      final photoId = 'photo_${Uuid.generate()}';
      inputPhoto.media = 'attach://$photoId';
      file = MapEntry(
          photoId,
          MultipartFile.fromBytes(photo.getBytes(),
              filename: photo.getName(type: 'photo')));
    } else {
      inputPhoto.media = photo.toString();
    }

    return InputMediaLuggage._(
      InputMediaType.PHOTO,
      inputPhoto,
      file,
      null,
    );
  }

  /// Create an InputMedia with a Document.
  factory InputMediaLuggage.withDocument({
    required Luggage document,
    String? caption,
    ParseMode? parseMode,
    Luggage? thumb,
  }) {
    MapEntry<String, MultipartFile>? file;
    MapEntry<String, MultipartFile>? thumbFile;

    final inputDocument = InputMediaDocument();
    inputDocument.caption = caption;
    inputDocument.parseMode = parseMode;

    if (thumb != null) {
      if (thumb.type == 'file' || thumb.type == 'bytes') {
        final thumbId = 'thumb_document_${Uuid.generate()}';
        inputDocument.thumb = 'attach://$thumbId';
        thumbFile = MapEntry(
            thumbId,
            MultipartFile.fromBytes(thumb.getBytes(),
                filename: thumb.getName(type: 'thumb')));
      } else {
        throw PaperPlaneException(
            description: "Thumbnails can't be reused "
                'and can be only uploaded as a new file.');
      }
    }

    if (document.type == 'file' || document.type == 'bytes') {
      final documentId = 'document_${Uuid.generate()}';
      inputDocument.media = 'attach://$documentId';
      file = MapEntry(
          documentId,
          MultipartFile.fromBytes(document.getBytes(),
              filename: document.getName(type: 'document')));
    } else {
      inputDocument.media = document.toString();
    }

    return InputMediaLuggage._(
      InputMediaType.DOCUMENT,
      inputDocument,
      file,
      thumbFile,
    );
  }

  /// Create an InputMedia with a Video.
  factory InputMediaLuggage.withVideo({
    required Luggage video,
    String? caption,
    ParseMode? parseMode,
    Luggage? thumb,
    int? width,
    int? height,
    Duration? duration,
    bool? supportsStreaming,
  }) {
    MapEntry<String, MultipartFile>? file;
    MapEntry<String, MultipartFile>? thumbFile;

    final inputVideo = InputMediaVideo(
        caption: caption,
        parseMode: parseMode,
        width: width,
        height: height,
        duration: duration,
        supportsStreaming: supportsStreaming);

    if (thumb != null) {
      if (thumb.type == 'file' || thumb.type == 'bytes') {
        final thumbId = 'thumb_video_${Uuid.generate()}';
        inputVideo.thumb = 'attach://$thumbId';
        thumbFile = MapEntry(
            thumbId,
            MultipartFile.fromBytes(thumb.getBytes(),
                filename: thumb.getName(type: 'thumb')));
      } else {
        throw PaperPlaneException(
            description: "Thumbnails can't be reused "
                'and can be only uploaded as a new file.');
      }
    }

    if (video.type == 'file' || video.type == 'bytes') {
      final videoId = 'video_${Uuid.generate()}';
      inputVideo.media = 'attach://$videoId';
      file = MapEntry(
          videoId,
          MultipartFile.fromBytes(video.getBytes(),
              filename: video.getName(type: 'video')));
    } else {
      inputVideo.media = video.toString();
    }

    return InputMediaLuggage._(
      InputMediaType.VIDEO,
      inputVideo,
      file,
      thumbFile,
    );
  }

  String get type => _type.toString();

  InputMedia get media => _media;

  MapEntry<String, MultipartFile>? get file => _file;

  MapEntry<String, MultipartFile>? get thumb => _thumbFile;
}
