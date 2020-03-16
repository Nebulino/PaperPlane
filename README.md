<h1 align="center">PaperPlane</h1>

<div align="center">
Just a Telegram Library for Dart.
A package to interact with the official 

[Telegram Bot API](https://core.telegram.org/bots/api).

[![Dart Version](https://img.shields.io/badge/Dart-2.7.1-blue.svg?style=flat-square&logo=dart)](https://dart.dev)
[![Build Status](https://img.shields.io/travis/Nebulino/PaperPlane/master?style=flat-square&logo=travis)](https://travis-ci.org/github/Nebulino/PaperPlane)
[![Bot API](https://img.shields.io/badge/Bot%20API-v.4.6-00aced.svg?style=flat-square&logo=telegram)](https://core.telegram.org/bots/api)
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
import 'package:paperplane/paperplane.dart';

void main() async {
  var token = 'Just A Token';
  
  var bot = PaperPlane.createBot(token);
  bot.init();
}
```

## Get PaperPlane

Add PaperPlane dependency on `pubspec.yaml`:

From GitHub:
```yaml
dependencies:
  paperplane:
    git: https://github.com/Nebulino/PaperPlane.git
```

From pub.dev:
```yaml
dependencies:
  paperplane: ^0.3.5
```

## Features and bugs

#### For now, some methods are working.
Still not implemented the LongPolling and Webhook.
You can use it for now by doing a while(true). 

I have created all Telegram API Classes for each Telegram Types.

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://github.com/Nebulino/PaperPlane/issues

Copyright © 2020 Nebulino
