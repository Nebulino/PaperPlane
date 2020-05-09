<h1 align="center">PaperPlane</h1>

<div align="center">
Just a Telegram Library for Dart.
A package to interact with the official 

[Telegram Bot API](https://core.telegram.org/bots/api).

[![Dart Version](https://img.shields.io/badge/Dart-2.8.0-blue.svg?style=flat-square&logo=dart)](https://dart.dev)
[![Build Status](https://img.shields.io/travis/Nebulino/PaperPlane/master?style=flat-square&logo=travis)](https://travis-ci.org/github/Nebulino/PaperPlane)
[![Bot API](https://img.shields.io/badge/Bot%20API-v.4.8-00aced.svg?style=flat-square&logo=telegram)](https://core.telegram.org/bots/api)
[![Nebulino](https://img.shields.io/badge/💬%20Telegram-Nebulino-blue.svg?style=flat-square)](https://t.me/Nebulino/)

</div>

## Disclaimer

I'm doing it just for fun, so... use at your own risk.

I hope it will become something great.

^-^

## Usage

First build the .g files for Serializable (if you clone the repo):

```pub run build_runner build```

A simple usage example:

```dart
import 'dart:io' as io;
import 'package:paperplane/paperplane.dart';

void main() {
  var token = 'Just A Token';
  
  var bot = PaperPlane.createBot(token);
  bot.engine();

  bot.startPolling();
  
  // Work with events...
  bot
    .onMessage()
    .where((message) => message.text == 'owo')
    .listen((message) => message.replyText(text: 'uwu'));
 
  // Work with updates and directly with methods...
  var api = bot.api;
  var updater = bot.updater.onUpdate();
  
  updater
    .where((onUpdate) => onUpdate.message.text == 'animate')
    .listen((update) => api.sendAnimation(
      chat_id: message.chat.id,
      animation: Luggage.withFile(file: io.File('./files/gifs/bunny_girl.gif'))));
}
```

## Get PaperPlane

Add PaperPlane dependency on `pubspec.yaml`:

From GitHub:
```yaml
dependencies:
  paperplane:
    git: https://github.com/Nebulino/PaperPlane.git
      ref: branch-name
```

From pub.dev:
```yaml
dependencies:
  paperplane: ^0.6.5
```

## Features and bugs

### All API up-to v4.8 are supported
#### Implemented a base for a future solid implementation of Long Polling

Still, the Webhook needs more tests.

You can use Long Polling mode for now. 

I have created all Telegram API Classes for each Telegram Types.

Please file feature requests and bugs at the [issue tracker][tracker].

##### Copyright © 2020 Nebulino

[tracker]: http://github.com/Nebulino/PaperPlane/issues
