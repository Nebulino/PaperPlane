/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:paperplane/helpers.dart';
import 'package:paperplane/paperplane.dart';
import 'package:paperplane/telegram.dart' show BotCommand;

import 'test_values.dart';

// Usage of v4.7 api.
void main() async {
  final paperplane = PaperPlane.createBot(token: TestValues.TOKEN);

  await paperplane.engine();

  final api = paperplane.api;

  var commands = <BotCommand>[];

  final start_command =
      BotCommand(command: 'start', description: 'Start me with this.');

  final help_command = BotCommand(command: 'help', description: 'Neeed help?');

  commands.addAll([start_command, help_command]);

  final validate = await api.setMyCommands(commands: commands);

  await api.sendMessage(
      chatID: ChatID.fromID(TestValues.DEV),
      text: '${start_command.command} and '
          '${help_command.command} set: ${validate}');

  final message_commands = await api.getMyCommands();
  print(message_commands);

  await api.sendDice(chatID: ChatID.fromID(TestValues.DEV));
}
