/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:paperplane/helpers.dart';
import 'package:paperplane/paperplane.dart';
import 'package:paperplane/telegram.dart';

import 'test_values.dart';

void main() {
  final paperplane = PaperPlane.createBot(token: TestValues.TOKEN);

  paperplane.engine();
  paperplane.startPolling();

  paperplane.onInlineQuery().listen((query) =>
      paperplane.api.answerInlineQuery(inlineQueryID: query.id, results: [
        InlineQueryResultArticle()
          ..id = 'test'
          ..title = 'test'
          ..inputMessageContent = (InputTextMessageContent()
            ..messageText = '*done!*'
            ..parse_mode = ParseMode.MARKDOWN.toString())
      ]));
}
