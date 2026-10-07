//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

part of '../message.dart';

/// Describes reply parameters for the message that is being sent.
///
/// See https://core.telegram.org/bots/api#replyparameters
@JsonSerializable(includeIfNull: false)
class ReplyParameters {
  /// Identifier of the message that will be replied to in the current chat,
  /// or in the chat [chatID] if it is specified.
  @JsonKey(name: 'message_id', required: true)
  int? messageID;

  /// Unique identifier for the target chat or username of the target channel
  /// (in the format `@channelusername`) if the message is from a different chat.
  @JsonKey(name: 'chat_id')
  dynamic chatID;

  /// Whether the message should be sent even if the specified message
  /// to be replied to is not found.
  @JsonKey(name: 'allow_sending_without_reply')
  bool? allowSendingWithoutReply;

  /// Quoted part of the message to be replied to.
  ///
  /// Can be between 0 and 1024 characters after entities parsing.
  @JsonKey(name: 'quote')
  String? quote;

  /// Mode for parsing entities in the quote.
  ///
  /// See [ParseMode] for more information.
  @JsonKey(name: 'quote_parse_mode')
  String? quoteParseMode;

  /// A list of special entities that appear in the quote.
  ///
  /// Can be specified instead of [quoteParseMode].
  @JsonKey(name: 'quote_entities')
  List<MessageEntity>? quoteEntities;

  /// Position of the quote in the original message in UTF-16 code units.
  @JsonKey(name: 'quote_position')
  int? quotePosition;

  ReplyParameters({
    this.messageID,
    this.chatID,
    this.allowSendingWithoutReply,
    this.quote,
    this.quoteParseMode,
    this.quoteEntities,
    this.quotePosition,
  });

  factory ReplyParameters.fromJson(Map<String, dynamic> json) =>
      _$ReplyParametersFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyParametersToJson(this);
}
