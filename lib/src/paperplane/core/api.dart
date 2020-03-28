/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'dart:convert';
import 'dart:io' as io;

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:paperplane/helpers.dart';
import 'package:paperplane/paperplane_exceptions.dart';
import 'package:paperplane/telegram.dart';
import 'package:paperplane/telegram_client.dart';

/// You can find all Telegram API methods.
class API {
  final TelegramClient _client;

  API(this._client);

  /// Use this method to receive incoming updates using long polling.
  /// An Array of [Update] objects is returned.
  ///
  /// https://core.telegram.org/bots/api#getupdates.
  Future<List<Update>> getUpdates(
      {int offset,
      int limit,
      int timeout,
      List<UpdateType> allowed_updates}) async {
    final parameters = <String, dynamic>{
      'offset': offset,
      'limit': limit,
      'timeout': timeout,
      'allowed_updates': jsonEncode(allowed_updates)
    };

    return (await _client.get(method: 'getUpdates', parameters: parameters))
        .map<Update>((update) => Update.fromJson(update))
        .toList();
  }

  /// Returns all bot info as a [User] object.
  ///
  /// https://core.telegram.org/bots/api#getMe
  Future<User> getMe() async {
    return User.fromJson(await _client.get(method: 'getMe'));
  }

  /// Returns all bot info as a [Bot] object.
  ///
  /// https://core.telegram.org/bots/api#getMe
  Future<Bot> getBot() async {
    return Bot.fromJson(await _client.get(method: 'getMe'));
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
  Future<bool> setWebhook(
      {@required String url,
      io.File certificate,
      int max_connections,
      List<String> allowed_updates}) async {
    final form_data = FormData.fromMap({
      'url': url,
      'max_connections': max_connections,
      'allowed_updates': jsonEncode(allowed_updates)
    });

    if (certificate != null) {
      form_data.files.add(MapEntry(
          'certificate',
          MultipartFile.fromBytes(certificate.readAsBytesSync(),
              filename: 'certificate${DateTime.now().toIso8601String()}')));
    }

    return await _client.post(method: 'setWebhook', form_data: form_data);
  }

  /// Use this method to remove webhook integration
  /// if you decide to switch back to getUpdates.
  /// Returns True on success. Requires no parameters.
  ///
  /// https://core.telegram.org/bots/api#deletewebhook
  Future<bool> deleteWebhook() async {
    return await _client.get(method: 'deleteWebhook');
  }

  /// Use this method to get current webhook status.
  /// Requires no parameters.
  /// On success, returns a [WebhookInfo] object.
  /// If the bot is using [getUpdates],
  /// will return an object with the url field empty.
  ///
  /// https://core.telegram.org/bots/api#getwebhookinfo
  Future<WebhookInfo> getWebhookInfo() async {
    return WebhookInfo.fromJson(await _client.get(method: 'getWebhookInfo'));
  }

  /// Use this method to send text messages.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendmessage
  Future<Message> sendMessage(
      {@required dynamic chat_id,
      @required String text,
      ParseMode parse_mode,
      bool disable_web_page_preview,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'text': text,
      'parse_mode': parse_mode?.getMode(),
      'disable_web_page_preview': disable_web_page_preview,
      'disable_notification': disable_notification,
      'reply_to_message_id': reply_to_message_id,
      'reply_markup': jsonEncode(reply_markup)
    });
    return Message.fromJson(
        await _client.post(method: 'sendMessage', form_data: form_data));
  }

  /// Use this method to forward messages of any kind.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#forwardmessage
  Future<Message> forwardMessage(
      {@required dynamic chat_id,
      @required dynamic from_chat_id,
      bool disable_notification,
      @required int message_id}) async {
    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'from_chat_id': from_chat_id,
      'disable_notification': disable_notification,
      'message_id': message_id,
    });

    return Message.fromJson(
        await _client.post(method: 'forwardMessage', form_data: form_data));
  }

  /// Use this method to send photos.
  /// On success, the sent [Message] is returned.
  ///
  /// [photo] argument accepts [Luggage] object.
  ///
  /// https://core.telegram.org/bots/api#sendphoto
  Future<Message> sendPhoto(
      {@required dynamic chat_id,
      @required Luggage photo,
      String caption,
      ParseMode parse_mode,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'caption': caption,
      'parse_mode': parse_mode?.getMode(),
      'disable_notification': disable_notification,
      'reply_to_message_id': reply_to_message_id,
      'reply_markup': jsonEncode(reply_markup)
    });

    // Check if Photo is a String/URL or an Picture io.File.
    switch (photo.type) {
      case 'link':
      case 'file_id':
        form_data.fields.add(MapEntry('photo', photo.toString()));
        break;
      case 'file':
      case 'bytes':
        form_data.files.add(MapEntry<String, MultipartFile>(
            'photo',
            MultipartFile.fromBytes(photo.getBytes(),
                filename: photo.getName(type: 'photo'))));
        break;
    }
    return Message.fromJson(
        await _client.post(method: 'sendPhoto', form_data: form_data));
  }

  /// Use this method to send audio files,
  /// if you want Telegram clients to display them in the music player.
  /// Your audio must be in the .MP3 or .M4A format.
  /// On success, the sent [Message] is returned.
  /// Bots can currently send audio files of up to 50 MB in size,
  /// this limit may be changed in the future.
  /// For sending voice messages, use the [sendVoice] method instead.
  ///
  /// [audio] argument accepts [Luggage] object.
  /// [thumb] argument accepts [Luggage] object.
  ///
  /// https://core.telegram.org/bots/api#sendaudio
  Future<Message> sendAudio(
      {@required dynamic chat_id,
      @required Luggage audio,
      String caption,
      ParseMode parse_mode,
      Duration duration,
      String performer,
      String title,
      Luggage thumb,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'caption': caption,
      'parse_mode': parse_mode?.getMode(),
      'duration': duration?.inSeconds,
      'performer': performer,
      'title': title,
      'disable_notification': disable_notification,
      'reply_to_message_id': reply_to_message_id,
      'reply_markup': jsonEncode(reply_markup)
    });

    // Check if audio is a File (or Blob) or a String
    // Creating an empty list of http.MultipartFile
    switch (audio.type) {
      case 'link':
      case 'file_id':
        form_data.fields.add(MapEntry('audio', audio.toString()));
        break;
      case 'file':
      case 'bytes':
        form_data.files.add(MapEntry<String, MultipartFile>(
            'audio',
            MultipartFile.fromBytes(audio.getBytes(),
                filename: audio.getName(type: 'audio'))));
        break;
    }

    if (thumb != null) {
      switch (thumb.type) {
        case 'link':
        case 'file_id':
          return Future.error(ApiException(
              description: "Thumbnails can't be reused "
                  'and can be only uploaded as a new file.'));
          break;
        case 'file':
        case 'bytes':
          form_data.files.add(MapEntry<String, MultipartFile>(
              'thumb',
              MultipartFile.fromBytes(thumb.getBytes(),
                  filename: thumb.getName())));
          break;
      }
    }

    return Message.fromJson(
        await _client.post(method: 'sendAudio', form_data: form_data));
  }

  /// Use this method to send general files.
  /// On success, the sent [Message] is returned.
  /// Bots can currently send files of any type of
  /// up to 50 MB in size, this limit may be changed in the future.
  ///
  /// [document] argument accepts [Luggage] object.
  /// [thumb] argument accepts [Luggage] object.
  ///
  /// https://core.telegram.org/bots/api#senddocument
  Future<Message> sendDocument(
      {@required dynamic chat_id,
      @required Luggage document,
      Luggage thumb,
      String caption,
      ParseMode parse_mode,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'caption': caption,
      'parse_mode': parse_mode?.getMode(),
      'disable_notification': disable_notification,
      'reply_to_message_id': reply_to_message_id,
      'reply_markup': jsonEncode(reply_markup)
    });

    switch (document.type) {
      case 'link':
      case 'file_id':
        form_data.fields.add(MapEntry('document', document.toString()));
        break;
      case 'file':
      case 'bytes':
        form_data.files.add(MapEntry<String, MultipartFile>(
            'document',
            MultipartFile.fromBytes(document.getBytes(),
                filename: document.getName(type: 'document'))));
        break;
    }

    if (thumb != null) {
      switch (thumb.type) {
        case 'link':
        case 'file_id':
          return Future.error(ApiException(
              description: "Thumbnails can't be reused "
                  'and can be only uploaded as a new file.'));
          break;
        case 'file':
        case 'bytes':
          form_data.files.add(MapEntry<String, MultipartFile>(
              'thumb',
              MultipartFile.fromBytes(thumb.getBytes(),
                  filename: thumb.getName())));
          break;
      }
    }

    return Message.fromJson(
        await _client.post(method: 'sendDocument', form_data: form_data));
  }

  /// Use this method to send video files,
  /// Telegram clients support mp4 videos
  /// (other formats may be sent as Document).
  /// On success, the sent [Message] is returned.
  /// Bots can currently send video files of up to 50 MB in size,
  /// this limit may be changed in the future.
  ///
  /// [video] argument accepts [Luggage] object.
  /// [thumb] argument accepts [Luggage] object.
  ///
  /// https://core.telegram.org/bots/api#sendvideo
  Future<Message> sendVideo(
      {@required dynamic chat_id,
      @required Luggage video,
      Duration duration,
      int width,
      int height,
      Luggage thumb,
      String caption,
      ParseMode parse_mode,
      bool supports_streaming,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'duration': duration?.inSeconds,
      'width': width,
      'height': height,
      'caption': caption,
      'parse_mode': parse_mode?.getMode(),
      'supports_streaming': supports_streaming,
      'disable_notification': disable_notification,
      'reply_to_message_id': reply_to_message_id,
      'reply_markup': jsonEncode(reply_markup)
    });

    switch (video.type) {
      case 'link':
      case 'file_id':
        form_data.fields.add(MapEntry('video', video.toString()));
        break;
      case 'file':
      case 'bytes':
        form_data.files.add(MapEntry<String, MultipartFile>(
            'video',
            MultipartFile.fromBytes(video.getBytes(),
                filename: video.getName(type: 'video'))));
        break;
    }

    if (thumb != null) {
      switch (thumb.type) {
        case 'link':
        case 'file_id':
          return Future.error(ApiException(
              description: "Thumbnails can't be reused "
                  'and can be only uploaded as a new file.'));
          break;
        case 'file':
        case 'bytes':
          form_data.files.add(MapEntry<String, MultipartFile>(
              'thumb',
              MultipartFile.fromBytes(thumb.getBytes(),
                  filename: thumb.getName())));
          break;
      }
    }

    return Message.fromJson(
        await _client.post(method: 'sendVideo', form_data: form_data));
  }

  /// Use this method to send animation files
  /// (GIF or H.264/MPEG-4 AVC video without sound).
  /// On success, the sent [Message] is returned.
  /// Bots can currently send animation files of up to 50 MB in size,
  /// this limit may be changed in the future.
  ///
  /// [animation] argument accepts [Luggage] object.
  /// [thumb] argument accepts [Luggage] object.
  ///
  /// https://core.telegram.org/bots/api#sendanimation
  Future<Message> sendAnimation(
      {@required dynamic chat_id,
      @required Luggage animation,
      Duration duration,
      int width,
      int height,
      Luggage thumb,
      String caption,
      ParseMode parse_mode,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'duration': duration?.inSeconds,
      'width': width,
      'height': height,
      'caption': caption,
      'parse_mode': parse_mode?.getMode(),
      'disable_notification': disable_notification,
      'reply_to_message_id': reply_to_message_id,
      'reply_markup': jsonEncode(reply_markup)
    });

    switch (animation.type) {
      case 'link':
      case 'file_id':
        form_data.fields.add(MapEntry('animation', animation.toString()));
        break;
      case 'file':
      case 'bytes':
        form_data.files.add(MapEntry<String, MultipartFile>(
            'video',
            MultipartFile.fromBytes(animation.getBytes(),
                filename: animation.getName(type: 'animation'))));
        break;
    }

    if (thumb != null) {
      switch (thumb.type) {
        case 'link':
        case 'file_id':
          return Future.error(ApiException(
              description: "Thumbnails can't be reused "
                  'and can be only uploaded as a new file.'));
          break;
        case 'file':
        case 'bytes':
          form_data.files.add(MapEntry<String, MultipartFile>(
              'thumb',
              MultipartFile.fromBytes(thumb.getBytes(),
                  filename: thumb.getName())));
          break;
      }
    }

    return Message.fromJson(
        await _client.post(method: 'sendAnimation', form_data: form_data));
  }

  /// Use this method to send audio files,
  /// if you want Telegram clients to display
  /// the file as a playable voice message.
  /// For this to work, your audio must be in an .ogg file encoded with OPUS
  /// (other formats may be sent as Audio or Document).
  /// On success, the sent [Message] is returned.
  /// Bots can currently send voice messages of up to 50 MB in size,
  /// this limit may be changed in the future.
  ///
  /// [voice] argument accepts [Luggage] object.
  ///
  /// https://core.telegram.org/bots/api#sendvoice
  Future<Message> sendVoice(
      {@required dynamic chat_id,
      @required Luggage voice,
      String caption,
      ParseMode parse_mode,
      Duration duration,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'caption': caption,
      'parse_mode': parse_mode?.getMode(),
      'duration': duration?.inSeconds,
      'disable_notification': disable_notification,
      'reply_to_message_id': reply_to_message_id,
      'reply_markup': jsonEncode(reply_markup)
    });

    switch (voice.type) {
      case 'link':
      case 'file_id':
        form_data.fields.add(MapEntry('voice', voice.toString()));
        break;
      case 'file':
      case 'bytes':
        form_data.files.add(MapEntry<String, MultipartFile>(
            'video',
            MultipartFile.fromBytes(voice.getBytes(),
                filename: voice.getName(type: 'voice'))));
        break;
    }

    return Message.fromJson(
        await _client.post(method: 'sendVoice', form_data: form_data));
  }

  /// As of v.4.0,
  /// Telegram clients support rounded square mp4 videos of up to 1 minute long.
  /// Use this method to send video messages.
  /// On success, the sent [Message] is returned.
  ///
  /// [video_note] argument accepts [Luggage] object.
  /// [thumb] argument accepts [Luggage] object.
  ///
  /// https://core.telegram.org/bots/api#sendvoice
  Future<Message> sendVideoNote(
      {@required dynamic chat_id,
      @required Luggage video_note,
      Duration duration,
      int length,
      Luggage thumb,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'duration': duration?.inSeconds,
      'lenght': length,
      'disable_notification': disable_notification,
      'reply_to_message_id': reply_to_message_id,
      'reply_markup': jsonEncode(reply_markup)
    });

    switch (video_note.type) {
      case 'link':
      case 'file_id':
        form_data.fields.add(MapEntry('video_note', video_note.toString()));
        break;
      case 'file':
      case 'bytes':
        form_data.files.add(MapEntry<String, MultipartFile>(
            'video',
            MultipartFile.fromBytes(video_note.getBytes(),
                filename: video_note.getName(type: 'video_note'))));
        break;
    }

    if (thumb != null) {
      switch (thumb.type) {
        case 'link':
        case 'file_id':
          return Future.error(ApiException(
              description: "Thumbnails can't be reused "
                  'and can be only uploaded as a new file.'));
          break;
        case 'file':
        case 'bytes':
          form_data.files.add(MapEntry<String, MultipartFile>(
              'thumb',
              MultipartFile.fromBytes(thumb.getBytes(),
                  filename: thumb.getName())));
          break;
      }
    }

    return Message.fromJson(
        await _client.post(method: 'sendVideoNote', form_data: form_data));
  }

  /// Use this method to send a group of photos or videos as an album.
  /// On success, an array of the sent [Messages] is returned.
  /// [media] is a List of [InputMediaPhoto] and/or [InputMediaVideo],
  /// but needs to be contained in a [InputMediaLuggage] object.
  ///
  /// [Messages]: [message]
  ///
  /// https://core.telegram.org/bots/api#sendmediagroup
  Future<List<Message>> sendMediaGroup(
      {@required dynamic chat_id,
      @required List<InputMediaLuggage> media,
      bool disable_notification,
      int reply_to_message_id}) async {
    if (media.length < 2) {
      return Future.error(ApiException(
          description: 'The media list has to contain at least 2 InputMedia.'));
    }

    if (media.length > 10) {
      return Future.error(ApiException(
          description:
              'The media list can not be longer than 10 InputMedia objects.'));
    }

    final media_to_send = [];
    final media_file_to_send = <MapEntry<String, MultipartFile>>[];

    for (var input_media_luggage in media) {
      print(input_media_luggage.type);
      if (input_media_luggage.type != 'photo' &&
          input_media_luggage.type != 'video') {
        return Future.error(ApiException(
            description: 'sendMediaGroup only supports photo and video.'));
      } else {
        media_to_send.add(input_media_luggage.media);

        if (input_media_luggage.file != null) {
          media_file_to_send.add(input_media_luggage.file);
        }

        if (input_media_luggage.thumb != null) {
          media_file_to_send.add(input_media_luggage.thumb);
        }
      }
    }

    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'media': jsonEncode(media_to_send),
      'disable_notification': disable_notification,
      'reply_to_message_id': reply_to_message_id
    });

    form_data.files.addAll(media_file_to_send);

    return (await _client.post(method: 'sendMediaGroup', form_data: form_data))
        .map<Message>((message) => Message.fromJson(message))
        .toList();
  }

  /// Use this method to send point on the map.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendlocation
  Future<Message> sendLocation(
      {@required dynamic chat_id,
      @required double latitude,
      @required double longitude,
      int live_period,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'latitude': latitude,
      'longitude': longitude,
      'live_period': live_period,
      'disable_notification': disable_notification,
      'reply_to_message_id': reply_to_message_id,
      'reply_markup': jsonEncode(reply_markup)
    });

    return Message.fromJson(
        await _client.post(method: 'sendLocation', form_data: form_data));
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
  Future<Message> editMessageLiveLocation(
      {dynamic chat_id,
      int message_id,
      String inline_message_id,
      @required double latitude,
      @required double longitude,
      InlineKeyboardMarkup reply_markup}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null)) {
      return Future.error(ApiException(
          description: 'At least inline_message_id is required. '
              'Can be used also chat_id and message_id.'));
    }

    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'message_id': message_id,
      'latitude': latitude,
      'longitude': longitude,
      'reply_markup': jsonEncode(reply_markup)
    });

    return Message.fromJson(await _client.post(
        method: 'editMessageLiveLocation', form_data: form_data));
  }

  /// Use this method to stop updating a live location message
  /// before live_period expires.
  /// On success, if the message was sent by the bot,
  /// the sent [Message] is returned, otherwise True is returned.
  ///
  /// https://core.telegram.org/bots/api#stopmessagelivelocation
  Future<Message> stopMessageLiveLocation(
      {dynamic chat_id,
      int message_id,
      String inline_message_id,
      ReplyMarkup reply_markup}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null)) {
      return Future.error(ApiException(
          description: 'At least inline_message_id is required. '
              'Can be used also chat_id and message_id.'));
    }

    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'message_id': message_id,
      'inline_message_id': inline_message_id,
      'reply_markup': jsonEncode(reply_markup)
    });

    return Message.fromJson(await _client.post(
        method: 'stopMessageLiveLocation', form_data: form_data));
  }

  /// Use this method to send information about a venue.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendvenue
  Future<Message> sendVenue(
      {@required dynamic chat_id,
      @required double latitude,
      @required double longitude,
      @required String title,
      @required String address,
      String foursquare_id,
      String foursquare_type,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'latitude': latitude,
      'longitude': longitude,
      'title': title,
      'address': address,
      'foursquare_id': foursquare_id,
      'foursquare_type': foursquare_type,
      'disable_notification': disable_notification,
      'reply_to_message_id': reply_to_message_id,
      'reply_markup': reply_markup
    });

    return Message.fromJson(
        await _client.post(method: 'sendVenue', form_data: form_data));
  }

  /// Use this method to send phone contacts.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendcontact
  Future<Message> sendContact(
      {@required dynamic chat_id,
      @required String phone_number,
      @required String first_name,
      String last_name,
      String vcard,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'phone_number': phone_number,
      'first_name': first_name,
      'last_name': last_name,
      'vcard': vcard,
      'disable_notification': disable_notification,
      'reply_to_message_id': reply_to_message_id,
      'reply_markup': jsonEncode(reply_markup)
    });

    return Message.fromJson(
        await _client.post(method: 'sendContact', form_data: form_data));
  }

  /// Use this method to send a native poll.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendpoll
  Future<Message> sendPoll(
      {@required dynamic chat_id,
      @required String question,
      @required List<String> options,
      bool is_anonymous,
      PollType type,
      bool allows_multiple_answers,
      int correct_option_id,
      bool is_closed,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    var form_data = FormData.fromMap({
      'chat_id': chat_id,
      'question': question,
      'options': jsonEncode(options),
      'is_anonymous': is_anonymous,
      'type': (type ?? PollType.Regular()),
      'allows_multiple_answers': allows_multiple_answers,
      'correct_option_id': correct_option_id,
      'is_closed': is_closed,
      'disable_notification': disable_notification,
      'reply_to_message_id': reply_to_message_id,
      'reply_markup': jsonEncode(reply_markup)
    });

    return Message.fromJson(
        await _client.post(method: 'sendPoll', form_data: form_data));
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
  Future<bool> sendChatAction(
      {@required dynamic chat_id, @required ChatAction action}) async {
    final form_data = FormData.fromMap({'chat_id': chat_id, 'action': action});

    return await _client.post(method: 'sendChatAction', form_data: form_data);
  }

  /// Use this method to get a list of profile pictures for a user.
  /// Returns a [UserProfilePhotos] object.
  ///
  /// https://core.telegram.org/bots/api#getuserprofilephotos
  Future<UserProfilePhotos> getUserProfilePhotos(
      {@required int user_id, int offset, int limit}) async {
    final form_data = FormData.fromMap(
        {'user_id': user_id, 'offset': offset, 'limit': limit});

    return UserProfilePhotos.fromJson(await _client.post(
        method: 'getUserProfilePhotos', form_data: form_data));
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
  Future<File> getFile({@required String file_id}) async {
    final form_data = FormData.fromMap({'file_id': file_id});

    return File.fromJson(
        await _client.post(method: 'getFile', form_data: form_data));
  }

  /// Use this method to kick a user from a group, a supergroup or a channel.
  /// In the case of supergroups and channels,
  /// the user will not be able to return to the group on
  /// their own using invite links, etc., unless unbanned first.
  /// The bot must be an administrator in the chat for this to work
  /// and must have the appropriate admin rights. Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#kickchatmember
  Future<bool> kickChatMember(
      {@required dynamic chat_id,
      @required int user_id,
      int until_date}) async {
    final form_data = FormData.fromMap(
        {'chat_id': chat_id, 'user_id': user_id, 'until_date': until_date});

    return await _client.post(method: 'kickChatMember', form_data: form_data);
  }

  /// Use this method to unban a previously kicked user in a
  /// supergroup or channel. The user will not return to the group or channel
  /// automatically, but will be able to join via link, etc.
  /// The bot must be an administrator for this to work.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#unbanchatmember
  Future<bool> unbanChatMember(
      {@required dynamic chat_id, @required int user_id}) async {
    final form_data =
        FormData.fromMap({'chat_id': chat_id, 'user_id': user_id});

    return await _client.post(method: 'unbanChatMember', form_data: form_data);
  }

  /// Use this method to restrict a user in a supergroup.
  /// The bot must be an administrator in the supergroup for this
  /// to work and must have the appropriate admin rights.
  /// Pass True for all permissions to lift restrictions from a user.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#restrictchatmember
  Future<bool> restrictChatMember(
      {@required dynamic chat_id,
      @required int user_id,
      ChatPermissions permissions,
      int until_date}) async {
    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'user_id': user_id,
      'permissions': jsonEncode(permissions),
      'until_date': until_date
    });

    return await _client.post(
        method: 'restrictChatMember', form_data: form_data);
  }

  /// Use this method to promote or demote a user in a supergroup or a channel.
  /// The bot must be an administrator in the chat for this to work and
  /// must have the appropriate admin rights.
  /// Pass False for all boolean parameters to demote a user.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#restrictchatmember
  Future<bool> promoteChatMember(
      {@required int chat_id,
      @required int user_id,
      bool can_change_info,
      bool can_post_messages,
      bool can_edit_messages,
      bool can_delete_messages,
      bool can_invite_users,
      bool can_restrict_members,
      bool can_pin_messages,
      bool can_promote_members}) async {
    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'user_id': user_id,
      'can_change_info': can_change_info,
      'can_post_messages': can_post_messages,
      'can_edit_messages': can_edit_messages,
      'can_delete_messages': can_delete_messages,
      'can_invite_users': can_invite_users,
      'can_restrict_members': can_restrict_members,
      'can_pin_messages': can_pin_messages,
      'can_promote_members': can_promote_members
    });

    return await _client.post(
        method: 'promoteChatMember', form_data: form_data);
  }

  /// Use this method to set a custom title for an administrator
  /// in a supergroup promoted by the bot.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#setchatadministratorcustomtitle
  Future<bool> setChatAdministratorCustomTitle(
      {@required dynamic chat_id,
      @required int user_id,
      @required String custom_title}) async {
    final form_data = FormData.fromMap(
        {'chat_id': chat_id, 'user_id': user_id, 'custom_title': custom_title});

    return await _client.post(
        method: 'setChatAdministratorCustomTitle', form_data: form_data);
  }

  /// Use this method to set default chat permissions for all members.
  /// The bot must be an administrator in the group or a supergroup
  /// for this to work and must have the can_restrict_members admin rights.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#setchatpermissions
  Future<bool> setChatPermissions(
      {@required dynamic chat_id,
      @required ChatPermissions permissions}) async {
    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'permissions': permissions,
    });

    return await _client.post(
        method: 'setChatPermissions', form_data: form_data);
  }

  /// Use this method to generate a new invite link for a chat;
  /// any previously generated link is revoked.
  /// The bot must be an administrator in the chat for this to work and must
  /// have the appropriate admin rights. Returns the new invite
  /// link as String on success.
  ///
  /// https://core.telegram.org/bots/api#setchatpermissions
  Future<bool> exportChatInviteLink({@required dynamic chat_id}) async {
    final form_data = FormData.fromMap({'chat_id': chat_id});

    return await _client.post(
        method: 'exportChatInviteLink', form_data: form_data);
  }

  /// Use this method to set a new profile photo for the chat.
  /// Photos can't be changed for private chats.
  /// The bot must be an administrator in the chat
  /// for this to work and must have the appropriate admin rights.
  /// Returns True on success.
  ///
  /// [photo] argument accepts [Luggage] object.
  ///
  /// https://core.telegram.org/bots/api#setchatphoto
  Future<bool> setChatPhoto(
      {@required dynamic chat_id, @required Luggage photo}) async {
    final form_data = FormData.fromMap({'chat_id': chat_id});

    switch (photo.type) {
      case 'link':
      case 'file_id':
        return Future.error(
            ApiException(description: 'This method accepts only files.'));
        break;
      case 'file':
      case 'bytes':
        form_data.files.add(MapEntry<String, MultipartFile>(
            'photo',
            MultipartFile.fromBytes(photo.getBytes(),
                filename: photo.getName(type: 'photo'))));
        break;
    }

    return await _client.post(method: 'setChatPhoto', form_data: form_data);
  }

  /// Use this method to delete a chat photo.
  /// Photos can't be changed for private chats.
  /// The bot must be an administrator in the chat for this
  /// to work and must have the appropriate admin rights.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#deletechatphoto
  Future<bool> deleteChatPhoto({@required dynamic chat_id}) async {
    final form_data = FormData.fromMap({'chat_id': chat_id});

    return await _client.post(method: 'deleteChatPhoto', form_data: form_data);
  }

  /// Use this method to change the title of a chat.
  /// Titles can't be changed for private chats.
  /// The bot must be an administrator in the chat
  /// for this to work and must have the appropriate admin rights.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#setchattitle
  Future<bool> setChatTitle(
      {@required dynamic chat_id, @required String title}) async {
    final form_data = FormData.fromMap({'chat_id': chat_id, 'title': title});

    return await _client.post(method: 'setChatTitle', form_data: form_data);
  }

  /// Use this method to change the description of a group,
  /// a supergroup or a channel.
  /// The bot must be an administrator in the chat
  /// for this to work and must have the appropriate admin rights.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#setchatdescription
  Future<bool> setChatDescription(
      {@required dynamic chat_id, String description}) async {
    final form_data =
        FormData.fromMap({'chat_id': chat_id, 'description': description});

    return await _client.post(
        method: 'setChatDescription', form_data: form_data);
  }

  /// Use this method to pin a message in a group, a supergroup, or a channel.
  /// The bot must be an administrator in the chat for this to work and must
  /// have the ‘can_pin_messages’ admin right in the supergroup or
  /// ‘can_edit_messages’ admin right in the channel.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#pinchatmessage
  Future<bool> pinChatMessage(
      {@required dynamic chat_id,
      @required int message_id,
      bool disable_notification}) async {
    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'message_id': message_id,
      'disable_notification': disable_notification
    });

    return await _client.post(method: 'pinChatMessage', form_data: form_data);
  }

  /// Use this method to unpin a message in a group, a supergroup, or a channel.
  /// The bot must be an administrator in the chat for this to
  /// work and must have the ‘can_pin_messages’ admin right in
  /// the supergroup or ‘can_edit_messages’ admin right in the channel.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#unpinchatmessage
  Future<bool> unpinChatMessage({@required dynamic chat_id}) async {
    final form_data = FormData.fromMap({'chat_id': chat_id});

    return await _client.post(method: 'pinChatMessage', form_data: form_data);
  }

  /// Use this method for your bot to leave a group, supergroup or channel.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#leavechat
  Future<bool> leaveChat({@required dynamic chat_id}) async {
    final form_data = FormData.fromMap({'chat_id': chat_id});

    return await _client.post(method: 'leaveChat', form_data: form_data);
  }

  /// Use this method to get up to date information about the chat
  /// (current name of the user for one-on-one conversations,
  /// current username of a user, group or channel, etc.).
  /// Returns a [Chat] object on success.
  ///
  /// https://core.telegram.org/bots/api#getchat
  Future<Chat> getChat({@required dynamic chat_id}) async {
    final form_data = FormData.fromMap({'chat_id': chat_id});

    return Chat.fromJson(
        await _client.post(method: 'getChat', form_data: form_data));
  }

  /// Use this method to get a list of administrators in a chat.
  /// On success, returns an Array of [ChatMember] objects that
  /// contains information about all chat administrators except other bots.
  /// If the chat is a group or a supergroup and no administrators
  /// were appointed, only the creator will be returned.
  ///
  /// https://core.telegram.org/bots/api#getchatadministrators
  Future<List<ChatMember>> getChatAdministrators(
      {@required dynamic chat_id}) async {
    final form_data = FormData.fromMap({'chat_id': chat_id});

    return (await _client.post(
            method: 'getChatAdministrators', form_data: form_data))
        .map<ChatMember>((member) => ChatMember.fromJson(member))
        .toList();
  }

  /// Use this method to get the number of members in a chat.
  /// Returns Int on success.
  ///
  /// https://core.telegram.org/bots/api#getchatmemberscount
  Future<int> getChatMembersCount({@required dynamic chat_id}) async {
    final form_data = FormData.fromMap({'chat_id': chat_id});

    return await _client.post(
        method: 'getChatMembersCount', form_data: form_data);
  }

  /// Use this method to get information about a member of a chat.
  /// Returns a [ChatMember] object on success.
  ///
  /// https://core.telegram.org/bots/api#getchatmember
  Future<ChatMember> getChatMember(
      {@required dynamic chat_id, @required int user_id}) async {
    final form_data =
        FormData.fromMap({'chat_id': chat_id, 'user_id': user_id});

    return ChatMember.fromJson(
        await _client.post(method: 'getChatMember', form_data: form_data));
  }

  /// Use this method to set a new group sticker set for a supergroup.
  /// The bot must be an administrator in the chat for this to work and
  /// must have the appropriate admin rights. Use the field can_set_sticker_set
  /// optionally returned in getChat requests to check
  /// if the bot can use this method.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#setchatstickerset
  Future<bool> setChatStickerSet(
      {@required dynamic chat_id, @required String sticker_set_name}) async {
    final form_data = FormData.fromMap(
        {'chat_id': chat_id, 'sticker_set_name': sticker_set_name});

    return await _client.post(
        method: 'setChatStickerSet', form_data: form_data);
  }

  /// Use this method to delete a group sticker set from a supergroup.
  /// The bot must be an administrator in the chat for this to work
  /// and must have the appropriate admin rights.
  /// Use the field can_set_sticker_set optionally returned in getChat
  /// requests to check if the bot can use this method.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#deletechatstickerset
  Future<bool> deleteChatStickerSet({@required dynamic chat_id}) async {
    final form_data = FormData.fromMap({'chat_id': chat_id});

    return await _client.post(
        method: 'deleteChatStickerSet', form_data: form_data);
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
  Future<bool> answerCallbackQuery(
      {@required String callback_query_id,
      String text,
      bool show_alert,
      String url,
      int cache_time}) async {
    final form_data = FormData.fromMap({
      'callback_query_id': callback_query_id,
      'text': text,
      'show_alert': show_alert,
      'url': url,
      'cache_time': cache_time
    });

    return await _client.post(
        method: 'answerCallbackQuery', form_data: form_data);
  }

  /// Use this method to edit text and game messages.
  /// On success, if edited message is sent by the bot,
  /// the edited [Message] is returned, otherwise True is returned.
  ///
  /// https://core.telegram.org/bots/api#editmessagetext
  Future<Message> editMessageText(
      {dynamic chat_id,
      int message_id,
      String inline_message_id,
      @required String text,
      ParseMode parse_mode,
      bool disable_web_page_preview,
      InlineKeyboardMarkup reply_markup}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null)) {
      return Future.error(ApiException(
          description: 'At least inline_message_id is required. '
              'Can be used also chat_id and message_id.'));
    }

    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'message_id': message_id,
      'inline_message_id': inline_message_id,
      'text': text,
      'parse_mode': parse_mode,
      'disable_web_page_preview': disable_web_page_preview,
      'reply_markup': jsonEncode(reply_markup)
    });

    final response =
        await _client.post(method: 'editMessageText', form_data: form_data);

    if (response == true) {
      return Future.error(
          ApiException(description: 'Edited message is not sent by the bot.'));
    }

    return Message.fromJson(response);
  }

  /// Use this method to edit captions of messages.
  /// On success, if edited message is sent by the bot,
  /// the edited [Message] is returned, otherwise True is returned.
  ///
  /// https://core.telegram.org/bots/api#editmessagecaption
  Future<Message> editMessageCaption(
      {dynamic chat_id,
      int message_id,
      String inline_message_id,
      String caption,
      ParseMode parse_mode,
      InlineKeyboardMarkup reply_markup}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null)) {
      return Future.error(ApiException(
          description: 'At least inline_message_id is required. '
              'Can be used also chat_id and message_id.'));
    }

    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'message_id': message_id,
      'inline_message_id': inline_message_id,
      'caption': caption,
      'parse_mode': parse_mode,
      'reply_markup': jsonEncode(reply_markup)
    });

    final response =
        await _client.post(method: 'editMessageCaption', form_data: form_data);

    if (response == true) {
      return Future.error(
          ApiException(description: 'Edited message is not sent by the bot.'));
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
      {dynamic chat_id,
      int message_id,
      String inline_message_id,
      @required InputMedia media,
      ParseMode parse_mode,
      InlineKeyboardMarkup reply_markup}) async {
    if (inline_message_id == null &&
        (chat_id == null || inline_message_id == null)) {
      return Future.error(ApiException(
          description: 'At least inline_message_id is required. '
              'Can be used also chat_id and message_id.'));
    }

    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'message_id': message_id,
      'inline_message_id': inline_message_id,
      'media': jsonEncode(media),
      'parse_mode': parse_mode.getMode(),
      'reply_markup': jsonEncode(reply_markup)
    });

    final response =
        await _client.post(method: 'editMessageMedia', form_data: form_data);

    if (response == true) {
      return Future.error(
          ApiException(description: 'Edited message is not sent by the bot.'));
    }

    return Message.fromJson(response);
  }

  /// Use this method to edit only the reply markup of messages.
  /// On success, if edited message is sent by the bot,
  /// the edited [Message] is returned, otherwise True is returned.
  ///
  /// https://core.telegram.org/bots/api#editmessagereplymarkup
  Future<Message> editMessageReplyMarkup(
      {dynamic chat_id,
      int message_id,
      String inline_message_id,
      InlineKeyboardMarkup reply_markup}) async {
    if (inline_message_id == null &&
        (chat_id == null || inline_message_id == null)) {
      return Future.error(ApiException(
          description: 'At least inline_message_id is required. '
              'Can be used also chat_id and message_id.'));
    }

    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'message_id': message_id,
      'inline_message_id': inline_message_id,
      'reply_markup': jsonEncode(reply_markup)
    });

    final response =
        await _client.post(method: 'editMessageMedia', form_data: form_data);

    if (response == true) {
      return Future.error(
          ApiException(description: 'Edited message is not sent by the bot.'));
    }

    return Message.fromJson(response);
  }

  /// Use this method to stop a poll which was sent by the bot.
  /// On success, the stopped [Poll] with the final results is returned.
  ///
  /// https://core.telegram.org/bots/api#stoppoll
  Future<Poll> stopPoll(
      {@required dynamic chat_id,
      @required int message_id,
      InlineKeyboardMarkup reply_markup}) async {
    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'message_id': message_id,
      'reply_markup': jsonEncode(reply_markup)
    });

    return Poll.fromJson(
        await _client.post(method: 'stopPoll', form_data: form_data));
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
  Future<bool> deleteMessage(
      {@required dynamic chat_id, @required int message_id}) async {
    final form_data =
        FormData.fromMap({'chat_id': chat_id, 'message_id': message_id});

    return await _client.post(method: 'deleteMessage', form_data: form_data);
  }

  /// Use this method to send static .WEBP or animated .TGS stickers.
  /// On success, the sent [Message] is returned.
  ///
  /// [photo] argument accepts [Luggage] object.
  ///
  /// https://core.telegram.org/bots/api#sendsticker
  Future<Message> sendSticker(
      {@required dynamic chat_id,
      @required Luggage sticker,
      bool disable_notification,
      int reply_to_message_id,
      ReplyMarkup reply_markup}) async {
    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'disable_notification': disable_notification,
      'reply_to_message_id': reply_to_message_id,
      'reply_markup': jsonEncode(reply_markup)
    });

    switch (sticker.type) {
      case 'link':
      case 'file_id':
        form_data.fields.add(MapEntry('sticker', sticker.toString()));
        break;
      case 'file':
      case 'bytes':
        form_data.files.add(MapEntry<String, MultipartFile>(
            'photo',
            MultipartFile.fromBytes(sticker.getBytes(),
                filename: sticker.getName(type: 'sticker'))));
        break;
    }

    return Message.fromJson(
        await _client.post(method: 'sendSticker', form_data: form_data));
  }

  /// Use this method to get a sticker set.
  /// On success, a StickerSet object is returned.
  ///
  /// https://core.telegram.org/bots/api#sendsticker
  Future<StickerSet> getStickerSet({@required String name}) async {
    final form_data = FormData.fromMap({'name': name});

    return StickerSet.fromJson(
        await _client.post(method: 'getStickerSet', form_data: form_data));
  }

  /// Use this method to upload a .png file with a sticker
  /// for later use in createNewStickerSet and addStickerToSet
  /// methods (can be used multiple times).
  /// Returns the uploaded [File] on success.
  ///
  /// [png_sticker] argument accepts [Luggage] object.
  ///
  /// https://core.telegram.org/bots/api#uploadstickerfile
  Future<File> uploadStickerFile(
      {@required int user_id, @required Luggage png_sticker}) async {
    final form_data = FormData.fromMap({'user_id': user_id});

    switch (png_sticker.type) {
      case 'link':
      case 'file_id':
        return Future.error(
            ApiException(description: 'This method accepts only files.'));
        break;
      case 'file':
      case 'bytes':
        form_data.files.add(MapEntry<String, MultipartFile>(
            'photo',
            MultipartFile.fromBytes(png_sticker.getBytes(),
                filename: png_sticker.getName(type: 'png_sticker'))));
        break;
    }

    return File.fromJson(
        await _client.post(method: 'uploadStickerfile', form_data: form_data));
  }

  /// Use this method to create new sticker set owned by a user.
  /// The bot will be able to edit the created sticker set.
  /// Returns True on success.
  ///
  /// [png_sticker] argument accepts [Luggage] object.
  ///
  /// https://core.telegram.org/bots/api#createnewstickerset
  Future<bool> createNewStickerSet(
      {@required int user_id,
      @required String name,
      @required String title,
      @required Luggage png_sticker,
      @required String emojis,
      bool contains_masks,
      MaskPosition mask_position}) async {
    final me = await getMe();

    final form_data = FormData.fromMap({
      'user_id': user_id,
      'name': '${name}_by_${me.username}',
      'title': title,
      'emojis': emojis,
      'contains_masks': contains_masks,
      'mask_position': jsonEncode(mask_position)
    });

    switch (png_sticker.type) {
      case 'link':
      case 'file_id':
        return Future.error(
            ApiException(description: 'This method accepts only files.'));
        break;
      case 'file':
      case 'bytes':
        form_data.files.add(MapEntry<String, MultipartFile>(
            'png_sticker',
            MultipartFile.fromBytes(png_sticker.getBytes(),
                filename: png_sticker.getName(type: 'png_sticker'))));
        break;
    }

    return await _client.post(
        method: 'createNewStickerSet', form_data: form_data);
  }

  /// Use this method to add a new sticker to a set created by the bot.
  /// Returns True on success.
  ///
  /// [png_sticker] argument accepts [Luggage] object.
  ///
  /// https://core.telegram.org/bots/api#addstickertoset
  Future<bool> addStickerToSet(
      {@required int user_id,
      @required String name,
      @required Luggage png_sticker,
      @required String emojis,
      MaskPosition mask_position}) async {
    final form_data = FormData.fromMap({
      'user_id': user_id,
      'name': name,
      'emojis': emojis,
      'mask_position': jsonEncode(mask_position)
    });

    switch (png_sticker.type) {
      case 'link':
      case 'file_id':
        return Future.error(
            ApiException(description: 'This method accepts only files.'));
        break;
      case 'file':
      case 'bytes':
        form_data.files.add(MapEntry<String, MultipartFile>(
            'png_sticker',
            MultipartFile.fromBytes(png_sticker.getBytes(),
                filename: png_sticker.getName(type: 'png_sticker'))));
        break;
    }

    return await _client.post(method: 'addStickerToSet', form_data: form_data);
  }

  /// Use this method to move a sticker in a set created
  /// by the bot to a specific position.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#setstickerpositioninset
  Future<bool> setStickerPositionInSet(
      {@required String sticker, @required int position}) async {
    final form_data =
        FormData.fromMap({'sticker': sticker, 'position': position});

    return await _client.post(
        method: 'setStickerPositionInSet', form_data: form_data);
  }

  /// Use this method to delete a sticker from a set created by the bot.
  /// Returns True on success.
  ///
  /// https://core.telegram.org/bots/api#deletestickerfromset
  Future<bool> deleteStickerFromSet({@required String sticker}) async {
    final form_data = FormData.fromMap({'sticker': sticker});

    return await _client.post(
        method: 'deleteStickerFromSet', form_data: form_data);
  }

  /// Use this method to send answers to an inline query.
  /// On success, True is returned.
  ///
  /// No more than 50 results per query are allowed.
  ///
  /// https://core.telegram.org/bots/api#answerinlinequery
  Future<bool> answerInlineQuery(
      {@required String inline_query_id,
      @required List<InlineQueryResult> results,
      int cache_time,
      bool is_personal,
      String next_offset,
      String switch_pm_text,
      String switch_pm_parameter}) async {
    final form_data = FormData.fromMap({
      'inline_query_id': inline_query_id,
      'results': jsonEncode(results),
      'cache_time': cache_time,
      'is_personal': is_personal,
      'next_offset': next_offset,
      'switch_pm_text': switch_pm_text,
      'switch_pm_parameter': switch_pm_parameter,
    });

    return await _client.post(
        method: 'answerInlineQuery', form_data: form_data);
  }

  /// Use this method to send invoices.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendinvoice
  Future<Message> sendInvoice(
      {@required int chat_id,
      @required String title,
      @required String description,
      @required String payload,
      @required String provider_token,
      @required String start_parameter,
      @required String currency,
      @required List<LabeledPrice> prices,
      String provider_data,
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
    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'title': title,
      'description': description,
      'payload': payload,
      'provider_token': provider_token,
      'start_parameter': start_parameter,
      'currency': currency,
      'prices': jsonEncode(prices),
      'provider_data': provider_data,
      'photo_url': photo_url,
      'photo_size': photo_size,
      'photo_width': photo_width,
      'photo_height': photo_height,
      'need_name': need_name,
      'need_phone_number': need_phone_number,
      'need_email': need_email,
      'need_shipping_address': need_shipping_address,
      'send_phone_number_to_provider': send_phone_number_to_provider,
      'send_email_to_provider': send_email_to_provider,
      'is_flexible': is_flexible,
      'disable_notification': disable_notification,
      'reply_to_message_id': reply_to_message_id,
      'reply_markup': jsonEncode(reply_markup)
    });

    return Message.fromJson(
        await _client.post(method: 'sendInvoice', form_data: form_data));
  }

  /// If you sent an invoice requesting a shipping address
  /// and the parameter is_flexible was specified,
  /// the Bot API will send an Update with a shipping_query
  /// field to the bot.
  /// Use this method to reply to shipping queries.
  /// On success, True is returned.
  ///
  /// https://core.telegram.org/bots/api#answershippingquery
  Future<bool> answerShippingQuery(
      {@required String shipping_query_id,
      @required bool possible,
      List<ShippingOption> shipping_options,
      String error_message}) async {
    if (!possible && (shipping_options == null || error_message == null)) {
      return Future.error("If it's not possible, "
          'shipping_options and error_message can not be null.');
    }

    final form_data = FormData.fromMap({
      'shipping_query_id': shipping_query_id,
      'ok': possible,
      'shipping_options': jsonEncode(shipping_options),
      'error_message': error_message
    });

    return await _client.post(
        method: 'answerShippingQuery', form_data: form_data);
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
  Future<bool> answerPreCheckoutQuery(
      {@required String pre_checkout_query_id,
      @required bool possible,
      String error_message}) async {
    if (!possible && error_message == null) {
      return Future.error(ApiException(
          description: "If it's not possible, "
              'error_message can not be null.'));
    }
    final form_data = FormData.fromMap({
      'pre_checkout_query_id': pre_checkout_query_id,
      'ok': possible,
      'error_message': error_message
    });

    return await _client.post(
        method: 'answerPreCheckoutQuery', form_data: form_data);
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
      {@required int user_id,
      @required List<PassportElementError> errors}) async {
    final form_data =
        FormData.fromMap({'user_id': user_id, 'errors': jsonEncode(errors)});

    return await _client.post(
        method: 'setPassportDataErrors', form_data: form_data);
  }

  /// Use this method to send a game.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendgame
  Future<Message> sendGame(
      {@required int chat_id,
      @required String game_short_name,
      bool disable_notification,
      int reply_to_message_id,
      InlineKeyboardMarkup reply_markup}) async {
    final form_data = FormData.fromMap({
      'chat_id': chat_id,
      'game_short_name': game_short_name,
      'disable_notification': disable_notification,
      'reply_to_message_id': reply_to_message_id,
      'reply_markup': jsonEncode(reply_markup)
    });

    return Message.fromJson(
        await _client.post(method: 'sendGame', form_data: form_data));
  }

  /// Use this method to set the score of the specified user in a game.
  /// On success, if the message was sent by the bot,
  /// returns the edited [Message], otherwise returns True.
  /// Returns an error, if the new score is not greater than the
  /// user's current score in the chat and force is False.
  ///
  /// https://core.telegram.org/bots/api#setgamescore
  Future<Message> setGameScore(
      {@required int user_id,
      @required int score,
      bool force,
      bool disable_edit_message,
      int chat_id,
      int message_id,
      String inline_message_id}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null)) {
      return Future.error(ApiException(
          description: 'At least inline_message_id is required. '
              'Can be used also chat_id and message_id.'));
    }

    final form_data = FormData.fromMap({
      'user_id': user_id,
      'score': score,
      'force': force,
      'disable_edit_message': disable_edit_message,
      'chat_id': chat_id,
      'message_id': message_id,
      'inline_message_id': inline_message_id
    });

    return Message.fromJson(
        await _client.post(method: 'setGameScore', form_data: form_data));
  }

  /// Use this method to get data for high score tables.
  /// Will return the score of the specified user and several
  /// of his neighbors in a game. On success, returns an
  /// Array of [GameHighScore] objects.
  ///
  /// https://core.telegram.org/bots/api#getgamehighscores
  Future<List<GameHighScore>> getGameHighScores(
      {@required int user_id,
      int chat_id,
      int message_id,
      String inline_message_id}) async {
    if (inline_message_id == null && (chat_id == null || message_id == null)) {
      return Future.error(ApiException(
          description: 'At least inline_message_id is required. '
              'Can be used also chat_id and message_id.'));
    }

    final form_data = FormData.fromMap({
      'user_id': user_id,
      'chat_id': chat_id,
      'message_id': message_id,
      'inline_message_id': inline_message_id
    });

    return (await _client.post(
            method: 'getGameHighScores', form_data: form_data))
        .map<GameHighScore>(
            (gameHighScore) => GameHighScore.fromJson(gameHighScore))
        .toList();
  }
}
