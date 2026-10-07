//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

/// A list of [Poll] types for telegram.
enum PollType {
  QUIZ,
  REGULAR,
}

extension PollTypeExtension on PollType {
  String get type => switch (this) {
        PollType.QUIZ => 'quiz',
        PollType.REGULAR => 'regular',
      };
}
