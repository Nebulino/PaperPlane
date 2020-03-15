/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// PassportElementError telegram.types Class
/// https://core.telegram.org/bots/api#passportelementerror
@JsonSerializable()
class PassportElementError {
  String source;
  String type;
  String message;

  PassportElementError({this.source, this.type, this.message});

  factory PassportElementError.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorFromJson(json);

  Map<String, dynamic> toJson() => _$PassportElementErrorToJson(this);
}
