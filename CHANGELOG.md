## 0.6.3
#### Big update.

- Updated to Telegram API v4.8.
- Modified some docs.
- Modified examples and created dice/dart example.
- Created DiceType to control which emoji are usable.

## 0.6.2
#### Fixed LongPolling setup.

- Removed for now UpdateType. Need to check the behaviour.

## 0.6.1
#### Hello Webhook!

- A webhook implementation test.

## 0.6.0+1

- Fixed DateTime from Unix int in seconds from telegram and vice versa.

## 0.6.0
#### Hello Primitives!

- Started using Dart Primitives for some parameters in Telegram API Library.
- Started renaming all variables to follow Dart Effective Language Rules.
- Created EncryptedPassportElementType.
- Converted some types into enums.
- Created a helper to transform every response from int to Dart Primitives.
- More documentation.

## 0.5.2
#### Big update.

- Updated to Telegram API v4.7.
- Modified some docs.
- Created new examples.
- Implemented and modified ChatID.
- Transformed some types into enums.
- Modified TelegramClient to remove null fields.

## 0.5.1

- Fixed a problem with the dispatcher.
- Cleaned some part of code.
- Hide the TelegramClient part.
- Removed UUID package and created just a simple String Generator Helper.

## 0.5.0
#### Huge package rewrite.
##### Now all Telegram API v4.6 are supported.
     
- Fixed sendMediaGroup. 
- Started using Dio as HTTPClient => TelegramClient.
- Rewritten Response Class => TelegramResponse.
- Created more Helpers such as Luggage and InputMediaLuggage for better File management.
- Created more Extensions.
- Duration is now only Duration type.
- Written some function in PaperPlane.dart for managing LongPolling.
- Rewritten some part of the package.
- Refactored some functions.
- Testing a ChatIdentifier object to manage functions that accepts int chat_id and String chat_id 
    (for groups and channels).
- Remove some un-necessary exceptions.
- Rewritten "clean" scripts.
- More to come...

## 0.4.4

- Fixed the example.
- Added MessageEntityType.
- Fixed export.

## 0.4.3

- Implemented clean mode polling.
- Implemented bot stopping.
- Fixed blob sending.

## 0.4.2
#### Another update.

- Fixed Telegram API v.4.6.
- Created PollAnswer.
- Created KeyboardButtonPollType.
- Updated Update object.
- Updated MessageEntity.
- Fixed CHANGELOG.md.

## 0.4.1
#### A new step for the docs, and more...

- Updated some methods.
- Created some extensions.
- Updated all Telegram API types documentation.
- Implemented replyLocation.
- Some refactoring.

## 0.4.0
#### Huge Update. Basic polling!

- Implemented a basic long polling implementation.
- To achieve this, created Updater.
- Created messages dispatcher.
- Created message extension.
- Refactored some part of the code.

## 0.3.0
#### Big update.

- Finished implementing all Telegram Api Methods.
- TODO: make possible using @username in chat_id in some methods.

## 0.2.2

- Implemented more methods.
- Modified some docs.
- Created PollType for Telegram 4.6.

## 0.2.1

- TODO: create a list of implemented methods.
- Changed the version on pubspec.yaml.

## 0.2.0
#### Big update.

- Modified PaperPlane class, it can make bots now.
- Created Telegram Class, it helps bridging PaperPlane and Telegram Api methods.
- Created methods class, it contains Telegram Api methods needs to be completed.
- Created chat_actions class.
- Created parse_mode class.
- Created some helpers such as bot_file, constant and paperplane_bot local type.
- Fixed the previous commit, without http_client class.


## 0.1.3

- Created HTTP Client class in tools.
- Created Exceptions Classes in exceptions.
- Added some docs for Telegram API types and other classes.
- Updated README.md.

## 0.1.2

- Created a 'publish' branch for publishing into pub.dev.

## 0.1.1

- Created a 'dev' branch to keep the repo tidy.
- Preparing for publishing on pub.dev.
- Added LICENSE.

## 0.1.0
#### Pre-release

- First Pre-release, no Telegram methods implemented.
- Modified the README.md to make it more appealing.
- Created all Telegram API types Classes.
- Added functions in each types fromJson and toJson.
- Added some Script for building and cleaning.

## 0.0.1

- Initial version. Created the Package's repo structure.
