/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// Represents an issue in an unspecified place.
/// The error is considered resolved when new data is added.
///
/// https://core.telegram.org/bots/api#passportelementerrorunspecified
@JsonSerializable(includeIfNull: false)
class PassportElementErrorUnspecified implements PassportElementError {
  @override
  String source;

  /// Type of the result, must be *gif*
  @JsonKey(name: 'type', required: true)
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
