/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of passport;

/// Represents an issue in one of the data fields that was provided by the user.
/// The error is considered resolved when the field's value changes.
///
/// https://core.telegram.org/bots/api#passportelementerrordatafield
@JsonSerializable()
class PassportElementErrorDataField implements PassportElementError {
  @override
  String source;
  @override
  String type;
  @override
  String message;
  String field_name;
  String data_hash;

  PassportElementErrorDataField(
      {this.source, this.type, this.message, this.field_name, this.data_hash});

  factory PassportElementErrorDataField.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorDataFieldFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PassportElementErrorDataFieldToJson(this);
}
