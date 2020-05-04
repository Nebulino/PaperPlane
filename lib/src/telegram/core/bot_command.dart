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
  /// Text of the command, 1-32 characters.
  /// Can contain only lowercase English letters, digits and underscores.
  @JsonKey(name: 'command', required: true)
  String command;

  /// Description of the command, 3-256 characters.
  @JsonKey(name: 'description', required: true)
  String description;

  BotCommand({
    this.command,
    this.description,
  });

  factory BotCommand.fromJson(Map<String, dynamic> json) =>
      _$BotCommandFromJson(json);

  Map<String, dynamic> toJson() => _$BotCommandToJson(this);
}
