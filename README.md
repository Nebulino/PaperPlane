<h1 align="center">PaperPlane</h1>

<div align="center">
Just a Telegram Library for Dart.
A package to interact with the official 

[Telegram Bot API](https://core.telegram.org/bots/api).

[![Dart Version](https://img.shields.io/badge/Dart-3.x-blue.svg?style=flat-square&logo=dart)](https://dart.dev)
[![Bot API](https://img.shields.io/badge/Bot%20API-v7.x-00aced.svg?style=flat-square&logo=telegram)](https://core.telegram.org/bots/api)
[![Nebulino](https://img.shields.io/badge/💬%20Telegram-Nebulino-blue.svg?style=flat-square)](https://t.me/Nebulino/)

</div>

## Disclaimer

I'm doing it just for fun, so... use at your own risk.

I hope it will become something great.

^-^

## Usage

First generate the code for Serializable (if you clone the repository):

```sh
dart run build_runner build
```

A simple usage example:

```dart
import 'dart:io' as io;
import 'package:paperplane/helpers.dart';
import 'package:paperplane/paperplane.dart';

void main() {
  const token = 'YOUR_BOT_TOKEN';
  
  final bot = PaperPlane.createBot(token: token);
  bot.engine();

  bot.startPolling();
  
  // Work with events...
  bot
    .onMessage()
    .where((message) => message.text == 'owo')
    .listen((message) => message.replyText(text: 'uwu'));
 
  // Work with updates and directly with API methods...
  final api = bot.api;
  final updater = bot.updater.onUpdate();
  
  updater
    .where((update) => update.message?.text == 'animate')
    .listen((update) {
      final chatId = update.message?.chat?.id;
      if (chatId != null) {
        api.sendAnimation(
          chatID: ChatID.fromID(chatId),
          animation: Luggage.withFile(file: io.File('./files/gifs/bunny_girl.gif')),
        );
      }
    });
}
```

## Get PaperPlane

Add PaperPlane dependency to `pubspec.yaml`:

From GitHub:
```yaml
dependencies:
  paperplane:
    git:
      url: https://github.com/Nebulino/PaperPlane.git
      ref: telegram-api-update
```

From pub.dev:
```yaml
dependencies:
  paperplane: ^0.7.0
```

## Features

- **Dart 3 Ready**: Full sound null safety and modern language features.
- **Modern Telegram Bot API**: Support for `ReplyParameters`, `LinkPreviewOptions`, `TextQuote`, `MessageId`.
- **Batch Message Operations**: `deleteMessages`, `forwardMessages`, `copyMessages`, `copyMessage`.
- **Forum Topics & Threads**: Message thread ID support across sending methods.
- **Media Customization**: Spoiler animations, captions above media, and content protection.
- **Convenient Helpers**: `Luggage` for file/stream uploads, `Message` extensions (`replyText`, `forward`, `copy`, `delete`).

Please file feature requests and bugs at the [issue tracker][tracker].

##### Copyright © 2020-2026 Nebulino

[tracker]: https://github.com/Nebulino/PaperPlane/issues
