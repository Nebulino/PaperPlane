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
import 'package:paperplane/src/tools/client/telegram_client.dart';
import 'package:paperplane/telegram.dart';

/// You can find all Telegram API methods.
class API {
  final TelegramClient _client;

  API(this._client);

  /// Use this method to receive incoming updates using long polling
  /// ([wiki]).
  /// An Array of [Update] objects is returned.
  ///
  /// [wiki]: https://en.wikipedia.org/wiki/Push_technology#Long_polling
  ///
  /// https://core.telegram.org/bots/api#getupdates.
  Future<List<Update>> getUpdates(
      {int offset,
      int limit,
      int timeout,
      List<UpdateType> allowedUpdates}) async {
    final parameters = <String, dynamic>{
      'offset': offset,
      'limit': limit,
      'timeout': timeout,
      'allowed_updates': jsonEncode(allowedUpdates)
    };

    return (await _client.get(method: 'getUpdates', parameters: parameters))
        .map<Update>((update) => Update.fromJson(update))
        .toList();
  }

  /// Returns all bot info as a [User] object.
  ///
  /// https://core.telegram.org/bots/api#making-requests
  Future<User> getMe() async {
    return User.fromJson(await _client.get(method: 'getMe'));
  }

  /// Returns all bot info as a [Bot] object.
  ///
  /// https://core.telegram.org/bots/api#making-requests
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
  /// Returns **True** on success.
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
      int maxConnections,
      List<UpdateType> allowedUpdates}) async {
    final formData = FormData.fromMap({
      'url': url,
      'max_connections': maxConnections,
      'allowed_updates': jsonEncode(allowedUpdates)
    });

    if (certificate != null) {
      formData.files.add(MapEntry(
          'certificate',
          MultipartFile.fromBytes(certificate.readAsBytesSync(),
              filename: 'certificate${DateTime.now().toIso8601String()}')));
    }

    return await _client.post(method: 'setWebhook', formData: formData);
  }

  /// Use this method to remove webhook integration
  /// if you decide to switch back to getUpdates.
  /// Returns **True** on success. Requires no parameters.
  ///
  /// https://core.telegram.org/bots/api#deletewebhook
  Future<bool> deleteWebhook() async {
    return await _client.get(method: 'deleteWebhook');
  }

  /// Use this method to get current webhook status.
  /// Requires no parameters.
  /// On success, returns a [WebhookInfo] object.
  /// If the bot is using [getUpdates],
  /// will return an object with the **url** field empty.
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
      {@required ChatID chatID,
      @required String text,
      ParseMode parseMode,
      bool disableWebPagePreview,
      bool disableNotification,
      int replyToMessageID,
      ReplyMarkup replyMarkup}) async {
    final formData = FormData.fromMap({
      'chat_id': chatID,
      'text': text,
      'parse_mode': parseMode.mode,
      'disable_web_page_preview': disableWebPagePreview,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageID,
      'reply_markup': jsonEncode(replyMarkup)
    });
    return Message.fromJson(
        await _client.post(method: 'sendMessage', formData: formData));
  }

  /// Use this method to forward messages of any kind.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#forwardmessage
  Future<Message> forwardMessage(
      {@required ChatID chatID,
      @required ChatID fromChatID,
      bool disableNotification,
      @required int messageID}) async {
    final formData = FormData.fromMap({
      'chat_id': chatID,
      'from_chat_id': fromChatID,
      'disable_notification': disableNotification,
      'message_id': messageID,
    });

    return Message.fromJson(
        await _client.post(method: 'forwardMessage', formData: formData));
  }

  /// Use this method to send photos.
  /// On success, the sent [Message] is returned.
  ///
  /// [photo] argument accepts [Luggage] object.
  ///
  /// https://core.telegram.org/bots/api#sendphoto
  Future<Message> sendPhoto(
      {@required ChatID chatID,
      @required Luggage photo,
      String caption,
      ParseMode parseMode,
      bool disableNotification,
      int replyToMessageID,
      ReplyMarkup replyMarkup}) async {
    final formData = FormData.fromMap({
      'chat_id': chatID,
      'caption': caption,
      'parse_mode': parseMode.mode,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageID,
      'reply_markup': jsonEncode(replyMarkup)
    });

    // Check if Photo is a String/URL or an Picture io.File.
    switch (photo.type) {
      case 'link':
      case 'file_id':
        formData.fields.add(MapEntry('photo', photo.toString()));
        break;
      case 'file':
      case 'bytes':
        formData.files.add(MapEntry<String, MultipartFile>(
            'photo',
            MultipartFile.fromBytes(photo.getBytes(),
                filename: photo.getName(type: 'photo'))));
        break;
    }
    return Message.fromJson(
        await _client.post(method: 'sendPhoto', formData: formData));
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
      {@required ChatID chatID,
      @required Luggage audio,
      String caption,
      ParseMode parseMode,
      Duration duration,
      String performer,
      String title,
      Luggage thumb,
      bool disableNotification,
      int replyToMessageID,
      ReplyMarkup replyMarkup}) async {
    final formData = FormData.fromMap({
      'chat_id': chatID,
      'caption': caption,
      'parse_mode': parseMode.mode,
      'duration': duration?.inSeconds,
      'performer': performer,
      'title': title,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageID,
      'reply_markup': jsonEncode(replyMarkup)
    });

    // Check if audio is a File (or Blob) or a String
    // Creating an empty list of http.MultipartFile
    switch (audio.type) {
      case 'link':
      case 'file_id':
        formData.fields.add(MapEntry('audio', audio.toString()));
        break;
      case 'file':
      case 'bytes':
        formData.files.add(MapEntry<String, MultipartFile>(
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
          formData.files.add(MapEntry<String, MultipartFile>(
              'thumb',
              MultipartFile.fromBytes(thumb.getBytes(),
                  filename: thumb.getName())));
          break;
      }
    }

    return Message.fromJson(
        await _client.post(method: 'sendAudio', formData: formData));
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
      {@required ChatID chatID,
      @required Luggage document,
      Luggage thumb,
      String caption,
      ParseMode parseMode,
      bool disableNotification,
      int replyToMessageID,
      ReplyMarkup replyMarkup}) async {
    final formData = FormData.fromMap({
      'chat_id': chatID,
      'caption': caption,
      'parse_mode': parseMode.mode,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageID,
      'reply_markup': jsonEncode(replyMarkup)
    });

    switch (document.type) {
      case 'link':
      case 'file_id':
        formData.fields.add(MapEntry('document', document.toString()));
        break;
      case 'file':
      case 'bytes':
        formData.files.add(MapEntry<String, MultipartFile>(
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
          formData.files.add(MapEntry<String, MultipartFile>(
              'thumb',
              MultipartFile.fromBytes(thumb.getBytes(),
                  filename: thumb.getName())));
          break;
      }
    }

    return Message.fromJson(
        await _client.post(method: 'sendDocument', formData: formData));
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
      {@required ChatID chatID,
      @required Luggage video,
      Duration duration,
      int width,
      int height,
      Luggage thumb,
      String caption,
      ParseMode parseMode,
      bool supportsStreaming,
      bool disableNotification,
      int replyToMessageID,
      ReplyMarkup replyMarkup}) async {
    final formData = FormData.fromMap({
      'chat_id': chatID,
      'duration': duration?.inSeconds,
      'width': width,
      'height': height,
      'caption': caption,
      'parse_mode': parseMode.mode,
      'supports_streaming': supportsStreaming,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageID,
      'reply_markup': jsonEncode(replyMarkup)
    });

    switch (video.type) {
      case 'link':
      case 'file_id':
        formData.fields.add(MapEntry('video', video.toString()));
        break;
      case 'file':
      case 'bytes':
        formData.files.add(MapEntry<String, MultipartFile>(
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
          formData.files.add(MapEntry<String, MultipartFile>(
              'thumb',
              MultipartFile.fromBytes(thumb.getBytes(),
                  filename: thumb.getName())));
          break;
      }
    }

    return Message.fromJson(
        await _client.post(method: 'sendVideo', formData: formData));
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
      {@required ChatID chatID,
      @required Luggage animation,
      Duration duration,
      int width,
      int height,
      Luggage thumb,
      String caption,
      ParseMode parseMode,
      bool disableNotification,
      int replyToMessageID,
      ReplyMarkup replyMarkup}) async {
    final formData = FormData.fromMap({
      'chat_id': chatID,
      'duration': duration?.inSeconds,
      'width': width,
      'height': height,
      'caption': caption,
      'parse_mode': parseMode.mode,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageID,
      'reply_markup': jsonEncode(replyMarkup)
    });

    switch (animation.type) {
      case 'link':
      case 'file_id':
        formData.fields.add(MapEntry('animation', animation.toString()));
        break;
      case 'file':
      case 'bytes':
        formData.files.add(MapEntry<String, MultipartFile>(
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
          formData.files.add(MapEntry<String, MultipartFile>(
              'thumb',
              MultipartFile.fromBytes(thumb.getBytes(),
                  filename: thumb.getName())));
          break;
      }
    }

    return Message.fromJson(
        await _client.post(method: 'sendAnimation', formData: formData));
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
      {@required ChatID chatID,
      @required Luggage voice,
      String caption,
      ParseMode parseMode,
      Duration duration,
      bool disableNotification,
      int replyToMessageID,
      ReplyMarkup replyMarkup}) async {
    final formData = FormData.fromMap({
      'chat_id': chatID,
      'caption': caption,
      'parse_mode': parseMode.mode,
      'duration': duration?.inSeconds,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageID,
      'reply_markup': jsonEncode(replyMarkup)
    });

    switch (voice.type) {
      case 'link':
      case 'file_id':
        formData.fields.add(MapEntry('voice', voice.toString()));
        break;
      case 'file':
      case 'bytes':
        formData.files.add(MapEntry<String, MultipartFile>(
            'video',
            MultipartFile.fromBytes(voice.getBytes(),
                filename: voice.getName(type: 'voice'))));
        break;
    }

    return Message.fromJson(
        await _client.post(method: 'sendVoice', formData: formData));
  }

  /// As of v.4.0,
  /// Telegram clients support rounded square mp4 videos of up to 1 minute long.
  /// Use this method to send video messages.
  /// On success, the sent [Message] is returned.
  ///
  /// [videoNote] argument accepts [Luggage] object.
  /// [thumb] argument accepts [Luggage] object.
  ///
  /// https://core.telegram.org/bots/api#sendvoice
  Future<Message> sendVideoNote(
      {@required ChatID chatID,
      @required Luggage videoNote,
      Duration duration,
      int length,
      Luggage thumb,
      bool disableNotification,
      int replyToMessageID,
      ReplyMarkup replyMarkup}) async {
    final formData = FormData.fromMap({
      'chat_id': chatID,
      'duration': duration?.inSeconds,
      'lenght': length,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageID,
      'reply_markup': jsonEncode(replyMarkup)
    });

    switch (videoNote.type) {
      case 'link':
      case 'file_id':
        formData.fields.add(MapEntry('video_note', videoNote.toString()));
        break;
      case 'file':
      case 'bytes':
        formData.files.add(MapEntry<String, MultipartFile>(
            'video',
            MultipartFile.fromBytes(videoNote.getBytes(),
                filename: videoNote.getName(type: 'video_note'))));
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
          formData.files.add(MapEntry<String, MultipartFile>(
              'thumb',
              MultipartFile.fromBytes(thumb.getBytes(),
                  filename: thumb.getName())));
          break;
      }
    }

    return Message.fromJson(
        await _client.post(method: 'sendVideoNote', formData: formData));
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
      {@required ChatID chatID,
      @required List<InputMediaLuggage> media,
      bool disableNotification,
      int replyToMessageID}) async {
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

    final formData = FormData.fromMap({
      'chat_id': chatID,
      'media': jsonEncode(media_to_send),
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageID
    });

    formData.files.addAll(media_file_to_send);

    return (await _client.post(method: 'sendMediaGroup', formData: formData))
        .map<Message>((message) => Message.fromJson(message))
        .toList();
  }

  /// Use this method to send point on the map.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendlocation
  Future<Message> sendLocation(
      {@required ChatID chatID,
      @required double latitude,
      @required double longitude,
      int livePeriod,
      bool disableNotification,
      int replyToMessageID,
      ReplyMarkup replyMarkup}) async {
    final formData = FormData.fromMap({
      'chat_id': chatID,
      'latitude': latitude,
      'longitude': longitude,
      'live_period': livePeriod,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageID,
      'reply_markup': jsonEncode(replyMarkup)
    });

    return Message.fromJson(
        await _client.post(method: 'sendLocation', formData: formData));
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
      {ChatID chatID,
      int messageID,
      String inlineMessageID,
      @required double latitude,
      @required double longitude,
      InlineKeyboardMarkup replyMarkup}) async {
    if (inlineMessageID == null && (chatID == null || messageID == null)) {
      return Future.error(ApiException(
          description: 'At least inlineMessageID is required. '
              'Can be used also chatID and messageID.'));
    }

    final formData = FormData.fromMap({
      'chat_id': chatID,
      'message_id': messageID,
      'latitude': latitude,
      'longitude': longitude,
      'reply_markup': jsonEncode(replyMarkup)
    });

    return Message.fromJson(await _client.post(
        method: 'editMessageLiveLocation', formData: formData));
  }

  /// Use this method to stop updating a live location message
  /// before live_period expires.
  /// On success, if the message was sent by the bot,
  /// the sent [Message] is returned, otherwise True is returned.
  ///
  /// https://core.telegram.org/bots/api#stopmessagelivelocation
  Future<Message> stopMessageLiveLocation(
      {ChatID chatID,
      int messageID,
      String inlineMessageID,
      ReplyMarkup replyMarkup}) async {
    if (inlineMessageID == null && (chatID == null || messageID == null)) {
      return Future.error(ApiException(
          description: 'At least inlineMessageID is required. '
              'Can be used also chatID and messageID.'));
    }

    final formData = FormData.fromMap({
      'chat_id': chatID,
      'message_id': messageID,
      'inline_message_id': inlineMessageID,
      'reply_markup': jsonEncode(replyMarkup)
    });

    return Message.fromJson(await _client.post(
        method: 'stopMessageLiveLocation', formData: formData));
  }

  /// Use this method to send information about a venue.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendvenue
  Future<Message> sendVenue(
      {@required ChatID chatID,
      @required double latitude,
      @required double longitude,
      @required String title,
      @required String address,
      String foursquareID,
      String foursquareType,
      bool disableNotification,
      int replyToMessageID,
      ReplyMarkup replyMarkup}) async {
    final formData = FormData.fromMap({
      'chat_id': chatID,
      'latitude': latitude,
      'longitude': longitude,
      'title': title,
      'address': address,
      'foursquare_id': foursquareID,
      'foursquare_type': foursquareType,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageID,
      'reply_markup': jsonEncode(replyMarkup)
    });

    return Message.fromJson(
        await _client.post(method: 'sendVenue', formData: formData));
  }

  /// Use this method to send phone contacts.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendcontact
  Future<Message> sendContact(
      {@required ChatID chatID,
      @required String phoneNumber,
      @required String firstName,
      String lastName,
      String vcard,
      bool disableNotification,
      int replyToMessageID,
      ReplyMarkup replyMarkup}) async {
    final formData = FormData.fromMap({
      'chat_id': chatID,
      'phone_number': phoneNumber,
      'first_name': firstName,
      'last_name': lastName,
      'vcard': vcard,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageID,
      'reply_markup': jsonEncode(replyMarkup)
    });

    return Message.fromJson(
        await _client.post(method: 'sendContact', formData: formData));
  }

  /// Use this method to send a native poll.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendpoll
  Future<Message> sendPoll(
      {@required ChatID chatID,
      @required String question,
      @required List<String> options,
      bool isAnonymous,
      PollType type,
      bool allowsMultipleAnswers,
      int correctOptionID,
      bool isClosed,
      bool disableNotification,
      int replyToMessageID,
      ReplyMarkup replyMarkup}) async {
    var formData = FormData.fromMap({
      'chat_id': chatID,
      'question': question,
      'options': jsonEncode(options),
      'is_anonymous': isAnonymous,
      'type': (type ?? PollType.REGULAR.type),
      'allows_multiple_answers': allowsMultipleAnswers,
      'correct_option_id': correctOptionID,
      'is_closed': isClosed,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageID,
      'reply_markup': jsonEncode(replyMarkup)
    });

    return Message.fromJson(
        await _client.post(method: 'sendPoll', formData: formData));
  }

  /// Use this method when you need to tell the user
  /// that something is happening on the bot's side.
  /// The status is set for 5 seconds or less
  /// (when a message arrives from your bot,
  /// Telegram clients clear its typing status).
  /// Returns **True** on success.
  ///
  /// *Example:* The [ImageBot] needs some time to process a request
  /// and upload the image.
  /// Instead of sending a text message along the lines of
  /// “Retrieving image, please wait…”,
  /// the bot may use [sendChatAction] with
  /// action = upload_photo.
  /// The user will see a “sending photo” status for the bot.
  ///
  /// We only recommend using this method when a response
  /// from the bot will take a **noticeable** amount of time to arrive.
  ///
  /// [ImageBot]: https://t.me/imagebot
  ///
  /// https://core.telegram.org/bots/api#sendchataction
  Future<bool> sendChatAction(
      {@required ChatID chatID, @required ChatAction action}) async {
    final formData = FormData.fromMap({'chat_id': chatID, 'action': action});

    return await _client.post(method: 'sendChatAction', formData: formData);
  }

  /// Use this method to get a list of profile pictures for a user.
  /// Returns a [UserProfilePhotos] object.
  ///
  /// https://core.telegram.org/bots/api#getuserprofilephotos
  Future<UserProfilePhotos> getUserProfilePhotos(
      {@required int userID, int offset, int limit}) async {
    final formData =
        FormData.fromMap({'user_id': userID, 'offset': offset, 'limit': limit});

    return UserProfilePhotos.fromJson(
        await _client.post(method: 'getUserProfilePhotos', formData: formData));
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
  /// **Note:** This function may not preserve the original file name and MIME type.
  /// You should save the file's MIME type and name (if available)
  /// when the File object is received.
  ///
  /// https://core.telegram.org/bots/api#getfile
  Future<File> getFile({@required String fileID}) async {
    final formData = FormData.fromMap({'file_id': fileID});

    return File.fromJson(
        await _client.post(method: 'getFile', formData: formData));
  }

  /// Use this method to kick a user from a group, a supergroup or a channel.
  /// In the case of supergroups and channels,
  /// the user will not be able to return to the group on
  /// their own using invite links, etc., unless unbanned first.
  /// The bot must be an administrator in the chat for this to work
  /// and must have the appropriate admin rights. Returns **True** on success.
  ///
  /// https://core.telegram.org/bots/api#kickchatmember
  Future<bool> kickChatMember(
      {@required ChatID chatID, @required int userID, int untilDate}) async {
    final formData = FormData.fromMap(
        {'chat_id': chatID, 'user_id': userID, 'until_date': untilDate});

    return await _client.post(method: 'kickChatMember', formData: formData);
  }

  /// Use this method to unban a previously kicked user in a
  /// supergroup or channel. The user will not return to the group or channel
  /// automatically, but will be able to join via link, etc.
  /// The bot must be an administrator for this to work.
  /// Returns **True** on success.
  ///
  /// https://core.telegram.org/bots/api#unbanchatmember
  Future<bool> unbanChatMember(
      {@required ChatID chatID, @required int userID}) async {
    final formData = FormData.fromMap({'chat_id': chatID, 'user_id': userID});

    return await _client.post(method: 'unbanChatMember', formData: formData);
  }

  /// Use this method to restrict a user in a supergroup.
  /// The bot must be an administrator in the supergroup for this
  /// to work and must have the appropriate admin rights.
  /// Pass True for all permissions to lift restrictions from a user.
  /// Returns **True** on success.
  ///
  /// https://core.telegram.org/bots/api#restrictchatmember
  Future<bool> restrictChatMember(
      {@required ChatID chatID,
      @required int userID,
      ChatPermissions permissions,
      int untilDate}) async {
    final formData = FormData.fromMap({
      'chat_id': chatID,
      'user_id': userID,
      'permissions': jsonEncode(permissions),
      'until_date': untilDate
    });

    return await _client.post(method: 'restrictChatMember', formData: formData);
  }

  /// Use this method to promote or demote a user in a supergroup or a channel.
  /// The bot must be an administrator in the chat for this to work and
  /// must have the appropriate admin rights.
  /// Pass False for all boolean parameters to demote a user.
  /// Returns **True** on success.
  ///
  /// https://core.telegram.org/bots/api#restrictchatmember
  Future<bool> promoteChatMember(
      {@required int chatID,
      @required int userID,
      bool canChangeInfo,
      bool canPostMessages,
      bool canEditMessages,
      bool canDeleteMessages,
      bool canInviteUsers,
      bool canRestrictMembers,
      bool canPinMessages,
      bool canPromoteMembers}) async {
    final formData = FormData.fromMap({
      'chat_id': chatID,
      'user_id': userID,
      'can_change_info': canChangeInfo,
      'can_post_messages': canPostMessages,
      'can_edit_messages': canEditMessages,
      'can_delete_messages': canDeleteMessages,
      'can_invite_users': canInviteUsers,
      'can_restrict_members': canRestrictMembers,
      'can_pin_messages': canPinMessages,
      'can_promote_members': canPromoteMembers
    });

    return await _client.post(method: 'promoteChatMember', formData: formData);
  }

  /// Use this method to set a custom title for an administrator
  /// in a supergroup promoted by the bot.
  /// Returns **True** on success.
  ///
  /// https://core.telegram.org/bots/api#setchatadministratorcustomtitle
  Future<bool> setChatAdministratorCustomTitle(
      {@required ChatID chatID,
      @required int userID,
      @required String customTitle}) async {
    final formData = FormData.fromMap(
        {'chat_id': chatID, 'user_id': userID, 'custom_title': customTitle});

    return await _client.post(
        method: 'setChatAdministratorCustomTitle', formData: formData);
  }

  /// Use this method to set default chat permissions for all members.
  /// The bot must be an administrator in the group or a supergroup
  /// for this to work and must have the can_restrict_members admin rights.
  /// Returns **True** on success.
  ///
  /// https://core.telegram.org/bots/api#setchatpermissions
  Future<bool> setChatPermissions(
      {@required ChatID chatID, @required ChatPermissions permissions}) async {
    final formData = FormData.fromMap({
      'chat_id': chatID,
      'permissions': permissions,
    });

    return await _client.post(method: 'setChatPermissions', formData: formData);
  }

  /// Use this method to generate a new invite link for a chat;
  /// any previously generated link is revoked.
  /// The bot must be an administrator in the chat for this to work and must
  /// have the appropriate admin rights. Returns the new invite
  /// link as String on success.
  ///
  /// https://core.telegram.org/bots/api#setchatpermissions
  Future<bool> exportChatInviteLink({@required ChatID chatID}) async {
    final formData = FormData.fromMap({'chat_id': chatID});

    return await _client.post(
        method: 'exportChatInviteLink', formData: formData);
  }

  /// Use this method to set a new profile photo for the chat.
  /// Photos can't be changed for private chats.
  /// The bot must be an administrator in the chat
  /// for this to work and must have the appropriate admin rights.
  /// Returns **True** on success.
  ///
  /// [photo] argument accepts [Luggage] object.
  ///
  /// https://core.telegram.org/bots/api#setchatphoto
  Future<bool> setChatPhoto(
      {@required ChatID chatID, @required Luggage photo}) async {
    final formData = FormData.fromMap({'chat_id': chatID});

    switch (photo.type) {
      case 'link':
      case 'file_id':
        return Future.error(
            ApiException(description: 'This method accepts only files.'));
        break;
      case 'file':
      case 'bytes':
        formData.files.add(MapEntry<String, MultipartFile>(
            'photo',
            MultipartFile.fromBytes(photo.getBytes(),
                filename: photo.getName(type: 'photo'))));
        break;
    }

    return await _client.post(method: 'setChatPhoto', formData: formData);
  }

  /// Use this method to delete a chat photo.
  /// Photos can't be changed for private chats.
  /// The bot must be an administrator in the chat for this
  /// to work and must have the appropriate admin rights.
  /// Returns **True** on success.
  ///
  /// https://core.telegram.org/bots/api#deletechatphoto
  Future<bool> deleteChatPhoto({@required ChatID chatID}) async {
    final formData = FormData.fromMap({'chat_id': chatID});

    return await _client.post(method: 'deleteChatPhoto', formData: formData);
  }

  /// Use this method to change the title of a chat.
  /// Titles can't be changed for private chats.
  /// The bot must be an administrator in the chat
  /// for this to work and must have the appropriate admin rights.
  /// Returns **True** on success.
  ///
  /// https://core.telegram.org/bots/api#setchattitle
  Future<bool> setChatTitle(
      {@required ChatID chatID, @required String title}) async {
    final formData = FormData.fromMap({'chat_id': chatID, 'title': title});

    return await _client.post(method: 'setChatTitle', formData: formData);
  }

  /// Use this method to change the description of a group,
  /// a supergroup or a channel.
  /// The bot must be an administrator in the chat
  /// for this to work and must have the appropriate admin rights.
  /// Returns **True** on success.
  ///
  /// https://core.telegram.org/bots/api#setchatdescription
  Future<bool> setChatDescription(
      {@required ChatID chatID, String description}) async {
    final formData =
        FormData.fromMap({'chat_id': chatID, 'description': description});

    return await _client.post(method: 'setChatDescription', formData: formData);
  }

  /// Use this method to pin a message in a group, a supergroup, or a channel.
  /// The bot must be an administrator in the chat for this to work and must
  /// have the ‘can_pin_messages’ admin right in the supergroup or
  /// ‘can_edit_messages’ admin right in the channel.
  /// Returns **True** on success.
  ///
  /// https://core.telegram.org/bots/api#pinchatmessage
  Future<bool> pinChatMessage(
      {@required ChatID chatID,
      @required int messageID,
      bool disableNotification}) async {
    final formData = FormData.fromMap({
      'chat_id': chatID,
      'message_id': messageID,
      'disable_notification': disableNotification
    });

    return await _client.post(method: 'pinChatMessage', formData: formData);
  }

  /// Use this method to unpin a message in a group, a supergroup, or a channel.
  /// The bot must be an administrator in the chat for this to
  /// work and must have the ‘can_pin_messages’ admin right in
  /// the supergroup or ‘can_edit_messages’ admin right in the channel.
  /// Returns **True** on success.
  ///
  /// https://core.telegram.org/bots/api#unpinchatmessage
  Future<bool> unpinChatMessage({@required ChatID chatID}) async {
    final formData = FormData.fromMap({'chat_id': chatID});

    return await _client.post(method: 'pinChatMessage', formData: formData);
  }

  /// Use this method for your bot to leave a group, supergroup or channel.
  /// Returns **True** on success.
  ///
  /// https://core.telegram.org/bots/api#leavechat
  Future<bool> leaveChat({@required ChatID chatID}) async {
    final formData = FormData.fromMap({'chat_id': chatID});

    return await _client.post(method: 'leaveChat', formData: formData);
  }

  /// Use this method to get up to date information about the chat
  /// (current name of the user for one-on-one conversations,
  /// current username of a user, group or channel, etc.).
  /// Returns a [Chat] object on success.
  ///
  /// https://core.telegram.org/bots/api#getchat
  Future<Chat> getChat({@required ChatID chatID}) async {
    final formData = FormData.fromMap({'chat_id': chatID});

    return Chat.fromJson(
        await _client.post(method: 'getChat', formData: formData));
  }

  /// Use this method to get a list of administrators in a chat.
  /// On success, returns an Array of [ChatMember] objects that
  /// contains information about all chat administrators except other bots.
  /// If the chat is a group or a supergroup and no administrators
  /// were appointed, only the creator will be returned.
  ///
  /// https://core.telegram.org/bots/api#getchatadministrators
  Future<List<ChatMember>> getChatAdministrators(
      {@required ChatID chatID}) async {
    final formData = FormData.fromMap({'chat_id': chatID});

    return (await _client.post(
            method: 'getChatAdministrators', formData: formData))
        .map<ChatMember>((member) => ChatMember.fromJson(member))
        .toList();
  }

  /// Use this method to get the number of members in a chat.
  /// Returns Int on success.
  ///
  /// https://core.telegram.org/bots/api#getchatmemberscount
  Future<int> getChatMembersCount({@required ChatID chatID}) async {
    final formData = FormData.fromMap({'chat_id': chatID});

    return await _client.post(
        method: 'getChatMembersCount', formData: formData);
  }

  /// Use this method to get information about a member of a chat.
  /// Returns a [ChatMember] object on success.
  ///
  /// https://core.telegram.org/bots/api#getchatmember
  Future<ChatMember> getChatMember(
      {@required ChatID chatID, @required int userID}) async {
    final formData = FormData.fromMap({'chat_id': chatID, 'user_id': userID});

    return ChatMember.fromJson(
        await _client.post(method: 'getChatMember', formData: formData));
  }

  /// Use this method to set a new group sticker set for a supergroup.
  /// The bot must be an administrator in the chat for this to work and
  /// must have the appropriate admin rights. Use the field can_set_sticker_set
  /// optionally returned in getChat requests to check
  /// if the bot can use this method.
  /// Returns **True** on success.
  ///
  /// https://core.telegram.org/bots/api#setchatstickerset
  Future<bool> setChatStickerSet(
      {@required ChatID chatID, @required String stickerSetName}) async {
    final formData = FormData.fromMap(
        {'chat_id': chatID, 'sticker_set_name': stickerSetName});

    return await _client.post(method: 'setChatStickerSet', formData: formData);
  }

  /// Use this method to delete a group sticker set from a supergroup.
  /// The bot must be an administrator in the chat for this to work
  /// and must have the appropriate admin rights.
  /// Use the field can_set_sticker_set optionally returned in getChat
  /// requests to check if the bot can use this method.
  /// Returns **True** on success.
  ///
  /// https://core.telegram.org/bots/api#deletechatstickerset
  Future<bool> deleteChatStickerSet({@required ChatID chatID}) async {
    final formData = FormData.fromMap({'chat_id': chatID});

    return await _client.post(
        method: 'deleteChatStickerSet', formData: formData);
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
      {@required String callbackQueryID,
      String text,
      bool showAlert,
      String url,
      int cacheTime}) async {
    final formData = FormData.fromMap({
      'callback_query_id': callbackQueryID,
      'text': text,
      'show_alert': showAlert,
      'url': url,
      'cache_time': cacheTime
    });

    return await _client.post(
        method: 'answerCallbackQuery', formData: formData);
  }

  /// Use this method to edit text and game messages.
  /// On success, if edited message is sent by the bot,
  /// the edited [Message] is returned, otherwise True is returned.
  ///
  /// https://core.telegram.org/bots/api#editmessagetext
  Future<Message> editMessageText(
      {ChatID chatID,
      int messageID,
      String inlineMessageID,
      @required String text,
      ParseMode parseMode,
      bool disableWebPagePreview,
      InlineKeyboardMarkup replyMarkup}) async {
    if (inlineMessageID == null && (chatID == null || messageID == null)) {
      return Future.error(ApiException(
          description: 'At least inlineMessageID is required. '
              'Can be used also chatID and messageID.'));
    }

    final formData = FormData.fromMap({
      'chat_id': chatID,
      'message_id': messageID,
      'inline_message_id': inlineMessageID,
      'text': text,
      'parse_mode': parseMode.mode,
      'disable_web_page_preview': disableWebPagePreview,
      'reply_markup': jsonEncode(replyMarkup)
    });

    final response =
        await _client.post(method: 'editMessageText', formData: formData);

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
      {ChatID chatID,
      int messageID,
      String inlineMessageID,
      String caption,
      ParseMode parseMode,
      InlineKeyboardMarkup replyMarkup}) async {
    if (inlineMessageID == null && (chatID == null || messageID == null)) {
      return Future.error(ApiException(
          description: 'At least inlineMessageID is required. '
              'Can be used also chatID and messageID.'));
    }

    final formData = FormData.fromMap({
      'chat_id': chatID,
      'message_id': messageID,
      'inline_message_id': inlineMessageID,
      'caption': caption,
      'parse_mode': parseMode.mode,
      'reply_markup': jsonEncode(replyMarkup)
    });

    final response =
        await _client.post(method: 'editMessageCaption', formData: formData);

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
      {ChatID chatID,
      int messageID,
      String inlineMessageID,
      @required InputMedia media,
      ParseMode parseMode,
      InlineKeyboardMarkup replyMarkup}) async {
    if (inlineMessageID == null &&
        (chatID == null || inlineMessageID == null)) {
      return Future.error(ApiException(
          description: 'At least inlineMessageID is required. '
              'Can be used also chatID and messageID.'));
    }

    final formData = FormData.fromMap({
      'chat_id': chatID,
      'message_id': messageID,
      'inline_message_id': inlineMessageID,
      'media': jsonEncode(media),
      'parse_mode': parseMode.mode,
      'reply_markup': jsonEncode(replyMarkup)
    });

    final response =
        await _client.post(method: 'editMessageMedia', formData: formData);

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
      {ChatID chatID,
      int messageID,
      String inlineMessageID,
      InlineKeyboardMarkup replyMarkup}) async {
    if (inlineMessageID == null &&
        (chatID == null || inlineMessageID == null)) {
      return Future.error(ApiException(
          description: 'At least inlineMessageID is required. '
              'Can be used also chatID and messageID.'));
    }

    final formData = FormData.fromMap({
      'chat_id': chatID,
      'message_id': messageID,
      'inline_message_id': inlineMessageID,
      'reply_markup': jsonEncode(replyMarkup)
    });

    final response =
        await _client.post(method: 'editMessageMedia', formData: formData);

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
      {@required ChatID chatID,
      @required int messageID,
      InlineKeyboardMarkup replyMarkup}) async {
    final formData = FormData.fromMap({
      'chat_id': chatID,
      'message_id': messageID,
      'reply_markup': jsonEncode(replyMarkup)
    });

    return Poll.fromJson(
        await _client.post(method: 'stopPoll', formData: formData));
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
  /// Returns **True** on success.
  ///
  /// https://core.telegram.org/bots/api#deletemessage
  Future<bool> deleteMessage(
      {@required ChatID chatID, @required int messageID}) async {
    final formData =
        FormData.fromMap({'chat_id': chatID, 'message_id': messageID});

    return await _client.post(method: 'deleteMessage', formData: formData);
  }

  /// Use this method to send static .WEBP or animated .TGS stickers.
  /// On success, the sent [Message] is returned.
  ///
  /// [photo] argument accepts [Luggage] object.
  ///
  /// https://core.telegram.org/bots/api#sendsticker
  Future<Message> sendSticker(
      {@required ChatID chatID,
      @required Luggage sticker,
      bool disableNotification,
      int replyToMessageID,
      ReplyMarkup replyMarkup}) async {
    final formData = FormData.fromMap({
      'chat_id': chatID,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageID,
      'reply_markup': jsonEncode(replyMarkup)
    });

    switch (sticker.type) {
      case 'link':
      case 'file_id':
        formData.fields.add(MapEntry('sticker', sticker.toString()));
        break;
      case 'file':
      case 'bytes':
        formData.files.add(MapEntry<String, MultipartFile>(
            'photo',
            MultipartFile.fromBytes(sticker.getBytes(),
                filename: sticker.getName(type: 'sticker'))));
        break;
    }

    return Message.fromJson(
        await _client.post(method: 'sendSticker', formData: formData));
  }

  /// Use this method to get a sticker set.
  /// On success, a StickerSet object is returned.
  ///
  /// https://core.telegram.org/bots/api#sendsticker
  Future<StickerSet> getStickerSet({@required String name}) async {
    final formData = FormData.fromMap({'name': name});

    return StickerSet.fromJson(
        await _client.post(method: 'getStickerSet', formData: formData));
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
      {@required int userID, @required Luggage png_sticker}) async {
    final formData = FormData.fromMap({'user_id': userID});

    switch (png_sticker.type) {
      case 'link':
      case 'file_id':
        return Future.error(
            ApiException(description: 'This method accepts only files.'));
        break;
      case 'file':
      case 'bytes':
        formData.files.add(MapEntry<String, MultipartFile>(
            'photo',
            MultipartFile.fromBytes(png_sticker.getBytes(),
                filename: png_sticker.getName(type: 'png_sticker'))));
        break;
    }

    return File.fromJson(
        await _client.post(method: 'uploadStickerfile', formData: formData));
  }

  /// Use this method to create new sticker set owned by a user.
  /// The bot will be able to edit the created sticker set.
  /// Returns **True** on success.
  ///
  /// [pngSticker] argument accepts [Luggage] object.
  ///
  /// https://core.telegram.org/bots/api#createnewstickerset
  Future<bool> createNewStickerSet(
      {@required int userID,
      @required String name,
      @required String title,
      Luggage pngSticker,
      Luggage tgsSticker,
      @required String emojis,
      bool containsMasks,
      MaskPosition maskPosition}) async {
    if (pngSticker == null && tgsSticker == null) {
      return Future.error(PaperPlaneException(
          description:
              'You must send at least a png_sticker or a tgs_sticker.'));
    }

    final me = await getMe();

    final formData = FormData.fromMap({
      'user_id': userID,
      'name': '${name}_by_${me.username}',
      'title': title,
      'emojis': emojis,
      'contains_masks': containsMasks,
      'mask_position': jsonEncode(maskPosition)
    });

    switch (pngSticker.type) {
      case 'link':
      case 'file_id':
        formData.fields.add(MapEntry('png_sticker', pngSticker.toString()));
        break;
      case 'file':
      case 'bytes':
        formData.files.add(MapEntry<String, MultipartFile>(
            'png_sticker',
            MultipartFile.fromBytes(pngSticker.getBytes(),
                filename: pngSticker.getName(type: 'png_sticker'))));
        break;
    }

    if (tgsSticker != null) {
      switch (tgsSticker.type) {
        case 'link':
        case 'file_id':
          return Future.error(
              ApiException(description: 'This method accepts only files.'));
          break;
        case 'file':
        case 'bytes':
          formData.files.add(MapEntry<String, MultipartFile>(
              'tgs_sticker',
              MultipartFile.fromBytes(tgsSticker.getBytes(),
                  filename: tgsSticker.getName(type: 'tgs_sticker'))));
          break;
      }
    }

    return await _client.post(
        method: 'createNewStickerSet', formData: formData);
  }

  /// Use this method to add a new sticker to a set created by the bot.
  /// You must use exactly one of the fields png_sticker or tgs_sticker.
  /// Animated stickers can be added to animated sticker sets and only to them.
  /// Animated sticker sets can have up to 50 stickers.
  /// Static sticker sets can have up to 120 stickers.
  /// Returns **True** on success.
  ///
  /// [pngSticker] argument accepts [Luggage] object.
  /// [tgsSticker] argument accepts [Luggage] object.
  ///
  /// https://core.telegram.org/bots/api#addstickertoset
  Future<bool> addStickerToSet(
      {@required int userID,
      @required String name,
      Luggage pngSticker,
      Luggage tgsSticker,
      @required String emojis,
      MaskPosition maskPosition}) async {
    if (pngSticker == null && tgsSticker == null) {
      return Future.error(PaperPlaneException(
          description:
              'You must send at least a png_sticker or a tgs_sticker.'));
    }

    final formData = FormData.fromMap({
      'user_id': userID,
      'name': name,
      'emojis': emojis,
      'mask_position': jsonEncode(maskPosition)
    });

    switch (pngSticker.type) {
      case 'link':
      case 'file_id':
        formData.fields.add(MapEntry('png_sticker', pngSticker.toString()));
        break;
      case 'file':
      case 'bytes':
        formData.files.add(MapEntry<String, MultipartFile>(
            'png_sticker',
            MultipartFile.fromBytes(pngSticker.getBytes(),
                filename: pngSticker.getName(type: 'png_sticker'))));
        break;
    }

    if (tgsSticker != null) {
      switch (tgsSticker.type) {
        case 'link':
        case 'file_id':
          return Future.error(
              ApiException(description: 'This method accepts only files.'));
          break;
        case 'file':
        case 'bytes':
          formData.files.add(MapEntry<String, MultipartFile>(
              'tgs_sticker',
              MultipartFile.fromBytes(tgsSticker.getBytes(),
                  filename: tgsSticker.getName(type: 'tgs_sticker'))));
          break;
      }
    }

    return await _client.post(method: 'addStickerToSet', formData: formData);
  }

  /// Use this method to move a sticker in a set created
  /// by the bot to a specific position.
  /// Returns **True** on success.
  ///
  /// https://core.telegram.org/bots/api#setstickerpositioninset
  Future<bool> setStickerPositionInSet(
      {@required String sticker, @required int position}) async {
    final formData =
        FormData.fromMap({'sticker': sticker, 'position': position});

    return await _client.post(
        method: 'setStickerPositionInSet', formData: formData);
  }

  /// Use this method to delete a sticker from a set created by the bot.
  /// Returns **True** on success.
  ///
  /// https://core.telegram.org/bots/api#deletestickerfromset
  Future<bool> deleteStickerFromSet({@required String sticker}) async {
    final formData = FormData.fromMap({'sticker': sticker});

    return await _client.post(
        method: 'deleteStickerFromSet', formData: formData);
  }

  /// Use this method to send answers to an inline query.
  /// On success, True is returned.
  ///
  /// No more than 50 results per query are allowed.
  ///
  /// https://core.telegram.org/bots/api#answerinlinequery
  Future<bool> answerInlineQuery(
      {@required String inlineQueryID,
      @required List<InlineQueryResult> results,
      int cacheTime,
      bool isPersonal,
      String nextOffset,
      String switchPmText,
      String switchPmParameters}) async {
    final formData = FormData.fromMap({
      'inline_query_id': inlineQueryID,
      'results': jsonEncode(results),
      'cache_time': cacheTime,
      'is_personal': isPersonal,
      'next_offset': nextOffset,
      'switch_pm_text': switchPmText,
      'switch_pm_parameter': switchPmParameters,
    });

    return await _client.post(method: 'answerInlineQuery', formData: formData);
  }

  /// Use this method to send invoices.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendinvoice
  Future<Message> sendInvoice(
      {@required int chatID,
      @required String title,
      @required String description,
      @required String payload,
      @required String providerToken,
      @required String startParameter,
      @required String currency,
      @required List<LabeledPrice> prices,
      String providerData,
      String photoUrl,
      int photoSize,
      int photoWidth,
      int photoHeight,
      bool needName,
      bool needPhoneNumber,
      bool needEmail,
      bool needShippingAddress,
      bool sendPhoneNumberToProvider,
      bool sendEmailToProvider,
      bool isFlexible,
      bool disableNotification,
      int replyToMessageID,
      InlineKeyboardMarkup replyMarkup}) async {
    final formData = FormData.fromMap({
      'chat_id': chatID,
      'title': title,
      'description': description,
      'payload': payload,
      'provider_token': providerToken,
      'start_parameter': startParameter,
      'currency': currency,
      'prices': jsonEncode(prices),
      'provider_data': providerData,
      'photo_url': photoUrl,
      'photo_size': photoSize,
      'photo_width': photoWidth,
      'photo_height': photoHeight,
      'need_name': needName,
      'need_phone_number': needPhoneNumber,
      'need_email': needEmail,
      'need_shipping_address': needShippingAddress,
      'send_phone_number_to_provider': sendPhoneNumberToProvider,
      'send_email_to_provider': sendEmailToProvider,
      'is_flexible': isFlexible,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageID,
      'reply_markup': jsonEncode(replyMarkup)
    });

    return Message.fromJson(
        await _client.post(method: 'sendInvoice', formData: formData));
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
      {@required String shippingQueryID,
      @required bool possible,
      List<ShippingOption> shippingOptions,
      String errorMessage}) async {
    if (!possible && (shippingOptions == null || errorMessage == null)) {
      return Future.error("If it's not possible, "
          'shipping_options and error_message can not be null.');
    }

    final formData = FormData.fromMap({
      'shipping_query_id': shippingQueryID,
      'ok': possible,
      'shipping_options': jsonEncode(shippingOptions),
      'error_message': errorMessage
    });

    return await _client.post(
        method: 'answerShippingQuery', formData: formData);
  }

  /// Once the user has confirmed their payment and shipping details,
  /// the Bot API sends the final confirmation in the form of
  /// an [Update] with the field pre_checkout_query.
  /// Use this method to respond to such pre-checkout queries.
  /// On success, True is returned.
  ///
  /// **Note:** The Bot API must receive an answer within 10 seconds
  /// after the pre-checkout query was sent.
  ///
  /// https://core.telegram.org/bots/api#answerprecheckoutquery
  Future<bool> answerPreCheckoutQuery(
      {@required String preCheckoutQueryID,
      @required bool possible,
      String errorMessage}) async {
    if (!possible && errorMessage == null) {
      return Future.error(ApiException(
          description: "If it's not possible, "
              'error_message can not be null.'));
    }
    final formData = FormData.fromMap({
      'pre_checkout_query_id': preCheckoutQueryID,
      'ok': possible,
      'error_message': errorMessage
    });

    return await _client.post(
        method: 'answerPreCheckoutQuery', formData: formData);
  }

  /// Informs a user that some of the Telegram Passport elements
  /// they provided contains errors.
  /// The user will not be able to re-submit their Passport
  /// to you until the errors are fixed
  /// (the contents of the field for which you returned the error
  /// must change).
  /// Returns **True** on success.
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
      {@required int userID,
      @required List<PassportElementError> errors}) async {
    final formData =
        FormData.fromMap({'user_id': userID, 'errors': jsonEncode(errors)});

    return await _client.post(
        method: 'setPassportDataErrors', formData: formData);
  }

  /// Use this method to send a game.
  /// On success, the sent [Message] is returned.
  ///
  /// https://core.telegram.org/bots/api#sendgame
  Future<Message> sendGame(
      {@required int chatID,
      @required String gameShortName,
      bool disableNotification,
      int replyToMessageID,
      InlineKeyboardMarkup replyMarkup}) async {
    final formData = FormData.fromMap({
      'chat_id': chatID,
      'game_short_name': gameShortName,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageID,
      'reply_markup': jsonEncode(replyMarkup)
    });

    return Message.fromJson(
        await _client.post(method: 'sendGame', formData: formData));
  }

  /// Use this method to set the score of the specified user in a game.
  /// On success, if the message was sent by the bot,
  /// returns the edited [Message], otherwise returns True.
  /// Returns an error, if the new score is not greater than the
  /// user's current score in the chat and force is False.
  ///
  /// https://core.telegram.org/bots/api#setgamescore
  Future<Message> setGameScore(
      {@required int userID,
      @required int score,
      bool force,
      bool disableEditMessage,
      int chatID,
      int messageID,
      String inlineMessageID}) async {
    if (inlineMessageID == null && (chatID == null || messageID == null)) {
      return Future.error(ApiException(
          description: 'At least inlineMessageID is required. '
              'Can be used also chatID and messageID.'));
    }

    final formData = FormData.fromMap({
      'user_id': userID,
      'score': score,
      'force': force,
      'disable_edit_message': disableEditMessage,
      'chat_id': chatID,
      'message_id': messageID,
      'inline_message_id': inlineMessageID
    });

    return Message.fromJson(
        await _client.post(method: 'setGameScore', formData: formData));
  }

  /// Use this method to get data for high score tables.
  /// Will return the score of the specified user and several
  /// of his neighbors in a game. On success, returns an
  /// Array of [GameHighScore] objects.
  ///
  /// https://core.telegram.org/bots/api#getgamehighscores
  Future<List<GameHighScore>> getGameHighScores(
      {@required int userID,
      int chatID,
      int messageID,
      String inlineMessageID}) async {
    if (inlineMessageID == null && (chatID == null || messageID == null)) {
      return Future.error(ApiException(
          description: 'At least inlineMessageID is required. '
              'Can be used also chatID and messageID.'));
    }

    final formData = FormData.fromMap({
      'user_id': userID,
      'chat_id': chatID,
      'message_id': messageID,
      'inline_message_id': inlineMessageID
    });

    return (await _client.post(method: 'getGameHighScores', formData: formData))
        .map<GameHighScore>(
            (gameHighScore) => GameHighScore.fromJson(gameHighScore))
        .toList();
  }

  /// Use this method to send a dice,
  /// which will have a random value from 1 to 6.
  /// On success, the sent [Message] is returned.
  /// (Yes, we're aware of the **“proper”** singular of **die**.
  /// But it's awkward, and we decided to help it change.
  /// One dice at a time!)
  Future<Message> sendDice(
      {@required ChatID chatID,
      bool disableNotification,
      int replyToMessageID,
      ReplyMarkup replyMarkup}) async {
    final formData = FormData.fromMap({
      'chat_id': chatID,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageID,
      'reply_markup': jsonEncode(replyMarkup)
    });

    return Message.fromJson(
        await _client.post(method: 'sendDice', formData: formData));
  }

  /// Use this method to get the current list of the bot's commands.
  /// Requires no parameters. Returns Array of [BotCommand] on success.
  ///
  /// https://core.telegram.org/bots/api#getmycommands
  Future<List<BotCommand>> getMyCommands() async {
    return (await _client.get(method: 'getMyCommands'))
        .map<BotCommand>((botCommand) => BotCommand.fromJson(botCommand))
        .toList();
  }

  /// Use this method to change the list of the bot's commands.
  /// Returns **True** on success.
  ///
  /// https://core.telegram.org/bots/api#setmycommands
  Future<bool> setMyCommands({@required List<BotCommand> commands}) async {
    for (var command in commands) {
      if (command.command == null || command.description == null) {
        return Future.error(PaperPlaneException(
            description: 'Check the commands, at least one is not correct.'));
      }
    }

    final formData = FormData.fromMap({'commands': commands});

    return await _client.post(method: 'setMyCommands', formData: formData);
  }

  /// Use this method to set the thumbnail of a sticker set.
  /// Animated thumbnails can be set for animated sticker sets only.
  /// Returns **True** on success.
  ///
  /// [thumb] argument accepts [Luggage] object.
  ///
  /// https://core.telegram.org/bots/api#setstickersetthumb
  Future<bool> setStickerSetThumb(
      {@required name, @required int user_id, Luggage thumb}) async {
    final formData = FormData.fromMap({'name': name, 'user_id': user_id});

    switch (thumb.type) {
      case 'link':
      case 'file_id':
        formData.fields.add(MapEntry('thumb', thumb.toString()));
        break;
      case 'file':
      case 'bytes':
        formData.files.add(MapEntry<String, MultipartFile>(
            'photo',
            MultipartFile.fromBytes(thumb.getBytes(),
                filename: thumb.getName(type: 'thumb'))));
        break;
    }

    return await _client.post(method: 'setStickerSetThumb', formData: formData);
  }
}
