/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of core;

/// This object represents a bot command.
///
/// https://core.telegram.org/bots/api#botcommand
@JsonSerializable(includeIfNull: false)
class BotCommand {
  String command;
  String description;

  BotCommand({this.command, this.description});

  factory BotCommand.fromJson(Map<String, dynamic> json) =>
      _$BotCommandFromJson(json);

  Map<String, dynamic> toJson() => _$BotCommandToJson(this);
}
