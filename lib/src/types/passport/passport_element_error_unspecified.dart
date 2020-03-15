/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// PassportElementErrorUnspecified telegram.types Class
/// https://core.telegram.org/bots/api#passportelementerrorunspecified
@JsonSerializable()
class PassportElementErrorUnspecified implements PassportElementError {
  @override
  String source;
  @override
  String type;
  @override
  String message;
  String file_hash;

  PassportElementErrorUnspecified(
      {this.source, this.type, this.message, this.file_hash});

  factory PassportElementErrorUnspecified.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorUnspecifiedFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$PassportElementErrorUnspecifiedToJson(this);
}
