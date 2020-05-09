//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

part of passport;

/// Represents an issue in one of the data fields that was provided by the user.
/// The error is considered resolved when the field's value changes.
///
/// https://core.telegram.org/bots/api#passportelementerrordatafield
@JsonSerializable(includeIfNull: false)
class PassportElementErrorDataField implements PassportElementError {
  /// Error source, must be *data*.
  @JsonKey(name: 'source', required: true)
  @override
  EncryptedPassportElementSource source;

  /// The section of the user's Telegram Passport
  /// which has the error, one of “personal_details”,
  /// “passport”, “driver_license”, “identity_card”,
  /// “internal_passport”, “address”.
  @JsonKey(name: 'type', required: true)
  @override
  EncryptedPassportElementType type;

  /// Name of the data field which has the error.
  @JsonKey(name: 'field_name', required: true)
  String fieldName;

  /// Base64-encoded data hash.
  @JsonKey(name: 'data_hash', required: true)
  String dataHash;

  /// Error message.
  @JsonKey(name: 'message', required: true)
  @override
  String message;

  PassportElementErrorDataField({
    this.source = EncryptedPassportElementSource.data,
    this.type,
    this.fieldName,
    this.dataHash,
    this.message,
  });

  factory PassportElementErrorDataField.fromJson(Map<String, dynamic> json) =>
      _$PassportElementErrorDataFieldFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PassportElementErrorDataFieldToJson(this);
}
