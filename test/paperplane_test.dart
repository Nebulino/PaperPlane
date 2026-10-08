import 'package:paperplane/helpers.dart';
//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

import 'package:paperplane/paperplane.dart';
import 'package:paperplane/telegram.dart';
import 'package:test/test.dart';

// Some PaperPlane tests
void main() {
  group('A group of tests', () {
    late PaperPlane paperplane;
    late String token;
    ParseMode? parseMode;

    setUp(() {
      token = 'Just a token.';
      paperplane = PaperPlane.createBot(token: token);
      parseMode = null;
    });

    test('PaperPlane Tests', () {
      expect(paperplane, isA<PaperPlane>());
      expect(paperplane.token, isA<String>());
      expect(parseMode.toString(), isA<String>());
    });

    test('ReplyParameters serialization', () {
      final replyParams = ReplyParameters(
        messageID: 123,
        quote: 'hello quote',
        allowSendingWithoutReply: true,
      );
      final json = replyParams.toJson();
      expect(json['message_id'], equals(123));
      expect(json['quote'], equals('hello quote'));
      expect(json['allow_sending_without_reply'], isTrue);

      final fromJson = ReplyParameters.fromJson(json);
      expect(fromJson.messageID, equals(123));
      expect(fromJson.quote, equals('hello quote'));
      expect(fromJson.allowSendingWithoutReply, isTrue);
    });

    test('LinkPreviewOptions serialization', () {
      final options = LinkPreviewOptions(
        isDisabled: true,
        preferSmallMedia: true,
        showAboveText: false,
      );
      final json = options.toJson();
      expect(json['is_disabled'], isTrue);
      expect(json['prefer_small_media'], isTrue);
      expect(json['show_above_text'], isFalse);

      final fromJson = LinkPreviewOptions.fromJson(json);
      expect(fromJson.isDisabled, isTrue);
      expect(fromJson.preferSmallMedia, isTrue);
      expect(fromJson.showAboveText, isFalse);
    });

    test('TextQuote serialization', () {
      final quote = TextQuote(
        text: 'quoted text',
        position: 10,
        isManual: true,
      );
      final json = quote.toJson();
      expect(json['text'], equals('quoted text'));
      expect(json['position'], equals(10));
      expect(json['is_manual'], isTrue);

      final fromJson = TextQuote.fromJson(json);
      expect(fromJson.text, equals('quoted text'));
      expect(fromJson.position, equals(10));
      expect(fromJson.isManual, isTrue);
    });

    test('MessageId serialization', () {
      final msgId = MessageId(messageID: 999);
      final json = msgId.toJson();
      expect(json['message_id'], equals(999));

      final fromJson = MessageId.fromJson(json);
      expect(fromJson.messageID, equals(999));
    });

    test('MessageEntityType constants', () {
      expect(MessageEntityType.Spoiler.toString(), equals('spoiler'));
      expect(MessageEntityType.Blockquote.toString(), equals('blockquote'));
      expect(MessageEntityType.ExpandableBlockquote.toString(),
          equals('expandable_blockquote'));
      expect(MessageEntityType.CustomEmoji.toString(), equals('custom_emoji'));
    });
  });
}
