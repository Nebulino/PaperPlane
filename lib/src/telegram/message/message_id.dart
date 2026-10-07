//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

part of '../message.dart';

/// This object represents a unique message identifier.
///
/// See https://core.telegram.org/bots/api#messageid
@JsonSerializable(includeIfNull: false)
class MessageId {
  /// Unique message identifier.
  @JsonKey(name: 'message_id', required: true)
  int? messageID;

  MessageId({
    this.messageID,
  });

  factory MessageId.fromJson(Map<String, dynamic> json) =>
      _$MessageIdFromJson(json);

  Map<String, dynamic> toJson() => _$MessageIdToJson(this);
}
