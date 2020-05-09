//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

part of inline;

/// Represents a [result] of an inline query that was chosen by the user and sent to their chat partner.
///
/// **Note:** It is necessary to enable [inline feedback] via [@Botfather] in order to receive these objects in updates.
///
/// [result]: https://core.telegram.org/bots/api#inlinequeryresult
/// [inline feedback]: https://core.telegram.org/bots/inline#collecting-feedback
/// [@Botfather]: https://t.me/botfather
///
/// https://core.telegram.org/bots/api#choseninlineresult
@JsonSerializable(includeIfNull: false)
class ChosenInlineResult {
  ///	The unique identifier for the result that was chosen.
  @JsonKey(name: 'result_id', required: true)
  String resultID;

  /// The user that chose the result.
  @JsonKey(name: 'from', required: true)
  User from;

  /// *Optional.* Sender location, only for bots that require user location
  @JsonKey(name: 'location')
  Location location;

  /// *Optional.* Identifier of the sent inline message.
  /// Available only if there is an [inline keyboard]
  /// attached to the message.
  /// Will be also received in [callback queries] and can
  /// be used to [edit] the message.
  ///
  /// [inline keyboard]: https://core.telegram.org/bots/api#inlinekeyboardmarkup
  /// [callback queries]: https://core.telegram.org/bots/api#callbackquery
  /// [edit]: https://core.telegram.org/bots/api#updating-messages
  @JsonKey(name: 'inline_message_id')
  String inlineMessageID;

  /// The query that was used to obtain the result.
  @JsonKey(name: 'query', required: true)
  String query;

  ChosenInlineResult({
    this.resultID,
    this.from,
    this.location,
    this.inlineMessageID,
    this.query,
  });

  factory ChosenInlineResult.fromJson(Map<String, dynamic> json) =>
      _$ChosenInlineResultFromJson(json);

  Map<String, dynamic> toJson() => _$ChosenInlineResultToJson(this);
}
