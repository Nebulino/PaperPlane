// GENERATED CODE - DO NOT MODIFY BY HAND

part of passport;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EncryptedCredentials _$EncryptedCredentialsFromJson(Map<String, dynamic> json) {
  return EncryptedCredentials(
    data: json['data'] as String,
    hash: json['hash'] as String,
    secret: json['secret'] as String,
  );
}

Map<String, dynamic> _$EncryptedCredentialsToJson(
        EncryptedCredentials instance) =>
    <String, dynamic>{
      'data': instance.data,
      'hash': instance.hash,
      'secret': instance.secret,
    };

EncryptedPassportElement _$EncryptedPassportElementFromJson(
    Map<String, dynamic> json) {
  return EncryptedPassportElement(
    type: json['type'] as String,
    data: json['data'] as String,
    phone_number: json['phone_number'] as String,
    email: json['email'] as String,
    files: (json['files'] as List)
        ?.map((e) =>
            e == null ? null : PassportFile.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    front_side: json['front_side'] == null
        ? null
        : PassportFile.fromJson(json['front_side'] as Map<String, dynamic>),
    reverse_side: json['reverse_side'] == null
        ? null
        : PassportFile.fromJson(json['reverse_side'] as Map<String, dynamic>),
    selfie: json['selfie'] == null
        ? null
        : PassportFile.fromJson(json['selfie'] as Map<String, dynamic>),
    translation: (json['translation'] as List)
        ?.map((e) =>
            e == null ? null : PassportFile.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hash: json['hash'] as String,
  );
}

Map<String, dynamic> _$EncryptedPassportElementToJson(
        EncryptedPassportElement instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
      'phone_number': instance.phone_number,
      'email': instance.email,
      'files': instance.files,
      'front_side': instance.front_side,
      'reverse_side': instance.reverse_side,
      'selfie': instance.selfie,
      'translation': instance.translation,
      'hash': instance.hash,
    };

PassportData _$PassportDataFromJson(Map<String, dynamic> json) {
  return PassportData(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : EncryptedPassportElement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    credentials: json['credentials'] == null
        ? null
        : EncryptedCredentials.fromJson(
            json['credentials'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PassportDataToJson(PassportData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'credentials': instance.credentials,
    };

PassportElementError _$PassportElementErrorFromJson(Map<String, dynamic> json) {
  return PassportElementError(
    source: json['source'] as String,
    type: json['type'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$PassportElementErrorToJson(
        PassportElementError instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
    };

PassportElementErrorDataField _$PassportElementErrorDataFieldFromJson(
    Map<String, dynamic> json) {
  return PassportElementErrorDataField(
    source: json['source'] as String,
    type: json['type'] as String,
    message: json['message'] as String,
    field_name: json['field_name'] as String,
    data_hash: json['data_hash'] as String,
  );
}

Map<String, dynamic> _$PassportElementErrorDataFieldToJson(
        PassportElementErrorDataField instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'field_name': instance.field_name,
      'data_hash': instance.data_hash,
    };

PassportElementErrorFile _$PassportElementErrorFileFromJson(
    Map<String, dynamic> json) {
  return PassportElementErrorFile(
    source: json['source'] as String,
    type: json['type'] as String,
    message: json['message'] as String,
    file_hash: json['file_hash'] as String,
  );
}

Map<String, dynamic> _$PassportElementErrorFileToJson(
        PassportElementErrorFile instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'file_hash': instance.file_hash,
    };

PassportElementErrorFiles _$PassportElementErrorFilesFromJson(
    Map<String, dynamic> json) {
  return PassportElementErrorFiles(
    source: json['source'] as String,
    type: json['type'] as String,
    message: json['message'] as String,
    file_hashes:
        (json['file_hashes'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PassportElementErrorFilesToJson(
        PassportElementErrorFiles instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'file_hashes': instance.file_hashes,
    };

PassportElementErrorFrontSide _$PassportElementErrorFrontSideFromJson(
    Map<String, dynamic> json) {
  return PassportElementErrorFrontSide(
    source: json['source'] as String,
    type: json['type'] as String,
    message: json['message'] as String,
    file_hash: json['file_hash'] as String,
  );
}

Map<String, dynamic> _$PassportElementErrorFrontSideToJson(
        PassportElementErrorFrontSide instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'file_hash': instance.file_hash,
    };

PassportElementErrorReverseSide _$PassportElementErrorReverseSideFromJson(
    Map<String, dynamic> json) {
  return PassportElementErrorReverseSide(
    source: json['source'] as String,
    type: json['type'] as String,
    message: json['message'] as String,
    file_hash: json['file_hash'] as String,
  );
}

Map<String, dynamic> _$PassportElementErrorReverseSideToJson(
        PassportElementErrorReverseSide instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'file_hash': instance.file_hash,
    };

PassportElementErrorSelfie _$PassportElementErrorSelfieFromJson(
    Map<String, dynamic> json) {
  return PassportElementErrorSelfie(
    source: json['source'] as String,
    type: json['type'] as String,
    message: json['message'] as String,
    file_hash: json['file_hash'] as String,
  );
}

Map<String, dynamic> _$PassportElementErrorSelfieToJson(
        PassportElementErrorSelfie instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'file_hash': instance.file_hash,
    };

PassportElementErrorTranslationFile
    _$PassportElementErrorTranslationFileFromJson(Map<String, dynamic> json) {
  return PassportElementErrorTranslationFile(
    source: json['source'] as String,
    type: json['type'] as String,
    message: json['message'] as String,
    file_hash: json['file_hash'] as String,
  );
}

Map<String, dynamic> _$PassportElementErrorTranslationFileToJson(
        PassportElementErrorTranslationFile instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'file_hash': instance.file_hash,
    };

PassportElementErrorTranslationFiles
    _$PassportElementErrorTranslationFilesFromJson(Map<String, dynamic> json) {
  return PassportElementErrorTranslationFiles(
    source: json['source'] as String,
    type: json['type'] as String,
    message: json['message'] as String,
    file_hashes:
        (json['file_hashes'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PassportElementErrorTranslationFilesToJson(
        PassportElementErrorTranslationFiles instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'file_hashes': instance.file_hashes,
    };

PassportElementErrorUnspecified _$PassportElementErrorUnspecifiedFromJson(
    Map<String, dynamic> json) {
  return PassportElementErrorUnspecified(
    source: json['source'] as String,
    type: json['type'] as String,
    message: json['message'] as String,
    file_hash: json['file_hash'] as String,
  );
}

Map<String, dynamic> _$PassportElementErrorUnspecifiedToJson(
        PassportElementErrorUnspecified instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'file_hash': instance.file_hash,
    };

PassportFile _$PassportFileFromJson(Map<String, dynamic> json) {
  return PassportFile(
    file_id: json['file_id'] as String,
    file_unique_id: json['file_unique_id'] as String,
    file_size: json['file_size'] as int,
    file_date: json['file_date'] as int,
  );
}

Map<String, dynamic> _$PassportFileToJson(PassportFile instance) =>
    <String, dynamic>{
      'file_id': instance.file_id,
      'file_unique_id': instance.file_unique_id,
      'file_size': instance.file_size,
      'file_date': instance.file_date,
    };
