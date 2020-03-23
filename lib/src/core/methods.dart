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
import 'package:paperplane/paperplane_helpers.dart';
import 'package:paperplane/telegram.dart';

/// You can find all Telegram API methods.
class Methods {
  final Telegram _api;

  /// It creates all methods necessary information from a [Telegram] Object.
  Methods(this._api);

  /// It creates all methods necessary information from a [PaperPlane] bot.
  Methods.fromBot(PaperPlane paperplane) : this(paperplane.api);

  /// Helps making a Url for the method and sends a get request.
  Future<dynamic> _get(String method, {Map<String, dynamic> parameters}) {
    return _api.client.get(Uri.https(
        'api.telegram.org',
        '/bot${_api.token}/${method}',
        ((parameters == null
            ? null
            : parameters.map((key, value) => MapEntry(key, '${value}'))))));
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

    var parameters = <String, dynamic>{};
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

  /// Use this method to specify a url and receive incoming updates
  /// via an outgoing webhook.
  /// Whenever there is an update for the bot,
  /// we will send an HTTPS POST request to the specified url,
  /// containing a JSON-serialized [Update].
  /// In case of an unsuccessful request,
  /// we will give up after a reasonable amount of attempts.
  /// Returns True on success.
  ///
  /// If you'd like to make sure that the
  /// Webhook request comes from Telegram,
  /// we recommend using a secret path in the URL,
  /// e.g. https://www.example.com/<token>.
  ///
  /// Since nobody else knows your bot‘s token,
  /// you can be pretty sure it’s us.
  ///
  /// https://core.telegram.org/bots/api#setwebhook
  Future<bool> setWebhook(String url,
      {io.File certificate,
      int max_connections,
      List<String> allowed_updates}) async {
    var body = <String, dynamic>{};
    body['url'] = url;
    body['max_connections'] = (max_connections ?? '');
    body['allowed_updates'] =
        (allowed_updates == null ? '' : jsonEncode(allowed_updates));

    if (certificate != null) {
      var files = <http.MultipartFile>[];
      files.add(http.MultipartFile(
          'certificate', certificate.openRead(), certificate.lengthSync(),
          filename: 'Certificate-${DateTime.now()}'));
      return await _multipart_post('setWebhook', files, body);
    }

    return await _post('setWebhook', body);
  }

  /// Use this method to remove webhook integration
  /// if you decide to switch back to getUpdates.
  /// Returns True on success. Requires no parameters.
  ///
  /// https://core.telegram.org/bots/api#deletewebhook
  Future<bool> deleteWebhook() async {
    return await _get('deleteWebhook');
  }

  /// Use this method to get current webhook status.
  /// Requires no parameters.
  /// On success, returns a [WebhookInfo] object.
  /// If the bot is using [getUpdates],
  /// will return an object with the url field empty.
  ///
  /// https://core.telegram.org/bots/api#getwebhookinfo
  Future<WebhookInfo> getWebhookInfo() async {
    return WebhookInfo.fromJson(await _get('getWebhookInfo'));
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
      files.add(http.MultipartFile.fromBytes('photo', photo,
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
      files.add(http.MultipartFile.fromBytes('audio', audio,
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
      files.add(http.MultipartFile.fromBytes('thumb', thumb,
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
      files.add(http.MultipartFile.fromBytes('document', document,
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
      files.add(http.MultipartFile.fromBytes('thumb', thumb,
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
      files.add(http.MultipartFile.fromBytes('video', video,
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
      files.add(http.MultipartFile.fromBytes('thumb', thumb,
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
      files.add(http.MultipartFile.fromBytes('animation', animation,
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
      files.add(http.MultipartFile.fromBytes('thumb', thumb,
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
      files.add(http.MultipartFile.fromBytes('voice', voice,
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
      files.add(http.MultipartFile.fromBytes('video_note', video_note,
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
      files.add(http.MultipartFile.fromBytes('thumb', thumb,
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
      return Future.error(
          TelegramMethodException('At least inline_message_id is required. '
              'Can be used also chat_id and message_id.'));
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
      return Future.error(
          TelegramMethodException('At least inline_message_id is required. '
              'Can be used also chat_id and message_id.'));
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
  Future<bool> sendChatAction(int chat_id, ChatAction action) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['action'] = action;

    return await _post('sendChatAction', body);
  }

  /// Use this method to get a list of profile pictures for a user.
  /// Returns a [UserProfilePhotos] object.
  ///
  /// https://core.telegram.org/bots/api#getuserprofilephotos
  Future<UserProfilePhotos> getUserProfilePhotos(int user_id,
      {int offset, int limit}) async {
    var body = <String, dynamic>{};
    body['user_id'] = user_id;
    body['offset'] = (offset ?? '');
    body['limit'] = (limit ?? '');

    return UserProfilePhotos.fromJson(
        await _post('getUserProfilePhotos', body));
  }

  /// Use this method to get basic info about a file and prepare
  /// it for downloading.
  /// For the moment, bots can download files of up to 20MB in size.
  /// On success, a [File] object is returned.
  /// The file can then be downloaded via the link
  /// https://api.telegram.org/file/bot<token>/<file_path>,
  /// where <file_path> is taken from the response.
  /// It is guaranteed that the link will be valid for at least 1 hour.
  /// When the link expires,
  /// a new one can be requested by calling getFile again.
  ///
  /// Note: This function may not preserve the original file name and MIME type.
  /// You should save the file's MIME type and name (if available)
  /// when the File object is received.
  ///
  /// https://core.telegram.org/bots/api#getfile
  Future<File> getFile(String file_id,
      {String file_unique_id, int file_size, String file_path}) async {
    var body = <String, dynamic>{};
    body['file_id'] = file_id;
    body['file_unique_id'] = (file_unique_id ?? '');
    body['file_size'] = (file_size ?? '');
    body['file_path'] = (file_path ?? '');

    return File.fromJson(await _post('getFile', body));
  }

  /// Use this method to kick a user from a group, a supergroup or a channel.
  /// In the case of supergroups and channels,
  /// the user will not be able to return to the group on
  /// their own using invite links, etc., unless unbanned first.
  /// The bot must be an administrator in the chat for this to work
  /// and must have the appropriate admin rights. Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#kickchatmember
  Future<bool> kickChatMember(int chat_id, int user_id,
      {int until_date}) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['user_id'] = user_id;
    body['until_date'] = (until_date ?? '');

    return await _post('kickChatMember', body);
  }

  /// Use this method to unban a previously kicked user in a
  /// supergroup or channel. The user will not return to the group or channel
  /// automatically, but will be able to join via link, etc.
  /// The bot must be an administrator for this to work.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#unbanchatmember
  Future<bool> unbanChatMember(int chat_id, int user_id) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['user_id'] = user_id;

    return await _post('unbanChatMember', body);
  }

  /// Use this method to restrict a user in a supergroup.
  /// The bot must be an administrator in the supergroup for this
  /// to work and must have the appropriate admin rights.
  /// Pass True for all permissions to lift restrictions from a user.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#restrictchatmember
  Future<bool> restrictChatMember(int chat_id, int user_id,
      {ChatPermissions permissions, int until_date}) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['user_id'] = user_id;
    body['permissions'] = (permissions == null ? '' : jsonEncode(permissions));
    body['until_date'] = (until_date ?? '');

    return await _post('restrictChatMember', body);
  }

  /// Use this method to promote or demote a user in a supergroup or a channel.
  /// The bot must be an administrator in the chat for this to work and
  /// must have the appropriate admin rights.
  /// Pass False for all boolean parameters to demote a user.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#restrictchatmember
  Future<bool> promoteChatMember(int chat_id, int user_id,
      {bool can_change_info,
      bool can_post_messages,
      bool can_edit_messages,
      bool can_delete_messages,
      bool can_invite_users,
      bool can_restrict_members,
      bool can_pin_messages,
      bool can_promote_members}) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['user_id'] = user_id;
    body['can_change_info'] = (can_change_info ?? '');
    body['can_post_messages'] = (can_post_messages ?? '');
    body['can_edit_messages'] = (can_edit_messages ?? '');
    body['can_delete_messages'] = (can_delete_messages ?? '');
    body['can_invite_users'] = (can_invite_users ?? '');
    body['can_restrict_members'] = (can_restrict_members ?? '');
    body['can_pin_messages'] = (can_pin_messages ?? '');
    body['can_promote_members'] = (can_promote_members ?? '');

    return await _post('promoteChatMember', body);
  }

  /// Use this method to set a custom title for an administrator
  /// in a supergroup promoted by the bot.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#setchatadministratorcustomtitle
  Future<bool> setChatAdministratorCustomTitle(
      int chat_id, int user_id, String custom_title) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['user_id'] = user_id;
    body['custom_title'] = (custom_title ?? '');

    return await _post('setChatAdministratorCustomTitle', body);
  }

  /// Use this method to set default chat permissions for all members.
  /// The bot must be an administrator in the group or a supergroup
  /// for this to work and must have the can_restrict_members admin rights.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#setchatpermissions
  Future<bool> setChatPermissions(
      int chat_id, ChatPermissions permissions) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['permissions'] = permissions;

    return await _post('setChatPermissions', body);
  }

  /// Use this method to generate a new invite link for a chat;
  /// any previously generated link is revoked.
  /// The bot must be an administrator in the chat for this to work and must
  /// have the appropriate admin rights. Returns the new invite
  /// link as String on success.
  ///
  /// https://core.telegram.org/bots/api#setchatpermissions
  Future<bool> exportChatInviteLink(int chat_id) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;

    return await _post('exportChatInviteLink', body);
  }

  /// Use this method to set a new profile photo for the chat.
  /// Photos can't be changed for private chats.
  /// The bot must be an administrator in the chat
  /// for this to work and must have the appropriate admin rights.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#setchatphoto
  Future<bool> setChatPhoto(int chat_id, dynamic photo) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;

    var files = <http.MultipartFile>[];

    if (photo is io.File) {
      files.add(http.MultipartFile(
          'photo', photo.openRead(), photo.lengthSync(),
          filename: 'Photo-${DateTime.now()}'));
    } else if (photo is Uint8List) {
      files.add(http.MultipartFile.fromBytes('photo', photo,
          filename: 'Photo-${DateTime.now()}'));
    } else {
      return Future.error(
          TelegramMethodException('photo can only be io.File or blob.'));
    }

    return await _multipart_post('setChatPhoto', files, body);
  }

  /// Use this method to delete a chat photo.
  /// Photos can't be changed for private chats.
  /// The bot must be an administrator in the chat for this
  /// to work and must have the appropriate admin rights.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#deletechatphoto
  Future<bool> deleteChatPhoto(int chat_id) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;

    return await _post('deleteChatPhoto', body);
  }

  /// Use this method to change the title of a chat.
  /// Titles can't be changed for private chats.
  /// The bot must be an administrator in the chat
  /// for this to work and must have the appropriate admin rights.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#setchattitle
  Future<bool> setChatTitle(int chat_id, String title) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['title'] = title;

    return await _post('setChatTitle', body);
  }

  /// Use this method to change the description of a group,
  /// a supergroup or a channel.
  /// The bot must be an administrator in the chat
  /// for this to work and must have the appropriate admin rights.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#setchatdescription
  Future<bool> setChatDescription(int chat_id, {String description}) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['description'] = (description ?? '');

    return await _post('setChatDescription', body);
  }

  /// Use this method to pin a message in a group, a supergroup, or a channel.
  /// The bot must be an administrator in the chat for this to work and must
  /// have the ‘can_pin_messages’ admin right in the supergroup or
  /// ‘can_edit_messages’ admin right in the channel.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#pinchatmessage
  Future<bool> pinChatMessage(int chat_id, int message_id,
      {bool disable_notification}) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['message_id'] = message_id;
    body['disable_notification'] = (disable_notification ?? '');

    return await _post('pinChatMessage', body);
  }

  /// Use this method to unpin a message in a group, a supergroup, or a channel.
  /// The bot must be an administrator in the chat for this to
  /// work and must have the ‘can_pin_messages’ admin right in
  /// the supergroup or ‘can_edit_messages’ admin right in the channel.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#unpinchatmessage
  Future<bool> unpinChatMessage(int chat_id) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;

    return await _post('pinChatMessage', body);
  }

  /// Use this method for your bot to leave a group, supergroup or channel.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#leavechat
  Future<bool> leaveChat(int chat_id) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;

    return await _post('leaveChat', body);
  }

  /// Use this method to get up to date information about the chat
  /// (current name of the user for one-on-one conversations,
  /// current username of a user, group or channel, etc.).
  /// Returns a [Chat] object on success.
  ///
  /// https://core.telegram.org/bots/api#getchat
  Future<Chat> getChat(int chat_id) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;

    return Chat.fromJson(await _post('getChat', body));
  }

  /// Use this method to get a list of administrators in a chat.
  /// On success, returns an Array of [ChatMember] objects that
  /// contains information about all chat administrators except other bots.
  /// If the chat is a group or a supergroup and no administrators
  /// were appointed, only the creator will be returned.
  ///
  /// https://core.telegram.org/bots/api#getchatadministrators
  Future<List<ChatMember>> getChatAdministrators(int chat_id) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;

    return (await _post('getChatAdministrators', body))
        .map<ChatMember>((member) => ChatMember.fromJson(member))
        .toList();
  }

  /// Use this method to get the number of members in a chat.
  /// Returns Int on success.
  ///
  /// https://core.telegram.org/bots/api#getchatmemberscount
  Future<int> getChatMembersCount(int chat_id) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;

    return await _post('getChatMembersCount', body);
  }

  /// Use this method to get information about a member of a chat.
  /// Returns a [ChatMember] object on success.
  ///
  /// https://core.telegram.org/bots/api#getchatmember
  Future<ChatMember> getChatMember(int chat_id, int user_id) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['user_id'] = user_id;

    return ChatMember.fromJson(await _post('getChatMember', body));
  }

  /// Use this method to set a new group sticker set for a supergroup.
  /// The bot must be an administrator in the chat for this to work and
  /// must have the appropriate admin rights. Use the field can_set_sticker_set
  /// optionally returned in getChat requests to check
  /// if the bot can use this method.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#setchatstickerset
  Future<bool> setChatStickerSet(int chat_id, String sticker_set_name) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['sticker_set_name'] = sticker_set_name;

    return await _post('setChatStickerSet', body);
  }

  /// Use this method to delete a group sticker set from a supergroup.
  /// The bot must be an administrator in the chat for this to work
  /// and must have the appropriate admin rights.
  /// Use the field can_set_sticker_set optionally returned in getChat
  /// requests to check if the bot can use this method.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#deletechatstickerset
  Future<bool> deleteChatStickerSet(int chat_id) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;

    return await _post('deleteChatStickerSet', body);
  }

  /// Use this method to send answers to callback queries sent
  /// from inline keyboards.
  /// The answer will be displayed to the user as a notification
  /// at the top of the chat screen or as an alert.
  /// On success, True is returned.
  ///
  /// Alternatively, the user can be redirected to the specified Game URL.
  /// For this option to work, you must first create a game
  /// for your bot via @Botfather and accept the terms.
  /// Otherwise, you may use links like t.me/your_bot?start=XXXX
  /// that open your bot with a parameter.
  ///
  /// https://core.telegram.org/bots/api#answercallbackquery
  Future<bool> answerCallbackQuery(int callback_query_id,
      {String text, bool show_alert, String url, int cache_time}) async {
    var body = <String, dynamic>{};
    body['callback_query_id'] = callback_query_id;
    body['text'] = (text ?? '');
    body['show_alert'] = (show_alert ?? '');
    body['url'] = (url ?? '');
    body['cache_time'] = (cache_time ?? '');

    return await _post('answerCallbackQuery', body);
  }

  /// Use this method to edit text and game messages.
  /// On success, if edited message is sent by the bot,
  /// the edited [Message] is returned, otherwise True is returned.
  ///
  /// https://core.telegram.org/bots/api#editmessagetext
  Future<Message> editMessageText(String text,
      {int chat_id,
      int message_id,
      String inline_message_id,
      ParseMode parse_mode,
      bool disable_web_page_preview,
      InlineKeyboardMarkup reply_markup}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null)) {
      return Future.error(
          TelegramMethodException('At least inline_message_id is required. '
              'Can be used also chat_id and message_id.'));
    }

    var body = <String, dynamic>{};
    body['chat_id'] = (chat_id ?? '');
    body['message_id'] = (message_id ?? '');
    body['inline_message_id'] = (inline_message_id ?? '');
    body['text'] = text;
    body['parse_mode'] = (parse_mode ?? '');
    body['disable_web_page_preview'] = (disable_web_page_preview ?? '');
    body['reply_markup'] =
        (reply_markup == null ? '' : jsonEncode(reply_markup));

    var response = await _post('editMessageText', body);

    if (response == true) {
      return Future.error(
          TelegramMethodException('Edited message is not sent by the bot.'));
    }

    return Message.fromJson(response);
  }

  /// Use this method to edit captions of messages.
  /// On success, if edited message is sent by the bot,
  /// the edited [Message] is returned, otherwise True is returned.
  ///
  /// https://core.telegram.org/bots/api#editmessagecaption
  Future<Message> editMessageCaption(
      {int chat_id,
      int message_id,
      String inline_message_id,
      String caption,
      String parse_mode,
      InlineKeyboardMarkup reply_markup}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null)) {
      return Future.error(
          TelegramMethodException('At least inline_message_id is required. '
              'Can be used also chat_id and message_id.'));
    }

    var body = <String, dynamic>{};
    body['chat_id'] = (chat_id ?? '');
    body['message_id'] = (message_id ?? '');
    body['inline_message_id'] = (inline_message_id ?? '');
    body['caption'] = (caption ?? '');
    body['parse_mode'] = (parse_mode ?? '');
    body['reply_markup'] =
        (reply_markup == null ? '' : jsonEncode(reply_markup));

    var response = await _post('editMessageCaption', body);

    if (response == true) {
      return Future.error(
          TelegramMethodException('Edited message is not sent by the bot.'));
    }

    return Message.fromJson(response);
  }

  /// Use this method to edit animation, audio, document, photo,
  /// or video messages.
  /// If a message is a part of a message album,
  /// then it can be edited only to a photo or a video.
  /// Otherwise, message type can be changed arbitrarily.
  /// When inline message is edited, new file can't be uploaded.
  /// Use previously uploaded file via its file_id or specify a URL.
  /// On success, if the edited message was sent by the bot,
  /// the edited [Message] is returned, otherwise True is returned.
  ///
  /// https://core.telegram.org/bots/api#editmessagemedia
  Future editMessageMedia(
      {int chat_id,
      int message_id,
      String inline_message_id,
      InputMedia media,
      String parse_mode,
      InlineKeyboardMarkup reply_markup}) async {
    if (inline_message_id == null &&
        (chat_id == null || inline_message_id == null)) {
      return Future.error(
          TelegramMethodException('At least inline_message_id is required. '
              'Can be used also chat_id and message_id.'));
    }

    var body = <String, dynamic>{};
    body['chat_id'] = (chat_id ?? '');
    body['message_id'] = (message_id ?? '');
    body['inline_message_id'] = (inline_message_id ?? '');
    body['media'] = (media == null ? '' : jsonEncode(media));
    body['parse_mode'] = (parse_mode ?? '');
    body['reply_markup'] =
        (reply_markup == null ? '' : jsonEncode(reply_markup));

    var response = await _post('editMessageMedia', body);

    if (response == true) {
      return Future.error(
          TelegramMethodException('Edited message is not sent by the bot.'));
    }

    return Message.fromJson(response);
  }

  /// Use this method to edit only the reply markup of messages.
  /// On success, if edited message is sent by the bot,
  /// the edited [Message] is returned, otherwise True is returned.
  ///
  /// https://core.telegram.org/bots/api#editmessagereplymarkup
  Future<Message> editMessageReplyMarkup(
      {int chat_id,
      int message_id,
      String inline_message_id,
      InlineKeyboardMarkup reply_markup}) async {
    if (inline_message_id == null &&
        (chat_id == null || inline_message_id == null)) {
      return Future.error(
          TelegramMethodException('At least inline_message_id is required. '
              'Can be used also chat_id and message_id.'));
    }

    var body = <String, dynamic>{};
    body['chat_id'] = (chat_id ?? '');
    body['message_id'] = (message_id ?? '');
    body['inline_message_id'] = (inline_message_id ?? '');
    body['reply_markup'] =
        (reply_markup == null ? '' : jsonEncode(reply_markup));

    var response = await _post('editMessageMedia', body);

    if (response == true) {
      return Future.error(
          TelegramMethodException('Edited message is not sent by the bot.'));
    }

    return Message.fromJson(response);
  }

  /// Use this method to stop a poll which was sent by the bot.
  /// On success, the stopped [Poll] with the final results is returned.
  ///
  /// https://core.telegram.org/bots/api#stoppoll
  Future<Poll> stopPoll(int chat_id, int message_id,
      {InlineKeyboardMarkup reply_markup}) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['message_id'] = message_id;
    body['reply_markup'] =
        (reply_markup == null ? '' : jsonEncode(reply_markup));

    return Poll.fromJson(await _post('stopPoll', body));
  }

  /// Use this method to delete a message, including service messages,
  /// with the following limitations:
  /// - A message can only be deleted if it was sent less than 48 hours ago.
  /// - Bots can delete outgoing messages in private chats, groups,
  /// and supergroups.
  /// - Bots can delete incoming messages in private chats.
  /// - Bots granted can_post_messages permissions can delete outgoing
  /// messages in channels.
  /// - If the bot is an administrator of a group, it can delete any
  /// message there.
  /// - If the bot has can_delete_messages permission in a supergroup or a
  /// channel, it can delete any message there.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#deletemessage
  Future<bool> deleteMessage(int chat_id, int message_id) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['message_id'] = message_id;

    return await _post('deleteMessage', body);
  }

  /// Use this method to send static .WEBP or animated .TGS stickers.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendsticker
  Future<Message> sendSticker(int chat_id, dynamic sticker,
      {bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['disable_notification'] = (disable_notification ?? '');
    body['reply_to_message_id'] = (reply_to_message_id ?? '');
    body['reply_markup'] =
        (reply_markup == null ? '' : jsonEncode(reply_markup));

    if (sticker is String) {
      body['sticker'] = sticker;
      return Message.fromJson(await _post('sendSticker', body));
    } else if (sticker is io.File) {
      var files = <http.MultipartFile>[];
      files.add(http.MultipartFile(
          'sticker', sticker.openRead(), sticker.lengthSync(),
          filename: 'Sticker-${DateTime.now()}'));
      return Message.fromJson(
          await _multipart_post('sendSticker', files, body));
    } else {
      return Future.error(TelegramMethodException('Photo can only be io.File, '
          'Telegram file_id in String or a URL.'));
    }
  }

  /// Use this method to get a sticker set.
  /// On success, a StickerSet object is returned.
  ///
  /// https://core.telegram.org/bots/api#sendsticker
  Future<StickerSet> getStickerSet(String name) async {
    var body = <String, dynamic>{};
    body['name'] = name;

    return StickerSet.fromJson(await _post('getStickerSet', body));
  }

  /// Use this method to upload a .png file with a sticker
  /// for later use in createNewStickerSet and addStickerToSet
  /// methods (can be used multiple times).
  /// Returns the uploaded [File] on success.
  ///
  /// https://core.telegram.org/bots/api#uploadstickerfile
  Future<File> uploadStickerFile(int user_id, dynamic png_sticker) async {
    var body = <String, dynamic>{};
    body['user_id'] = user_id;

    if (png_sticker is io.File) {
      var files = <http.MultipartFile>[];
      files.add(http.MultipartFile(
          'png_sticker', png_sticker.openRead(), png_sticker.lengthSync(),
          filename: 'Png_Sticker-${DateTime.now()}'));
      return File.fromJson(
          await _multipart_post('uploadStickerFile', files, body));
    } else if (png_sticker is Uint8List) {
      var files = <http.MultipartFile>[];
      files.add(http.MultipartFile.fromBytes('png_sticker', png_sticker,
          filename: 'Png_Sticker-${DateTime.now()}'));
      return File.fromJson(
          await _multipart_post('uploadStickerFile', files, body));
    } else {
      return Future.error(
          TelegramMethodException('Png_Sticker can only be io.File, blob, '
              'Telegram file_id in String or a URL.'));
    }
  }

  /// Use this method to create new sticker set owned by a user.
  /// The bot will be able to edit the created sticker set.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#createnewstickerset
  Future<bool> createNewStickerSet(int user_id, String name, String title,
      dynamic png_sticker, String emojis,
      {bool contains_masks, MaskPosition mask_position}) async {
    var _me = await getMe();

    var body = <String, dynamic>{};
    body['user_id'] = user_id;
    body['name'] = '${name}_@${_me.username}';
    body['title'] = title;
    body['emojis'] = emojis;
    body['contains_mask'] = (contains_masks ?? '');
    body['mask_position'] =
        (mask_position == null ? '' : jsonEncode(mask_position));

    if (png_sticker is String) {
      body['png_sticker'] = png_sticker;
      return await _post('createNewStickerSet', body);
    } else if (png_sticker is io.File) {
      var files = <http.MultipartFile>[];
      files.add(http.MultipartFile(
          'png_sticker', png_sticker.openRead(), png_sticker.lengthSync(),
          filename: 'Png_Sticker-${DateTime.now()}'));
      return await _multipart_post('createNewStickerSet', files, body);
    } else if (png_sticker is Uint8List) {
      var files = <http.MultipartFile>[];
      files.add(http.MultipartFile.fromBytes('png_sticker', png_sticker,
          filename: 'Png_Sticker-${DateTime.now()}'));
      return await _multipart_post('createNewStickerSet', files, body);
    } else {
      return Future.error(
          TelegramMethodException('Png_Sticker can only be io.File, blob, '
              'Telegram file_id in String or a URL.'));
    }
  }

  /// Use this method to add a new sticker to a set created by the bot.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#addstickertoset
  Future<bool> addStickerToSet(
      int user_id, String name, dynamic png_sticker, String emojis,
      {MaskPosition mask_position}) async {
    var body = <String, dynamic>{};
    body['user_id'] = user_id;
    body['name'] = name;
    body['emojis'] = emojis;
    body['mask_position'] =
        (mask_position == null ? '' : jsonEncode(mask_position));

    if (png_sticker is String) {
      body['png_sticker'] = png_sticker;
      return await _post('addStickerToSet', body);
    } else if (png_sticker is io.File) {
      var files = <http.MultipartFile>[];
      files.add(http.MultipartFile(
          'png_sticker', png_sticker.openRead(), png_sticker.lengthSync(),
          filename: 'Png_Sticker-${DateTime.now()}'));
      return await _multipart_post('createNewStickerSet', files, body);
    } else if (png_sticker is Uint8List) {
      var files = <http.MultipartFile>[];
      files.add(http.MultipartFile.fromBytes('png_sticker', png_sticker,
          filename: 'Png_Sticker-${DateTime.now()}'));
      return await _multipart_post('createNewStickerSet', files, body);
    } else {
      return Future.error(
          TelegramMethodException('Png_Sticker can only be io.File, blob, '
              'Telegram file_id in String or a URL.'));
    }
  }

  /// Use this method to move a sticker in a set created
  /// by the bot to a specific position.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#setstickerpositioninset
  Future<bool> setStickerPositionInSet(String sticker, int position) async {
    var body = <String, dynamic>{};
    body['sticker'] = sticker;
    body['position'] = position;

    return await _post('setStickerPositionInSet', body);
  }

  /// Use this method to delete a sticker from a set created by the bot.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#deletestickerfromset
  Future<bool> deleteStickerFromSet(String sticker) async {
    var body = <String, dynamic>{};
    body['sticker'] = sticker;

    return await _post('deleteStickerFromSet', body);
  }

  /// Use this method to send answers to an inline query.
  /// On success, True is returned.
  ///
  /// No more than 50 results per query are allowed.
  ///
  /// https://core.telegram.org/bots/api#answerinlinequery
  Future<bool> answerInlineQuery(
      String inline_query_id, List<InlineQueryResult> results,
      {int cache_time,
      bool is_personal,
      String next_offset,
      String switch_pm_text,
      String switch_pm_parameter}) async {
    var body = <String, dynamic>{};
    body['inline_query_id'] = inline_query_id;
    body['results'] = jsonEncode(results);
    body['cache_time'] = (cache_time ?? '');
    body['is_personal'] = (is_personal ?? '');
    body['next_offset'] = (next_offset ?? '');
    body['switch_pm_text'] = (switch_pm_text);
    body['switch_pm_parameter'](switch_pm_parameter ?? '');

    return await _post('answerInlineQuery', body);
  }

  /// Use this method to send invoices.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendinvoice
  Future<Message> sendInvoice(
      int chat_id,
      String title,
      String description,
      String payload,
      String provider_token,
      String start_parameter,
      String currency,
      List<LabeledPrice> prices,
      {String provider_data,
      String photo_url,
      int photo_size,
      int photo_width,
      int photo_height,
      bool need_name,
      bool need_phone_number,
      bool need_email,
      bool need_shipping_address,
      bool send_phone_number_to_provider,
      bool send_email_to_provider,
      bool is_flexible,
      bool disable_notification,
      int reply_to_message_id,
      InlineKeyboardMarkup reply_markup}) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['title'] = title;
    body['description'] = description;
    body['payload'] = payload;
    body['provider_token'] = provider_token;
    body['start_parameter'] = start_parameter;
    body['currency'] = currency;
    body['prices'] = jsonEncode(prices);
    body['provider_data'] = (provider_data ?? '');
    body['photo_url'] = (photo_url ?? '');
    body['photo_size'] = (photo_size ?? '');
    body['photo_width'] = (photo_width ?? '');
    body['photo_height'] = (photo_height ?? '');
    body['need_name'] = (need_name ?? '');
    body['need_phone_number'] = (need_phone_number ?? '');
    body['need_email'] = (need_email ?? '');
    body['need_shipping_address'] = (need_shipping_address ?? '');
    body['send_phone_number_to_provider'] =
        (send_phone_number_to_provider ?? '');
    body['send_email_to_provider'] = (send_email_to_provider ?? '');
    body['is_flexible'] = (is_flexible ?? '');
    body['disable_notification'] = (disable_notification ?? '');
    body['reply_to_message_id'] = (reply_to_message_id ?? '');
    body['reply_markup'] =
        (reply_markup == null ? '' : jsonEncode(reply_markup));

    return Message.fromJson(await _post('sendInvoice', body));
  }

  /// If you sent an invoice requesting a shipping address
  /// and the parameter is_flexible was specified,
  /// the Bot API will send an Update with a shipping_query
  /// field to the bot.
  /// Use this method to reply to shipping queries.
  /// On success, True is returned.
  ///
  /// https://core.telegram.org/bots/api#answershippingquery
  Future<bool> answerShippingQuery(String shipping_query_id, bool possible,
      {List<ShippingOption> shipping_options, String error_message}) async {
    if (!possible && (shipping_options == null || error_message == null)) {
      return Future.error(
          'If it\'s not possible, shipping_options and error_message can not be null.');
    }

    var body = <String, dynamic>{};
    body['shipping_query_id'] = shipping_query_id;
    body['ok'] = possible;
    body['shipping_options'] =
        (shipping_options == null ? '' : jsonEncode(shipping_options));
    body['error_message'] = error_message;

    return await _post('answerShippingQuery', body);
  }

  /// Once the user has confirmed their payment and shipping details,
  /// the Bot API sends the final confirmation in the form of
  /// an [Update] with the field pre_checkout_query.
  /// Use this method to respond to such pre-checkout queries.
  /// On success, True is returned.
  ///
  /// Note: The Bot API must receive an answer within 10 seconds
  /// after the pre-checkout query was sent.
  ///
  /// https://core.telegram.org/bots/api#answerprecheckoutquery
  Future<bool> answerPreCheckoutQuery(String pre_checkout_query_id, bool ok,
      {String error_message}) async {
    if (!ok && error_message == null) {
      return Future.error(
          'If it\'s not possible, error_message can not be null.');
    }

    var body = <String, dynamic>{};
    body['pre_checkout_query_id'] = pre_checkout_query_id;
    body['ok'] = ok;
    body['error_message'] = (error_message ?? '');

    return await _post('answerPreCheckoutQuery', body);
  }

  /// Informs a user that some of the Telegram Passport elements
  /// they provided contains errors.
  /// The user will not be able to re-submit their Passport
  /// to you until the errors are fixed
  /// (the contents of the field for which you returned the error
  /// must change).
  /// Returns True on success.
  ///
  /// Use this if the data submitted by the user doesn't
  /// satisfy the standards your service requires for any reason.
  /// For example, if a birthday date seems invalid,
  /// a submitted document is blurry,
  /// a scan shows evidence of tampering, etc.
  /// Supply some details in the error message to make sure
  /// the user knows how to correct the issues.
  ///
  /// https://core.telegram.org/bots/api#setpassportdataerrors
  Future<bool> setPassportDataErrors(
      int user_id, List<PassportElementError> errors) async {
    var body = <String, dynamic>{};
    body['user_id'] = user_id;
    body['errors'] = jsonEncode(errors);

    return await _post('setPassportDataErrors', body);
  }

  /// Use this method to send a game.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendgame
  Future<Message> sendGame(int chat_id, String game_short_name,
      {bool disable_notification,
      int reply_to_message_id,
      InlineKeyboardMarkup reply_markup}) async {
    var body = <String, dynamic>{};
    body['chat_id'] = chat_id;
    body['game_short_name'] = game_short_name;
    body['disable_notification'] = (disable_notification ?? '');
    body['reply_to_message_id'] = (reply_to_message_id ?? '');
    body['reply_markup'] =
        (reply_markup == null ? '' : jsonEncode(reply_markup));

    return Message.fromJson(await _post('sendGame', body));
  }

  /// Use this method to set the score of the specified user in a game.
  /// On success, if the message was sent by the bot,
  /// returns the edited [Message], otherwise returns True.
  /// Returns an error, if the new score is not greater than the
  /// user's current score in the chat and force is False.
  ///
  /// https://core.telegram.org/bots/api#setgamescore
  Future<Message> setGameScore(int user_id, int score,
      {bool force,
      bool disable_edit_message,
      int chat_id,
      int message_id,
      String inline_message_id}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null)) {
      return Future.error(
          TelegramMethodException('At least inline_message_id is required. '
              'Can be used also chat_id and message_id.'));
    }

    var body = <String, dynamic>{};
    body['user_id'] = user_id;
    body['score'] = score;
    body['force'] = (force ?? '');
    body['disable_edit_message'] = (disable_edit_message ?? '');
    body['chat_id'] = (chat_id ?? '');
    body['message_id'] = (message_id ?? '');
    body['inline_message_id'] = (inline_message_id ?? '');

    return Message.fromJson(await _post('setGameScore', body));
  }

  /// Use this method to get data for high score tables.
  /// Will return the score of the specified user and several
  /// of his neighbors in a game. On success, returns an
  /// Array of [GameHighScore] objects.
  ///
  /// https://core.telegram.org/bots/api#getgamehighscores
  Future<List<GameHighScore>> getGameHighScores(int user_id,
      {int chat_id, int message_id, String inline_message_id}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null)) {
      return Future.error(
          TelegramMethodException('At least inline_message_id is required. '
              'Can be used also chat_id and message_id.'));
    }

    var body = <String, dynamic>{};
    body['user_id'] = user_id;
    body['chat_id'] = (chat_id ?? '');
    body['message_id'] = (message_id ?? '');
    body['inline_message_id'] = (inline_message_id ?? '');

    return (await _post('getGameHighScores', body))
        .map<GameHighScore>(
            (gameHighScore) => GameHighScore.fromJson(gameHighScore))
        .toList();
  }
}
