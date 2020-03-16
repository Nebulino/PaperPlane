/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'dart:convert';
import 'dart:io' as io;
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:paperplane/paperplane.dart';
import 'package:paperplane/paperplane_exceptions.dart';
import 'package:paperplane/src/core/types/parse_mode.dart';
import 'package:paperplane/src/core/types/poll_type.dart';
import 'package:paperplane/types.dart';

/// Methods Class
/// All Telegram API
class Methods {
  final Telegram _api;

  Methods(this._api);

  Methods.fromBot(PaperPlane paperplane) : this(paperplane.api);

  /// Helps making a Url for the method and sends a get request.
  Future<dynamic> _get(String method, {Map<String, dynamic> parameters}) {
    return _api.client.get(Uri.https(
        'api.telegram.org', '/bot${_api.token}/${method}', parameters));
  }

  /// Helps making a Url for the method and sends a post request.
  Future<dynamic> _post(String method, Map<String, dynamic> body) {
    return _api.client.post(
        Uri.https('api.telegram.org', '/bot${_api.token}/${method}'),
        parameters: body);
  }

  /// Helps making a Url for the method. It sends [files] via Multipart.
  Future<dynamic> _multipart_post(String method, List<http.MultipartFile> files,
      Map<String, dynamic> body) async {
    return _api.client.multipartPost(
        Uri.https('api.telegram.org', '/bot${_api.token}/${method}'), files,
        parameters: body);
  }

  /// Use this method to receive incoming updates using long polling.
  /// An Array of [Update] objects is returned.
  ///
  /// https://core.telegram.org/bots/api#getupdates.
  Future<List<Update>> getUpdates(
      {int offset,
      int limit,
      int timeout,
      List<String> allowed_updates}) async {
    List<Update> updates;

    var parameters = <String, String>{};
    parameters['offset'] = (offset ?? '');
    parameters['limit'] = (limit ?? '');
    parameters['timeout'] = (timeout ?? '');
    parameters['allowed_updates'] =
        (allowed_updates == null ? '' : jsonEncode(allowed_updates));
    var result = await _get('getUpdates', parameters: parameters);
    updates = result.map<Update>((update) => Update.fromJson(update)).toList();
    return updates;
  }

  /// Returns all bot info as a [User] object.
  ///
  /// https://core.telegram.org/bots/api#getMe
  Future<User> getMe() async {
    return User.fromJson(await _get('getMe'));
  }

  /// Returns all bot info as a [Bot] object.
  ///
  /// https://core.telegram.org/bots/api#getMe
  Future<Bot> getBot() async {
    return Bot.fromData(await _get('getMe'));
  }

  Future<bool> setWebhook() async {
    // TODO: implement setWebhook
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> deleteWebhook() async {
    // TODO: implement setWebhook
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<WebhookInfo> getWebhookInfo() async {
    // TODO: implement setWebhook
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  /// Use this method to send text messages.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendmessage
  Future<Message> sendMessage(int chat_id, String text,
      {ParseMode parse_mode,
      bool disable_web_page_preview,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['text'] = text;
    body['parse_mode'] = (parse_mode ?? '');
    body['disable_web_page_preview'] = (disable_web_page_preview ?? '');
    body['disable_notification'] = (disable_notification ?? '');
    body['reply_to_message_id'] = (reply_to_message_id ?? '');
    body['reply_markup'] =
        (reply_markup == null ? '' : jsonEncode(reply_markup));
    return Message.fromJson(await _post('sendMessage', body));
  }

  /// Use this method to forward messages of any kind.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#forwardmessage
  Future<Message> forwardMessage(int chat_id, int from_chat_id, int message_id,
      {bool disable_notification}) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['from_chat_id'] = from_chat_id;
    body['message_id'] = message_id;
    body['disable_notification'] = (disable_notification ?? '');
    return Message.fromJson(await _post('forwardMessage', body));
  }

  /// Use this method to send photos.
  /// On success, the sent [Message] is returned.
  /// [photo] argument accepts [io.File] file, [Uint8List] blob or [String] url.
  ///
  /// https://core.telegram.org/bots/api#sendphoto
  Future<Message> sendPhoto(int chat_id, dynamic photo,
      {String caption,
      ParseMode parse_mode,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['caption'] = (caption ?? '');
    body['parse_mode'] = (parse_mode ?? '');
    body['disable_notification'] = (disable_notification ?? '');
    body['reply_to_message_id'] = (reply_to_message_id ?? '');
    body['reply_markup'] =
        (reply_markup == null ? '' : jsonEncode(reply_markup));

    // Check if Photo is a String/URL or an Picture io.File.
    if (photo is String) {
      body['photo'] = photo;
      return Message.fromJson(await _post('sendPhoto', body));
    } else if (photo is io.File) {
      var files = <http.MultipartFile>[];
      files.add(http.MultipartFile(
          'photo', photo.openRead(), photo.lengthSync(),
          filename: 'Photo-${DateTime.now()}'));
      return Message.fromJson(await _multipart_post('sendPhoto', files, body));
    } else if (photo is Uint8List) {
      var files = <http.MultipartFile>[];
      var photo_created = io.File.fromRawPath(photo);
      files.add(http.MultipartFile(
          'photo', photo_created.openRead(), photo_created.lengthSync(),
          filename: 'Photo-${DateTime.now()}'));
      return Message.fromJson(await _multipart_post('sendPhoto', files, body));
    } else {
      return Future.error(
          TelegramMethodException('Photo can only be io.File, blob, '
              'Telegram file_id in String or a URL.'));
    }
  }

  /// Use this method to send audio files,
  /// if you want Telegram clients to display them in the music player.
  /// Your audio must be in the .MP3 or .M4A format.
  /// On success, the sent [Message] is returned.
  /// Bots can currently send audio files of up to 50 MB in size,
  /// this limit may be changed in the future.
  /// For sending voice messages, use the [sendVoice] method instead.
  ///
  /// [audio] argument accepts [io.File] file, [Uint8List] blob or [String] url.
  /// [thumb] argument accepts [io.File] file, [Uint8List] blob or [String] url.
  ///
  /// https://core.telegram.org/bots/api#sendaudio
  Future<Message> sendAudio(int chat_id, dynamic audio,
      {String caption,
      String parse_mode,
      dynamic duration,
      String performer,
      String title,
      dynamic thumb,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['caption'] = (caption ?? '');
    body['parse_mode'] = (parse_mode ?? '');
    body['performer'] = (performer ?? '');
    body['title'] = (title ?? '');
    body['disable_notification'] = (disable_notification ?? '');
    body['reply_to_message_id'] = (reply_to_message_id ?? '');
    body['reply_markup'] =
        (reply_markup == null ? '' : jsonEncode(reply_markup));

    if (duration != null) {
      // Check if it's a Duration type.
      if (duration is Duration) {
        body['duration'] = duration.inSeconds;
      }
      // Check if it's an int type. If it's null, set as ''.
      else if (duration is int) {
        body['duration'] = duration;
      } else {
        return Future.error(TelegramMethodException(
            'Duration has to be Duration type or int type.'));
      }
    } else {
      body['duration'] = '';
    }

    // Check if audio is a File (or Blob) or a String
    // Creating an empty list of http.MultipartFile
    var files = <http.MultipartFile>[];

    if (audio is String) {
      body['audio'] = audio;
    } else if (audio is io.File) {
      files.add(http.MultipartFile(
          'audio', audio.openRead(), audio.lengthSync(),
          filename: 'Audio-${DateTime.now()}'));
    } else if (audio is Uint8List) {
      var audio_from_blob = io.File.fromRawPath(audio);
      files.add(http.MultipartFile(
          'audio', audio_from_blob.openRead(), audio_from_blob.lengthSync(),
          filename: 'Audio-${DateTime.now()}'));
    } else {
      return Future.error(
          TelegramMethodException('Audio can only be io.File, blob, '
              'Telegram file_id in String or a URL.'));
    }

    if (thumb is String) {
      body['thumb'] = thumb;
    } else if (thumb is io.File) {
      files.add(http.MultipartFile(
          'thumb', thumb.openRead(), thumb.lengthSync(),
          filename: 'Thumb-${DateTime.now()}'));
    } else if (thumb is Uint8List) {
      var thumb_from_blob = io.File.fromRawPath(thumb);
      files.add(http.MultipartFile(
          'thumb', thumb_from_blob.openRead(), thumb_from_blob.lengthSync(),
          filename: 'Thumb-${DateTime.now()}'));
    } else if (thumb == null) {
      body['thumb'] = '';
    } else {
      return Future.error(
          TelegramMethodException('Thumb can only be io.File, blob, '
              'Telegram file_id in String or a URL.'));
    }

    if (files.isEmpty) {
      return Message.fromJson(await _post('sendAudio', body));
    } else {
      return Message.fromJson(await _multipart_post('sendAudio', files, body));
    }
  }

  /// Use this method to send general files.
  /// On success, the sent [Message] is returned.
  /// Bots can currently send files of any type of
  /// up to 50 MB in size, this limit may be changed in the future.
  /// [document] argument accepts [io.File] file,
  /// [Uint8List] blob or [String] url.
  /// [thumb] argument accepts [io.File] file, [Uint8List] blob or [String] url.
  ///
  /// https://core.telegram.org/bots/api#senddocument
  Future<Message> sendDocument(int chat_id, dynamic document,
      {dynamic thumb,
      String caption,
      String parse_mode,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['caption'] = (caption ?? '');
    body['parse_mode'] = (parse_mode ?? '');
    body['disable_notification'] = (disable_notification ?? '');
    body['reply_to_message_id'] = (reply_to_message_id ?? '');
    body['reply_markup'] =
        (reply_markup == null ? '' : jsonEncode(reply_markup));

    var files = <http.MultipartFile>[];

    if (document is String) {
      body['document'] = document;
    } else if (document is io.File) {
      files.add(http.MultipartFile(
          'document', document.openRead(), document.lengthSync(),
          filename: 'Document-${DateTime.now()}'));
    } else if (document is Uint8List) {
      var document_from_blob = io.File.fromRawPath(document);
      files.add(http.MultipartFile('document', document_from_blob.openRead(),
          document_from_blob.lengthSync(),
          filename: 'Document-${DateTime.now()}'));
    } else {
      return Future.error(
          TelegramMethodException('Document can only be io.File, blob, '
              'Telegram file_id in String or a URL.'));
    }

    if (thumb is String) {
      body['thumb'] = thumb;
    } else if (thumb is io.File) {
      files.add(http.MultipartFile(
          'thumb', thumb.openRead(), thumb.lengthSync(),
          filename: 'Thumb-${DateTime.now()}'));
    } else if (thumb is Uint8List) {
      var thumb_from_blob = io.File.fromRawPath(thumb);
      files.add(http.MultipartFile(
          'thumb', thumb_from_blob.openRead(), thumb_from_blob.lengthSync(),
          filename: 'Thumb-${DateTime.now()}'));
    } else if (thumb == null) {
      body['thumb'] = '';
    } else {
      return Future.error(
          TelegramMethodException('Thumb can only be io.File, blob, '
              'Telegram file_id in String or a URL.'));
    }

    if (files.isEmpty) {
      return Message.fromJson(await _post('sendDocument', body));
    } else {
      return Message.fromJson(
          await _multipart_post('sendDocument', files, body));
    }
  }

  /// Use this method to send video files,
  /// Telegram clients support mp4 videos
  /// (other formats may be sent as Document).
  /// On success, the sent [Message] is returned.
  /// Bots can currently send video files of up to 50 MB in size,
  /// this limit may be changed in the future.
  /// [video] argument accepts [io.File] file, [Uint8List] blob or [String] url.
  /// [thumb] argument accepts [io.File] file, [Uint8List] blob or [String] url.
  ///
  /// https://core.telegram.org/bots/api#sendvideo
  Future<Message> sendVideo(int chat_id, dynamic video,
      {dynamic duration,
      int width,
      int height,
      dynamic thumb,
      String caption,
      String parse_mode,
      bool supports_streaming,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['width'] = (width ?? '');
    body['height'] = (height ?? '');
    body['caption'] = (caption ?? '');
    body['caption'] = (caption ?? '');
    body['parse_mode'] = (parse_mode ?? '');
    body['disable_notification'] = (disable_notification ?? '');
    body['disable_notification'] = (disable_notification ?? '');
    body['reply_to_message_id'] = (reply_to_message_id ?? '');
    body['reply_markup'] =
        (reply_markup == null ? '' : jsonEncode(reply_markup));

    if (duration != null) {
      // Check if it's a Duration type.
      if (duration is Duration) {
        body['duration'] = duration.inSeconds;
      }
      // Check if it's an int type. If it's null, set as ''.
      else if (duration is int) {
        body['duration'] = duration;
      } else {
        return Future.error(TelegramMethodException(
            'Duration has to be Duration type or int type.'));
      }
    } else {
      body['duration'] = '';
    }

    var files = <http.MultipartFile>[];

    if (video is String) {
      body['video'] = video;
    } else if (video is io.File) {
      files.add(http.MultipartFile(
          'video', video.openRead(), video.lengthSync(),
          filename: 'Video-${DateTime.now()}'));
    } else if (video is Uint8List) {
      var video_from_blob = io.File.fromRawPath(video);
      files.add(http.MultipartFile(
          'video', video_from_blob.openRead(), video_from_blob.lengthSync(),
          filename: 'Video-${DateTime.now()}'));
    } else {
      return Future.error(
          TelegramMethodException('Video can only be io.File, blob, '
              'Telegram file_id in String or a URL.'));
    }

    if (thumb is String) {
      body['thumb'] = thumb;
    } else if (thumb is io.File) {
      files.add(http.MultipartFile(
          'thumb', thumb.openRead(), thumb.lengthSync(),
          filename: 'Thumb-${DateTime.now()}'));
    } else if (thumb is Uint8List) {
      var thumb_from_blob = io.File.fromRawPath(thumb);
      files.add(http.MultipartFile(
          'thumb', thumb_from_blob.openRead(), thumb_from_blob.lengthSync(),
          filename: 'Thumb-${DateTime.now()}'));
    } else if (thumb == null) {
      body['thumb'] = '';
    } else {
      return Future.error(
          TelegramMethodException('Thumb can only be io.File, blob, '
              'Telegram file_id in String or a URL.'));
    }

    if (files.isEmpty) {
      return Message.fromJson(await _post('sendVideo', body));
    } else {
      return Message.fromJson(await _multipart_post('sendVideo', files, body));
    }
  }

  /// Use this method to send animation files
  /// (GIF or H.264/MPEG-4 AVC video without sound).
  /// On success, the sent [Message] is returned.
  /// Bots can currently send animation files of up to 50 MB in size,
  /// this limit may be changed in the future.
  /// [animation] argument accepts [io.File] file,
  /// [Uint8List] blob or [String] url.
  /// [thumb] argument accepts [io.File] file, [Uint8List] blob or [String] url.
  ///
  /// https://core.telegram.org/bots/api#sendanimation
  Future<Message> sendAnimation(int chat_id, dynamic animation,
      {dynamic duration,
      int width,
      int height,
      dynamic thumb,
      String caption,
      String parse_mode,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['width'] = (width ?? '');
    body['height'] = (height ?? '');
    body['caption'] = (caption ?? '');
    body['parse_mode'] = (parse_mode ?? '');
    body['disable_notification'] = (disable_notification ?? '');
    body['disable_notification'] = (disable_notification ?? '');
    body['reply_to_message_id'] = (reply_to_message_id ?? '');
    body['reply_markup'] =
        (reply_markup == null ? '' : jsonEncode(reply_markup));

    if (duration != null) {
      // Check if it's a Duration type.
      if (duration is Duration) {
        body['duration'] = duration.inSeconds;
      }
      // Check if it's an int type. If it's null, set as ''.
      else if (duration is int) {
        body['duration'] = duration;
      } else {
        return Future.error(TelegramMethodException(
            'Duration has to be Duration type or int type.'));
      }
    } else {
      body['duration'] = '';
    }

    var files = <http.MultipartFile>[];

    if (animation is String) {
      body['animation'] = animation;
    } else if (animation is io.File) {
      files.add(http.MultipartFile(
          'animation', animation.openRead(), animation.lengthSync(),
          filename: 'Animation-${DateTime.now()}'));
    } else if (animation is Uint8List) {
      var animation_from_blob = io.File.fromRawPath(animation);
      files.add(http.MultipartFile('animation', animation_from_blob.openRead(),
          animation_from_blob.lengthSync(),
          filename: 'Animation-${DateTime.now()}'));
    } else {
      return Future.error(
          TelegramMethodException('Animation can only be io.File, blob, '
              'Telegram file_id in String or a URL.'));
    }

    if (thumb is String) {
      body['thumb'] = thumb;
    } else if (thumb is io.File) {
      files.add(http.MultipartFile(
          'thumb', thumb.openRead(), thumb.lengthSync(),
          filename: 'Thumb-${DateTime.now()}'));
    } else if (thumb is Uint8List) {
      var thumb_from_blob = io.File.fromRawPath(thumb);
      files.add(http.MultipartFile(
          'thumb', thumb_from_blob.openRead(), thumb_from_blob.lengthSync(),
          filename: 'Thumb-${DateTime.now()}'));
    } else if (thumb == null) {
      body['thumb'] = '';
    } else {
      return Future.error(
          TelegramMethodException('Thumb can only be io.File, blob, '
              'Telegram file_id in String or a URL.'));
    }

    if (files.isEmpty) {
      return Message.fromJson(await _post('sendAnimation', body));
    } else {
      return Message.fromJson(
          await _multipart_post('sendAnimation', files, body));
    }
  }

  /// Use this method to send audio files,
  /// if you want Telegram clients to display
  /// the file as a playable voice message.
  /// For this to work, your audio must be in an .ogg file encoded with OPUS
  /// (other formats may be sent as Audio or Document).
  /// On success, the sent [Message] is returned.
  /// Bots can currently send voice messages of up to 50 MB in size,
  /// this limit may be changed in the future.
  /// [voice] argument accepts [io.File] file,
  /// [Uint8List] blob or [String] url.
  ///
  /// https://core.telegram.org/bots/api#sendvoice
  Future<Message> sendVoice(int chat_id, dynamic voice,
      {String caption,
      String parse_mode,
      dynamic duration,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['caption'] = (caption ?? '');
    body['disable_notification'] = (disable_notification ?? '');
    body['reply_to_message_id'] = (reply_to_message_id ?? '');
    body['reply_markup'] =
        (reply_markup == null ? '' : jsonEncode(reply_markup));

    if (duration != null) {
      // Check if it's a Duration type.
      if (duration is Duration) {
        body['duration'] = duration.inSeconds;
      }
      // Check if it's an int type. If it's null, set as ''.
      else if (duration is int) {
        body['duration'] = duration;
      } else {
        return Future.error(TelegramMethodException(
            'Duration has to be Duration type or int type.'));
      }
    } else {
      body['duration'] = '';
    }

    var files = <http.MultipartFile>[];

    if (voice is String) {
      body['voice'] = voice;
    } else if (voice is io.File) {
      files.add(http.MultipartFile(
          'voice', voice.openRead(), voice.lengthSync(),
          filename: 'Voice-${DateTime.now()}'));
    } else if (voice is Uint8List) {
      var voice_from_blob = io.File.fromRawPath(voice);
      files.add(http.MultipartFile(
          'voice', voice_from_blob.openRead(), voice_from_blob.lengthSync(),
          filename: 'Voice-${DateTime.now()}'));
    } else {
      return Future.error(
          TelegramMethodException('Voice can only be io.File, blob, '
              'Telegram file_id in String or a URL.'));
    }

    if (files.isEmpty) {
      return Message.fromJson(await _post('sendVoice', body));
    } else {
      return Message.fromJson(await _multipart_post('sendVoice', files, body));
    }
  }

  /// As of v.4.0,
  /// Telegram clients support rounded square mp4 videos of up to 1 minute long.
  /// Use this method to send video messages.
  /// On success, the sent [Message] is returned.
  /// [video_note] argument accepts [io.File] file,
  /// [Uint8List] blob or [String] url.
  /// [thumb] argument accepts [io.File] file, [Uint8List] blob or [String] url.
  ///
  /// https://core.telegram.org/bots/api#sendvoice
  Future<Message> sendVideoNote(int chat_id, dynamic video_note,
      {dynamic duration,
      int length,
      dynamic thumb,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['lenght'] = (length ?? '');
    body['disable_notification'] = (disable_notification ?? '');
    body['reply_to_message_id'] = (reply_to_message_id ?? '');
    body['reply_markup'] =
        (reply_markup == null ? '' : jsonEncode(reply_markup));

    if (duration != null) {
      // Check if it's a Duration type.
      if (duration is Duration) {
        body['duration'] = duration.inSeconds;
      }
      // Check if it's an int type. If it's null, set as ''.
      else if (duration is int) {
        body['duration'] = duration;
      } else {
        return Future.error(TelegramMethodException(
            'Duration has to be Duration type or int type.'));
      }
    } else {
      body['duration'] = '';
    }

    var files = <http.MultipartFile>[];

    if (video_note is String) {
      body['animation'] = video_note;
    } else if (video_note is io.File) {
      files.add(http.MultipartFile(
          'animation', video_note.openRead(), video_note.lengthSync(),
          filename: 'Video_note-${DateTime.now()}'));
    } else if (video_note is Uint8List) {
      var video_note_from_blob = io.File.fromRawPath(video_note);
      files.add(http.MultipartFile('video_note',
          video_note_from_blob.openRead(), video_note_from_blob.lengthSync(),
          filename: 'Video_note-${DateTime.now()}'));
    } else {
      return Future.error(
          TelegramMethodException('Video note can only be io.File, blob, '
              'Telegram file_id in String or a URL.'));
    }

    if (thumb is String) {
      body['thumb'] = thumb;
    } else if (thumb is io.File) {
      files.add(http.MultipartFile(
          'thumb', thumb.openRead(), thumb.lengthSync(),
          filename: 'Thumb-${DateTime.now()}'));
    } else if (thumb is Uint8List) {
      var thumb_from_blob = io.File.fromRawPath(thumb);
      files.add(http.MultipartFile(
          'thumb', thumb_from_blob.openRead(), thumb_from_blob.lengthSync(),
          filename: 'Thumb-${DateTime.now()}'));
    } else if (thumb == null) {
      body['thumb'] = '';
    } else {
      return Future.error(
          TelegramMethodException('Thumb can only be io.File, blob, '
              'Telegram file_id in String or a URL.'));
    }

    if (files.isEmpty) {
      return Message.fromJson(await _post('sendVideoNote', body));
    } else {
      return Message.fromJson(
          await _multipart_post('sendVideoNote', files, body));
    }
  }

  /// Use this method to send a group of photos or videos as an album.
  /// On success, an array of the sent [Messages] is returned.
  /// [media] is a List of [InputMediaPhoto] and/or [InputMediaVideo].
  ///
  /// [Messages]: [message]
  ///
  /// https://core.telegram.org/bots/api#sendmediagroup
  Future<List<Message>> sendMediaGroup(int chat_id, List<InputMedia> media,
      {bool disable_notification, int reply_to_message_id}) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['disable_notification'] = (disable_notification ?? '');
    body['reply_to_message_id'] = (reply_to_message_id ?? '');

    if (media.length > 10) {
      return Future.error(
          'media can not be longer than 10 InputMedia objects.');
    }

    // var files = <http.MultipartFile>[];
    // var messages = <Message>[];

    media.forEach((element) {
      if (element.type != 'photo' || element.type != 'video') {
        print(Future.error(TelegramMethodException(
            'media list can only contains photo (InputMediaPhoto) '
            'or video (InputMediaVideo).')));
      } else if (element.type == 'photo') {
      } else if (element.type == 'video') {}
    });

    // return messages;
    // TODO: implement sendMediaGroup
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  /// Use this method to send point on the map.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendlocation
  Future<Message> sendLocation(int chat_id, double latitude, double longitude,
      {int live_period,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['latitude'] = latitude;
    body['longitude'] = longitude;
    body['live_period'] = (live_period ?? '');
    body['disable_notification'] = (disable_notification ?? '');
    body['reply_to_message_id'] = (reply_to_message_id ?? '');
    body['reply_markup'] =
        (reply_markup == null ? '' : jsonEncode(reply_markup));

    return Message.fromJson(await _post('sendLocation', body));
  }

  /// Use this method to edit live location messages.
  /// A location can be edited until its live_period expires
  /// or editing is explicitly disabled by a call
  /// to stopMessageLiveLocation.
  /// On success, if the edited message was sent by the bot,
  /// the edited [Message] is returned,
  /// otherwise True is returned.
  ///
  /// https://core.telegram.org/bots/api#editmessagelivelocation
  Future<Message> editMessageLiveLocation(double latitude, double longitude,
      {int chat_id,
      int message_id,
      String inline_message_id,
      ReplyMarkup reply_markup}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null)) {
      return Future.error(TelegramMethodException(
          'At least inline_message_id is required. Can be used also chat_id and message_id.'));
    }

    var body = <String, dynamic>{};
    body['latitude'] = latitude;
    body['longitude'] = longitude;
    body['chat_id'] = (chat_id ?? '');
    body['message_id'] = (message_id ?? '');
    body['inline_message_id'] = (inline_message_id ?? '');
    body['reply_markup'] =
        (reply_markup == null ? '' : jsonEncode(reply_markup));

    return Message.fromJson(await _post('editMessageLiveLocation', body));
  }

  /// Use this method to stop updating a live location message
  /// before live_period expires.
  /// On success, if the message was sent by the bot,
  /// the sent [Message] is returned, otherwise True is returned.
  ///
  /// https://core.telegram.org/bots/api#stopmessagelivelocation
  Future<Message> stopMessageLiveLocation(
      {int chat_id,
      int message_id,
      String inline_message_id,
      ReplyMarkup reply_markup}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null)) {
      return Future.error(TelegramMethodException(
          'At least inline_message_id is required. Can be used also chat_id and message_id.'));
    }

    var body = <String, dynamic>{};
    body['chat_id'] = (chat_id ?? '');
    body['message_id'] = (message_id ?? '');
    body['inline_message_id'] = (inline_message_id ?? '');
    body['reply_markup'] =
        (reply_markup == null ? '' : jsonEncode(reply_markup));

    return Message.fromJson(await _post('stopMessageLiveLocation', body));
  }

  /// Use this method to send information about a venue.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendvenue
  Future<Message> sendVenue(int chat_id, double latitude, double longitude,
      String title, String address,
      {String foursquare_id,
      String foursquare_type,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['latitude'] = latitude;
    body['longitude'] = longitude;
    body['title'] = title;
    body['address'] = address;
    body['foursquare_id'] = (foursquare_id ?? '');
    body['foursquare_type'] = (foursquare_type ?? '');
    body['disable_notification'] = (disable_notification ?? '');
    body['reply_to_message_id'] = (reply_to_message_id ?? '');
    body['reply_markup'] =
        (reply_markup == null ? '' : jsonEncode(reply_markup));

    return Message.fromJson(await _post('sendVenue', body));
  }

  /// Use this method to send phone contacts.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendcontact
  Future<Message> sendContact(
      int chat_id, String phone_number, String first_name,
      {String last_name,
      String vcard,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['phone_number'] = phone_number;
    body['first_name'] = first_name;
    body['last_name'] = (last_name ?? '');
    body['vcard'] = (vcard ?? '');
    body['disable_notification'] = (disable_notification ?? '');
    body['reply_to_message_id'] = (reply_to_message_id ?? '');
    body['reply_markup'] =
        (reply_markup == null ? '' : jsonEncode(reply_markup));

    return Message.fromJson(await _post('sendContact', body));
  }

  /// Use this method to send a native poll.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendpoll
  Future<Message> sendPoll(int chat_id, String question, List<String> options,
      {bool is_anonymous,
      PollType type,
      bool allows_multiple_answers,
      int correct_option_id,
      bool is_closed,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['question'] = question;
    body['options'] = jsonEncode(options);
    body['is_anonymous'] = (is_anonymous ?? '');
    body['type'] = (type ?? PollType.Regular());
    body['allows_multiple_answers'] = (allows_multiple_answers ?? '');
    body['correct_option_id'] = (correct_option_id ?? '');
    body['is_closed'] = (is_closed ?? '');
    body['disable_notification'] = (disable_notification ?? '');
    body['reply_to_message_id'] = (reply_to_message_id ?? '');
    body['reply_markup'] =
        (reply_markup == null ? '' : jsonEncode(reply_markup));

    return Message.fromJson(await _post('sendPoll', body));
  }

  /// Use this method when you need to tell the user
  /// that something is happening on the bot's side.
  /// The status is set for 5 seconds or less
  /// (when a message arrives from your bot,
  /// Telegram clients clear its typing status).
  /// Returns True on success.
  ///
  /// Example: The [ImageBot] needs some time to process a request
  /// and upload the image.
  /// Instead of sending a text message along the lines of
  /// “Retrieving image, please wait…”,
  /// the bot may use [sendChatAction] with
  /// action = upload_photo.
  /// The user will see a “sending photo” status for the bot.
  ///
  /// We only recommend using this method when a response
  /// from the bot will take a noticeable amount of time to arrive.
  ///
  /// [ImageBot]: https://t.me/imagebot
  ///
  /// https://core.telegram.org/bots/api#sendchataction
  Future<bool> sendChatAction(int chat_id, String action) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['action'] = action;

    return await _post('sendChatAction', body);
  }

  Future<UserProfilePhotos> getUserProfilePhotos() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<File> getFile() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> kickChatMember() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> unbanChatMember() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> restrictChatMember() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> promoteChatMember() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> setChatAdministratorCustomTitle() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> setChatPermissions() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> exportChatInviteLink() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> setChatPhoto() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> deleteChatPhoto() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> setChatDescription() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> pinChatMessage() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> unpinChatMessage() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> leaveChat() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<Chat> getChat() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<int> getChatMembersCount() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<ChatMember> getChatMember() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> sendChatStickerSet() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> deleteChatStickerSet() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> answerCallbackQuery() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<Message> editMessageText() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<Message> editMessageCaption() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<Message> editMessageMedia() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<Message> editMessageReplyMarkup() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<Poll> stopPoll() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> deleteMessage() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<Message> sendSticker() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<StickerSet> getStickerSet() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<File> uploadStickerFile() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> createNewStickerSet() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> addStickerToSet() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> setStickerPositionInSet() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> deleteStickerFromSet() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> answerInlineQuery() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<Message> sendInvoice() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> answerShippingQuery() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> answerPreCheckoutQuery() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<bool> setPassportDataErrors() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<Message> sendGame() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<Message> setGameScore() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }

  Future<List<Message>> getGameHighScores() async {
    return Future.error(TelegramMethodException('Not yet Implemented'));
  }
}
