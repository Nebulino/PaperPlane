/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// This object represents an error in the Telegram Passport element
/// which was submitted that should be resolved by the user.
/// It should be one of:
/// * [PassportElementErrorDataField](https://core.telegram.org/bots/api#passportelementerrordatafield)
/// * [PassportElementErrorFrontSide](https://core.telegram.org/bots/api#passportelementerrorfrontside)
/// * [PassportElementErrorReverseSide](https://core.telegram.org/bots/api#passportelementerrorreverseside)
/// * [PassportElementErrorSelfie](https://core.telegram.org/bots/api#passportelementerrorselfie)
/// * [PassportElementErrorFile](https://core.telegram.org/bots/api#passportelementerrorfile)
/// * [PassportElementErrorFiles](https://core.telegram.org/bots/api#passportelementerrorfiles)
/// * [PassportElementErrorTranslationFile](https://core.telegram.org/bots/api#passportelementerrortranslationfile)
/// * [PassportElementErrorTranslationFiles](https://core.telegram.org/bots/api#passportelementerrortranslationfiles)
/// * [PassportElementErrorUnspecified](https://core.telegram.org/bots/api#passportelementerrorunspecified)
///
/// https://core.telegram.org/bots/api#passportelementerror
@JsonSerializable(includeIfNull: false)
class PassportElementError {
  String source;
  String type;
  String message;

  PassportElementError({this.source, this.type, this.message});

  factory PassportElementError.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorFromJson(json);

  Map<String, dynamic> toJson() => _$PassportElementErrorToJson(this);
}
