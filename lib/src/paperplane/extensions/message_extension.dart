//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

import 'package:paperplane/helpers.dart';
import 'package:paperplane/paperplane.dart';
import 'package:paperplane/telegram.dart';

/// Helper for Message.
/// Each function have [quoteMessage] enabled.
/// It means it quotes the message you want to reply.
/// For disabling it, just set quoteMessage to False.
extension MessageHelper on Message {
  API get _api => PaperPlane.fly!.api;

  /// Helps replying with a text directly.
  Future<Message> replyText({
    required String text,
    bool quoteMessage = true,
    ParseMode? parseMode,
    bool? disableWebPagePreview,
    bool? disableNotification,
    ReplyMarkup? replyMarkup,
  }) {
    return _api.sendMessage(
      chatID: ChatID.fromID(chat?.id ?? 0),
      text: text,
      parseMode: parseMode,
      disableWebPagePreview: disableWebPagePreview,
      disableNotification: disableNotification,
      replyToMessageID: quoteMessage ? messageID : null,
      replyMarkup: replyMarkup,
    );
  }

  /// Helps replying with a photo directly.
  Future<Message> replyPhoto({
    required Luggage photo,
    bool quoteMessage = true,
    String? caption,
    ParseMode? parseMode,
    bool? disableNotification,
    ReplyMarkup? replyMarkup,
  }) {
    return _api.sendPhoto(
      chatID: ChatID.fromID(chat?.id ?? 0),
      photo: photo,
      caption: caption,
      parseMode: parseMode,
      disableNotification: disableNotification,
      replyToMessageID: quoteMessage ? messageID : null,
      replyMarkup: replyMarkup,
    );
  }

  /// Helps replying with an audio directly.
  Future<Message> replyAudio({
    required Luggage audio,
    bool quoteMessage = true,
    String? caption,
    ParseMode? parseMode,
    Duration? duration,
    String? performer,
    String? title,
    Luggage? thumb,
    bool? disableNotification,
    ReplyMarkup? replyMarkup,
  }) {
    return _api.sendAudio(
        chatID: ChatID.fromID(chat?.id ?? 0),
        audio: audio,
        caption: caption,
        parseMode: parseMode,
        duration: duration,
        performer: performer,
        title: title,
        thumb: thumb,
        disableNotification: disableNotification,
        replyToMessageID: quoteMessage ? messageID : null);
  }

  /// Helps replying a document directly.
  Future<Message> replyDocument({
    required Luggage document,
    bool quoteMessage = true,
    Luggage? thumb,
    String? caption,
    ParseMode? parseMode,
    bool? disableNotification,
    ReplyMarkup? replyMarkup,
  }) {
    return _api.sendDocument(
      chatID: ChatID.fromID(chat?.id ?? 0),
      document: document,
      thumb: thumb,
      caption: caption,
      parseMode: parseMode,
      disableNotification: disableNotification,
      replyToMessageID: quoteMessage ? messageID : null,
      replyMarkup: replyMarkup,
    );
  }

  /// Helps replying with a video directly.
  Future<Message> replyVideo({
    required Luggage video,
    bool quoteMessage = true,
    Duration? duration,
    int? width,
    int? height,
    Luggage? thumb,
    String? caption,
    ParseMode? parseMode,
    bool? supportsStreaming,
    bool? disableNotification,
    ReplyMarkup? replyMarkup,
  }) {
    return _api.sendVideo(
      chatID: ChatID.fromID(chat?.id ?? 0),
      video: video,
      duration: duration,
      width: width,
      height: height,
      thumb: thumb,
      caption: caption,
      parseMode: parseMode,
      supportsStreaming: supportsStreaming,
      disableNotification: disableNotification,
      replyToMessageID: quoteMessage ? messageID : null,
      replyMarkup: replyMarkup,
    );
  }

  /// Helps replying with an animation directly.
  Future<Message> replyAnimation({
    required Luggage animation,
    bool quoteMessage = true,
    Duration? duration,
    int? width,
    int? height,
    Luggage? thumb,
    String? caption,
    ParseMode? parseMode,
    bool? disableNotification,
    ReplyMarkup? replyMarkup,
  }) {
    return _api.sendAnimation(
      chatID: ChatID.fromID(chat?.id ?? 0),
      animation: animation,
      duration: duration,
      width: width,
      height: height,
      thumb: thumb,
      caption: caption,
      parseMode: parseMode,
      disableNotification: disableNotification,
      replyToMessageID: quoteMessage ? messageID : null,
      replyMarkup: replyMarkup,
    );
  }

  /// Helps replying with a voice directly.
  Future<Message> replyVoice({
    required Luggage voice,
    bool quoteMessage = true,
    String? caption,
    ParseMode? parseMode,
    Duration? duration,
    bool? disableNotification,
    ReplyMarkup? replyMarkup,
  }) {
    return _api.sendVoice(
      chatID: ChatID.fromID(chat?.id ?? 0),
      voice: voice,
      caption: caption,
      parseMode: parseMode,
      duration: duration,
      disableNotification: disableNotification,
      replyToMessageID: quoteMessage ? messageID : null,
      replyMarkup: replyMarkup,
    );
  }

  /// Helps replying with a video note directly.
  Future<Message> replyVideoNote({
    required Luggage videoNote,
    bool quoteMessage = true,
    Duration? duration,
    int? length,
    Luggage? thumb,
    bool? disableNotification,
    ReplyMarkup? replyMarkup,
  }) {
    return _api.sendVideoNote(
      chatID: ChatID.fromID(chat?.id ?? 0),
      videoNote: videoNote,
      duration: duration,
      length: length,
      thumb: thumb,
      disableNotification: disableNotification,
      replyToMessageID: quoteMessage ? messageID : null,
      replyMarkup: replyMarkup,
    );
  }

  /// Helps replying with a media group directly.
  Future<List<Message>> replyMediaGroup({
    required List<InputMediaLuggage> media,
    bool quoteMessage = true,
    bool? disableNotification,
  }) {
    return _api.sendMediaGroup(
      chatID: ChatID.fromID(chat?.id ?? 0),
      media: media,
      disableNotification: disableNotification,
      replyToMessageID: quoteMessage ? messageID : null,
    );
  }

  /// Helps replying with a location directly.
  Future<Message> replyLocation({
    required double latitude,
    required double longitude,
    bool quoteMessage = true,
    int? livePeriod,
    bool? disableNotification,
    ReplyMarkup? replyMarkup,
  }) {
    return _api.sendLocation(
      chatID: ChatID.fromID(chat?.id ?? 0),
      latitude: latitude,
      longitude: longitude,
      livePeriod: livePeriod,
      disableNotification: disableNotification,
      replyToMessageID: quoteMessage ? messageID : null,
      replyMarkup: replyMarkup,
    );
  }

  /// Helps replying with a venue directly.
  Future<Message> replyVenue({
    required double latitude,
    required double longitude,
    required String title,
    required String address,
    bool quoteMessage = true,
    String? foursquareId,
    String? foursquareType,
    bool? disableNotification,
    ReplyMarkup? replyMarkup,
  }) {
    return _api.sendVenue(
      chatID: ChatID.fromID(chat?.id ?? 0),
      latitude: latitude,
      longitude: longitude,
      title: title,
      address: address,
      foursquareID: foursquareId,
      foursquareType: foursquareType,
      disableNotification: disableNotification,
      replyToMessageID: quoteMessage ? messageID : null,
      replyMarkup: replyMarkup,
    );
  }

  /// Helps replying with a contact directly.
  Future<Message> replyContact({
    required String phoneNumber,
    required String firstName,
    bool quoteMessage = true,
    String? lastName,
    String? vcard,
    bool? disableNotification,
    ReplyMarkup? replyMarkup,
  }) {
    return _api.sendContact(
      chatID: ChatID.fromID(chat?.id ?? 0),
      phoneNumber: phoneNumber,
      firstName: firstName,
      lastName: lastName,
      vcard: vcard,
      disableNotification: disableNotification,
      replyToMessageID: quoteMessage ? messageID : null,
      replyMarkup: replyMarkup,
    );
  }

  /// Helps replying with a poll directly.
  Future<Message> replyPoll({
    required String question,
    required List<String> options,
    bool quoteMessage = true,
    bool? isAnonymous,
    PollType? type,
    bool? allowsMultipleAnswers,
    int? correctOptionId,
    String? explanation,
    ParseMode? explanationParseMode,
    Duration? openPeriod,
    DateTime? closeDate,
    bool? isClosed,
    bool? disableNotification,
    ReplyMarkup? replyMarkup,
  }) {
    return _api.sendPoll(
      chatID: ChatID.fromID(chat?.id ?? 0),
      question: question,
      options: options,
      isAnonymous: isAnonymous,
      type: type,
      allowsMultipleAnswers: allowsMultipleAnswers,
      correctOptionID: correctOptionId,
      explanation: explanation,
      explanationParseMode: explanationParseMode,
      openPeriod: openPeriod,
      closeDate: closeDate,
      isClosed: isClosed,
      disableNotification: disableNotification,
      replyToMessageID: quoteMessage ? messageID : null,
      replyMarkup: replyMarkup,
    );
  }

  /// Helps replying with a chat action directly.
  Future<bool> replyChatAction({
    required ChatAction action,
  }) {
    return _api.sendChatAction(
      chatID: ChatID.fromID(chat?.id ?? 0),
      action: action,
    );
  }

  /// Helps replying with a dice directly.
  Future<Message> replyDice({
    DiceType? emoji,
    bool quoteMessage = true,
    bool? disableNotification,
    ReplyMarkup? replyMarkup,
  }) async {
    return _api.sendDice(
      chatID: ChatID.fromID(chat?.id ?? 0),
      emoji: emoji,
      disableNotification: disableNotification,
      replyToMessageID: quoteMessage ? messageID : null,
      replyMarkup: replyMarkup,
    );
  }
}
