/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:meta/meta.dart';
import 'package:paperplane/helpers.dart';
import 'package:paperplane/paperplane.dart';
import 'package:paperplane/telegram.dart';

/// Helper for Message.
/// Each function have [quote_message] enabled.
/// It means it quotes the message you want to reply.
/// For disabling it, just set quote_message to False.
extension MessageHelper on Message {
  API get _api => PaperPlane.fly.api;

  /// Helps replying with a text directly.
  Future<Message> replyText(
      {@required String text,
      bool quote_message = true,
      ParseMode parse_mode,
      bool disable_web_page_preview,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _api.sendMessage(
        chat_id: ChatID.fromID(chat.id),
        text: text,
        parse_mode: parse_mode,
        disable_web_page_preview: disable_web_page_preview,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? message_id : null,
        reply_markup: reply_markup);
  }

  /// Helps replying with a photo directly.
  Future<Message> replyPhoto(
      {@required Luggage photo,
      bool quote_message = true,
      String caption,
      ParseMode parse_mode,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _api.sendPhoto(
        chat_id: ChatID.fromID(chat.id),
        photo: photo,
        caption: caption,
        parse_mode: parse_mode,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? message_id : null,
        reply_markup: reply_markup);
  }

  /// Helps replying with an audio directly.
  Future<Message> replyAudio(
      {@required Luggage audio,
      bool quote_message = true,
      String caption,
      ParseMode parse_mode,
      Duration duration,
      String performer,
      String title,
      Luggage thumb,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _api.sendAudio(
        chat_id: ChatID.fromID(chat.id),
        audio: audio,
        caption: caption,
        parse_mode: parse_mode,
        duration: duration,
        performer: performer,
        title: title,
        thumb: thumb,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? message_id : null);
  }

  /// Helps replying a document directly.
  Future<Message> replyDocument(
      {@required Luggage document,
      bool quote_message = true,
      Luggage thumb,
      String caption,
      ParseMode parse_mode,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _api.sendDocument(
        chat_id: ChatID.fromID(chat.id),
        document: document,
        thumb: thumb,
        caption: caption,
        parse_mode: parse_mode,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? message_id : null,
        reply_markup: reply_markup);
  }

  /// Helps replying with a video directly.
  Future<Message> replyVideo(
      {@required Luggage video,
      bool quote_message = true,
      Duration duration,
      int width,
      int height,
      Luggage thumb,
      String caption,
      ParseMode parse_mode,
      bool supports_streaming,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _api.sendVideo(
        chat_id: ChatID.fromID(chat.id),
        video: video,
        duration: duration,
        width: width,
        height: height,
        thumb: thumb,
        caption: caption,
        parse_mode: parse_mode,
        supports_streaming: supports_streaming,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? message_id : null,
        reply_markup: reply_markup);
  }

  /// Helps replying with an animation directly.
  Future<Message> replyAnimation(
      {@required Luggage animation,
      bool quote_message = true,
      Duration duration,
      int width,
      int height,
      Luggage thumb,
      String caption,
      ParseMode parse_mode,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _api.sendAnimation(
        chat_id: ChatID.fromID(chat.id),
        animation: animation,
        duration: duration,
        width: width,
        height: height,
        thumb: thumb,
        caption: caption,
        parse_mode: parse_mode,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? message_id : null,
        reply_markup: reply_markup);
  }

  /// Helps replying with a voice directly.
  Future<Message> replyVoice(
      {@required voice,
      bool quote_message = true,
      String caption,
      ParseMode parse_mode,
      Duration duration,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _api.sendVoice(
        chat_id: ChatID.fromID(chat.id),
        voice: voice,
        caption: caption,
        parse_mode: parse_mode,
        duration: duration,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? message_id : null,
        reply_markup: reply_markup);
  }

  /// Helps replying with a video note directly.
  Future<Message> replyVideoNote(
      {@required video_note,
      bool quote_message = true,
      Duration duration,
      int length,
      Luggage thumb,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _api.sendVideoNote(
        chat_id: ChatID.fromID(chat.id),
        video_note: video_note,
        duration: duration,
        length: length,
        thumb: thumb,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? message_id : null,
        reply_markup: reply_markup);
  }

  /// Helps replying with a media group directly.
  Future<List<Message>> replyMediaGroup(
      {@required List<InputMediaLuggage> media,
      bool quote_message = true,
      bool disable_notification}) {
    return _api.sendMediaGroup(
        chat_id: ChatID.fromID(chat.id),
        media: media,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? message_id : null);
  }

  /// Helps replying with a location directly.
  Future<Message> replyLocation(
      {@required double latitude,
      @required double longitude,
      bool quote_message = true,
      int live_period,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _api.sendLocation(
        chat_id: ChatID.fromID(chat.id),
        latitude: latitude,
        longitude: longitude,
        live_period: live_period,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? message_id : null,
        reply_markup: reply_markup);
  }

  /// Helps replying with a venue directly.
  Future<Message> replyVenue(
      {@required double latitude,
      @required double longitude,
      @required String title,
      @required String address,
      bool quote_message = true,
      String foursquare_id,
      String foursquare_type,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _api.sendVenue(
        chat_id: ChatID.fromID(chat.id),
        latitude: latitude,
        longitude: longitude,
        title: title,
        address: address,
        foursquare_id: foursquare_id,
        foursquare_type: foursquare_type,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? message_id : null,
        reply_markup: reply_markup);
  }

  /// Helps replying with a contact directly.
  Future<Message> replyContact(
      {@required String phone_number,
      @required String first_name,
      bool quote_message = true,
      String last_name,
      String vcard,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _api.sendContact(
        chat_id: ChatID.fromID(chat.id),
        phone_number: phone_number,
        first_name: first_name,
        last_name: last_name,
        vcard: vcard,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? message_id : null,
        reply_markup: reply_markup);
  }

  /// Helps replying with a poll directly.
  Future<Message> replyPoll(
      {@required String question,
      @required List<String> options,
      bool quote_message = true,
      bool is_anonymous,
      PollType type,
      bool allows_multiple_answers,
      int correct_option_id,
      bool is_closed,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _api.sendPoll(
        chat_id: ChatID.fromID(chat.id),
        question: question,
        options: options,
        is_anonymous: is_anonymous,
        type: type,
        allows_multiple_answers: allows_multiple_answers,
        correct_option_id: correct_option_id,
        is_closed: is_closed,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? message_id : null,
        reply_markup: reply_markup);
  }

  /// Helps replying with a chat action directly.
  Future<bool> replyChatAction({@required ChatAction action}) {
    return _api.sendChatAction(chat_id: ChatID.fromID(chat.id), action: action);
  }

  /// Helps replying with a dice directly.
  Future<Message> replyDice(
      {bool quote_message = true,
      bool disable_notification,
      ReplyMarkup reply_markup}) async {
    return _api.sendDice(
        chat_id: ChatID.fromID(chat.id),
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? message_id : null,
        reply_markup: reply_markup);
  }
}
