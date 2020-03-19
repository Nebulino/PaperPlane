/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:paperplane/paperplane.dart';
import 'package:paperplane/src/core/types/chat_actions.dart';
import 'package:paperplane/src/core/types/parse_mode.dart';
import 'package:paperplane/src/core/types/poll_type.dart';
import 'package:paperplane/types.dart';

/// Helper for Message.
/// Each function have [quote_message] enabled.
/// It means it quotes the message you want to reply.
/// For disabling it, just set quote_message to False.
extension MessageHelper on Message {
  int get _chat_id => chat.id;

  int get _message_id => message_id;

  Methods get _methods => PaperPlane.fly.api.methods;

  /// Helps replying with a text directly.
  Future<Message> replyText(String text,
      {bool quote_message = true,
      ParseMode parse_mode,
      bool disable_web_page_preview,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _methods.sendMessage(_chat_id, text,
        parse_mode: parse_mode,
        disable_web_page_preview: disable_web_page_preview,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? _message_id : null,
        reply_markup: reply_markup);
  }

  /// Helps replying with a photo directly.
  Future<Message> replyPhoto(dynamic photo,
      {bool quote_message = true,
      String caption,
      ParseMode parse_mode,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _methods.sendPhoto(_chat_id, photo,
        caption: caption,
        parse_mode: parse_mode,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? _message_id : null,
        reply_markup: reply_markup);
  }

  /// Helps replying with an audio directly.
  Future<Message> replyAudio(dynamic audio,
      {bool quote_message = true,
      String caption,
      String parse_mode,
      dynamic duration,
      String performer,
      String title,
      dynamic thumb,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _methods.sendAudio(_chat_id, audio,
        caption: caption,
        parse_mode: parse_mode,
        duration: duration,
        performer: performer,
        title: title,
        thumb: thumb,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? _message_id : null);
  }

  /// Helps replying a document directly.
  Future<Message> replyDocument(dynamic document,
      {bool quote_message = true,
      dynamic thumb,
      String caption,
      String parse_mode,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _methods.sendDocument(_chat_id, document,
        thumb: thumb,
        caption: caption,
        parse_mode: parse_mode,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? _message_id : null,
        reply_markup: reply_markup);
  }

  /// Helps replying with a video directly.
  Future<Message> replyVideo(dynamic video,
      {bool quote_message = true,
      dynamic duration,
      int width,
      int height,
      dynamic thumb,
      String caption,
      String parse_mode,
      bool supports_streaming,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _methods.sendVideo(_chat_id, video,
        duration: duration,
        width: width,
        height: height,
        thumb: thumb,
        caption: caption,
        parse_mode: parse_mode,
        supports_streaming: supports_streaming,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? _message_id : null,
        reply_markup: reply_markup);
  }

  /// Helps replying with an animation directly.
  Future<Message> replyAnimation(dynamic animation,
      {bool quote_message = true,
      dynamic duration,
      int width,
      int height,
      dynamic thumb,
      String caption,
      String parse_mode,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _methods.sendAnimation(_chat_id, animation,
        duration: duration,
        width: width,
        height: height,
        thumb: thumb,
        caption: caption,
        parse_mode: parse_mode,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? _message_id : null,
        reply_markup: reply_markup);
  }

  /// Helps replying with a voice directly.
  Future<Message> replyVoice(dynamic voice,
      {bool quote_message = true,
      String caption,
      String parse_mode,
      dynamic duration,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _methods.sendVoice(_chat_id, voice,
        caption: caption,
        parse_mode: parse_mode,
        duration: duration,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? _message_id : null,
        reply_markup: reply_markup);
  }

  /// Helps replying with a video note directly.
  Future<Message> replyVideoNote(dynamic video_note,
      {bool quote_message = true,
      dynamic duration,
      int length,
      dynamic thumb,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _methods.sendVideoNote(_chat_id, video_note,
        duration: duration,
        length: length,
        thumb: thumb,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? _message_id : null,
        reply_markup: reply_markup);
  }

  /// Helps replying with a media group directly.
  Future<List<Message>> replyMediaGroup(List<InputMedia> media,
      {bool quote_message = true, bool disable_notification}) {
    return _methods.sendMediaGroup(_chat_id, media,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? _message_id : null);
  }

  /// Helps replying with a location directly.
  Future<Message> replyLocation(double latitude, double longitude,
      {bool quote_message = true,
      int live_period,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _methods.sendLocation(_chat_id, latitude, longitude,
        live_period: live_period,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? _message_id : null,
        reply_markup: reply_markup);
  }

  /// Helps replying with a venue directly.
  Future<Message> replyVenue(
      double latitude, double longitude, String title, String address,
      {bool quote_message = true,
      String foursquare_id,
      String foursquare_type,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _methods.sendVenue(_chat_id, latitude, longitude, title, address,
        foursquare_id: foursquare_id,
        foursquare_type: foursquare_type,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? _message_id : null,
        reply_markup: reply_markup);
  }

  /// Helps replying with a contact directly.
  Future<Message> replyContact(String phone_number, String first_name,
      {bool quote_message = true,
      String last_name,
      String vcard,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _methods.sendContact(_chat_id, phone_number, first_name,
        last_name: last_name,
        vcard: vcard,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? _message_id : null,
        reply_markup: reply_markup);
  }

  /// Helps replying with a poll directly.
  Future<Message> replyPoll(String question, List<String> options,
      {bool quote_message = true,
      bool is_anonymous,
      PollType type,
      bool allows_multiple_answers,
      int correct_option_id,
      bool is_closed,
      bool disable_notification,
      ReplyMarkup reply_markup}) {
    return _methods.sendPoll(_chat_id, question, options,
        is_anonymous: is_anonymous,
        type: type,
        allows_multiple_answers: allows_multiple_answers,
        correct_option_id: correct_option_id,
        is_closed: is_closed,
        disable_notification: disable_notification,
        reply_to_message_id: quote_message ? _message_id : null,
        reply_markup: reply_markup);
  }

  /// Helps replying with a chat action directly.
  Future<bool> replyChatAction(ChatAction action) {
    return _methods.sendChatAction(_chat_id, action);
  }
}
