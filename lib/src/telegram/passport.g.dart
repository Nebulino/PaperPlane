// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passport.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EncryptedCredentials _$EncryptedCredentialsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['data', 'hash', 'secret']);
  return EncryptedCredentials(
    data: json['data'] as String?,
    hash: json['hash'] as String?,
    secret: json['secret'] as String?,
  );
}

Map<String, dynamic> _$EncryptedCredentialsToJson(
  EncryptedCredentials instance,
) => <String, dynamic>{
  'data': ?instance.data,
  'hash': ?instance.hash,
  'secret': ?instance.secret,
};

EncryptedPassportElement _$EncryptedPassportElementFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, requiredKeys: const ['type', 'data', 'phone_number']);
  return EncryptedPassportElement(
    type: $enumDecodeNullable(
      _$EncryptedPassportElementTypeEnumMap,
      json['type'],
    ),
    data: json['data'] as String?,
    phoneNumber: json['phone_number'] as String?,
    email: json['email'] as String?,
    files: (json['files'] as List<dynamic>?)
        ?.map((e) => PassportFile.fromJson(e as Map<String, dynamic>))
        .toList(),
    frontSide: json['front_side'] == null
        ? null
        : PassportFile.fromJson(json['front_side'] as Map<String, dynamic>),
    reverseSide: json['reverse_side'] == null
        ? null
        : PassportFile.fromJson(json['reverse_side'] as Map<String, dynamic>),
    selfie: json['selfie'] == null
        ? null
        : PassportFile.fromJson(json['selfie'] as Map<String, dynamic>),
    translation: (json['translation'] as List<dynamic>?)
        ?.map((e) => PassportFile.fromJson(e as Map<String, dynamic>))
        .toList(),
    hash: json['hash'] as String?,
  );
}

Map<String, dynamic> _$EncryptedPassportElementToJson(
  EncryptedPassportElement instance,
) => <String, dynamic>{
  'type': ?_$EncryptedPassportElementTypeEnumMap[instance.type],
  'data': ?instance.data,
  'phone_number': ?instance.phoneNumber,
  'email': ?instance.email,
  'files': ?instance.files,
  'front_side': ?instance.frontSide,
  'reverse_side': ?instance.reverseSide,
  'selfie': ?instance.selfie,
  'translation': ?instance.translation,
  'hash': ?instance.hash,
};

const _$EncryptedPassportElementTypeEnumMap = {
  EncryptedPassportElementType.personal_details: 'personal_details',
  EncryptedPassportElementType.passport: 'passport',
  EncryptedPassportElementType.driver_license: 'driver_license',
  EncryptedPassportElementType.identity_card: 'identity_card',
  EncryptedPassportElementType.internal_passport: 'internal_passport',
  EncryptedPassportElementType.address: 'address',
  EncryptedPassportElementType.utility_bill: 'utility_bill',
  EncryptedPassportElementType.bank_statement: 'bank_statement',
  EncryptedPassportElementType.rental_agreement: 'rental_agreement',
  EncryptedPassportElementType.passport_registration: 'passport_registration',
  EncryptedPassportElementType.temporary_registration: 'temporary_registration',
  EncryptedPassportElementType.phone_number: 'phone_number',
  EncryptedPassportElementType.email: 'email',
};

PassportData _$PassportDataFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['data', 'credentials']);
  return PassportData(
    data: (json['data'] as List<dynamic>?)
        ?.map(
          (e) => EncryptedPassportElement.fromJson(e as Map<String, dynamic>),
        )
        .toList(),
    credentials: json['credentials'] == null
        ? null
        : EncryptedCredentials.fromJson(
            json['credentials'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$PassportDataToJson(PassportData instance) =>
    <String, dynamic>{
      'data': ?instance.data,
      'credentials': ?instance.credentials,
    };

PassportElementError _$PassportElementErrorFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['source', 'type', 'message']);
  return PassportElementError(
    source: $enumDecodeNullable(
      _$EncryptedPassportElementSourceEnumMap,
      json['source'],
    ),
    type: $enumDecodeNullable(
      _$EncryptedPassportElementTypeEnumMap,
      json['type'],
    ),
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$PassportElementErrorToJson(
  PassportElementError instance,
) => <String, dynamic>{
  'source': ?_$EncryptedPassportElementSourceEnumMap[instance.source],
  'type': ?_$EncryptedPassportElementTypeEnumMap[instance.type],
  'message': ?instance.message,
};

const _$EncryptedPassportElementSourceEnumMap = {
  EncryptedPassportElementSource.data: 'data',
  EncryptedPassportElementSource.file: 'file',
  EncryptedPassportElementSource.files: 'files',
  EncryptedPassportElementSource.front_side: 'front_side',
  EncryptedPassportElementSource.reverse_side: 'reverse_side',
  EncryptedPassportElementSource.selfie: 'selfie',
  EncryptedPassportElementSource.translation_file: 'translation_file',
  EncryptedPassportElementSource.translation_files: 'translation_files',
  EncryptedPassportElementSource.unspecified: 'unspecified',
};

PassportElementErrorDataField _$PassportElementErrorDataFieldFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    requiredKeys: const [
      'source',
      'type',
      'field_name',
      'data_hash',
      'message',
    ],
  );
  return PassportElementErrorDataField(
    source:
        $enumDecodeNullable(
          _$EncryptedPassportElementSourceEnumMap,
          json['source'],
        ) ??
        EncryptedPassportElementSource.data,
    type: $enumDecodeNullable(
      _$EncryptedPassportElementTypeEnumMap,
      json['type'],
    ),
    fieldName: json['field_name'] as String?,
    dataHash: json['data_hash'] as String?,
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$PassportElementErrorDataFieldToJson(
  PassportElementErrorDataField instance,
) => <String, dynamic>{
  'source': ?_$EncryptedPassportElementSourceEnumMap[instance.source],
  'type': ?_$EncryptedPassportElementTypeEnumMap[instance.type],
  'field_name': ?instance.fieldName,
  'data_hash': ?instance.dataHash,
  'message': ?instance.message,
};

PassportElementErrorFile _$PassportElementErrorFileFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    requiredKeys: const ['source', 'type', 'file_hash', 'message'],
  );
  return PassportElementErrorFile(
    source:
        $enumDecodeNullable(
          _$EncryptedPassportElementSourceEnumMap,
          json['source'],
        ) ??
        EncryptedPassportElementSource.file,
    type: $enumDecodeNullable(
      _$EncryptedPassportElementTypeEnumMap,
      json['type'],
    ),
    fileHash: json['file_hash'] as String?,
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$PassportElementErrorFileToJson(
  PassportElementErrorFile instance,
) => <String, dynamic>{
  'source': ?_$EncryptedPassportElementSourceEnumMap[instance.source],
  'type': ?_$EncryptedPassportElementTypeEnumMap[instance.type],
  'file_hash': ?instance.fileHash,
  'message': ?instance.message,
};

PassportElementErrorFiles _$PassportElementErrorFilesFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    requiredKeys: const ['source', 'type', 'file_hashes', 'message'],
  );
  return PassportElementErrorFiles(
    source:
        $enumDecodeNullable(
          _$EncryptedPassportElementSourceEnumMap,
          json['source'],
        ) ??
        EncryptedPassportElementSource.files,
    type: $enumDecodeNullable(
      _$EncryptedPassportElementTypeEnumMap,
      json['type'],
    ),
    fileHashes: (json['file_hashes'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$PassportElementErrorFilesToJson(
  PassportElementErrorFiles instance,
) => <String, dynamic>{
  'source': ?_$EncryptedPassportElementSourceEnumMap[instance.source],
  'type': ?_$EncryptedPassportElementTypeEnumMap[instance.type],
  'file_hashes': ?instance.fileHashes,
  'message': ?instance.message,
};

PassportElementErrorFrontSide _$PassportElementErrorFrontSideFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    requiredKeys: const ['source', 'type', 'file_hash', 'message'],
  );
  return PassportElementErrorFrontSide(
    source:
        $enumDecodeNullable(
          _$EncryptedPassportElementSourceEnumMap,
          json['source'],
        ) ??
        EncryptedPassportElementSource.front_side,
    type: $enumDecodeNullable(
      _$EncryptedPassportElementTypeEnumMap,
      json['type'],
    ),
    fileHash: json['file_hash'] as String?,
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$PassportElementErrorFrontSideToJson(
  PassportElementErrorFrontSide instance,
) => <String, dynamic>{
  'source': ?_$EncryptedPassportElementSourceEnumMap[instance.source],
  'type': ?_$EncryptedPassportElementTypeEnumMap[instance.type],
  'file_hash': ?instance.fileHash,
  'message': ?instance.message,
};

PassportElementErrorReverseSide _$PassportElementErrorReverseSideFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    requiredKeys: const ['source', 'type', 'message', 'file_hash'],
  );
  return PassportElementErrorReverseSide(
    source:
        $enumDecodeNullable(
          _$EncryptedPassportElementSourceEnumMap,
          json['source'],
        ) ??
        EncryptedPassportElementSource.reverse_side,
    type: $enumDecodeNullable(
      _$EncryptedPassportElementTypeEnumMap,
      json['type'],
    ),
    file_hash: json['file_hash'] as String?,
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$PassportElementErrorReverseSideToJson(
  PassportElementErrorReverseSide instance,
) => <String, dynamic>{
  'source': ?_$EncryptedPassportElementSourceEnumMap[instance.source],
  'type': ?_$EncryptedPassportElementTypeEnumMap[instance.type],
  'message': ?instance.message,
  'file_hash': ?instance.file_hash,
};

PassportElementErrorSelfie _$PassportElementErrorSelfieFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    requiredKeys: const ['source', 'type', 'file_hash', 'message'],
  );
  return PassportElementErrorSelfie(
    source:
        $enumDecodeNullable(
          _$EncryptedPassportElementSourceEnumMap,
          json['source'],
        ) ??
        EncryptedPassportElementSource.selfie,
    type: $enumDecodeNullable(
      _$EncryptedPassportElementTypeEnumMap,
      json['type'],
    ),
    fileHash: json['file_hash'] as String?,
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$PassportElementErrorSelfieToJson(
  PassportElementErrorSelfie instance,
) => <String, dynamic>{
  'source': ?_$EncryptedPassportElementSourceEnumMap[instance.source],
  'type': ?_$EncryptedPassportElementTypeEnumMap[instance.type],
  'file_hash': ?instance.fileHash,
  'message': ?instance.message,
};

PassportElementErrorTranslationFile
_$PassportElementErrorTranslationFileFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['source', 'type', 'file_hash', 'message'],
  );
  return PassportElementErrorTranslationFile(
    source:
        $enumDecodeNullable(
          _$EncryptedPassportElementSourceEnumMap,
          json['source'],
        ) ??
        EncryptedPassportElementSource.translation_file,
    type: $enumDecodeNullable(
      _$EncryptedPassportElementTypeEnumMap,
      json['type'],
    ),
    fileHash: json['file_hash'] as String?,
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$PassportElementErrorTranslationFileToJson(
  PassportElementErrorTranslationFile instance,
) => <String, dynamic>{
  'source': ?_$EncryptedPassportElementSourceEnumMap[instance.source],
  'type': ?_$EncryptedPassportElementTypeEnumMap[instance.type],
  'file_hash': ?instance.fileHash,
  'message': ?instance.message,
};

PassportElementErrorTranslationFiles
_$PassportElementErrorTranslationFilesFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['source', 'type', 'file_hashes', 'message'],
  );
  return PassportElementErrorTranslationFiles(
    source:
        $enumDecodeNullable(
          _$EncryptedPassportElementSourceEnumMap,
          json['source'],
        ) ??
        EncryptedPassportElementSource.translation_files,
    type: $enumDecodeNullable(
      _$EncryptedPassportElementTypeEnumMap,
      json['type'],
    ),
    fileHashes: (json['file_hashes'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$PassportElementErrorTranslationFilesToJson(
  PassportElementErrorTranslationFiles instance,
) => <String, dynamic>{
  'source': ?_$EncryptedPassportElementSourceEnumMap[instance.source],
  'type': ?_$EncryptedPassportElementTypeEnumMap[instance.type],
  'file_hashes': ?instance.fileHashes,
  'message': ?instance.message,
};

PassportElementErrorUnspecified _$PassportElementErrorUnspecifiedFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    requiredKeys: const ['source', 'type', 'file_hash', 'message'],
  );
  return PassportElementErrorUnspecified(
    source:
        $enumDecodeNullable(
          _$EncryptedPassportElementSourceEnumMap,
          json['source'],
        ) ??
        EncryptedPassportElementSource.unspecified,
    type: $enumDecodeNullable(
      _$EncryptedPassportElementTypeEnumMap,
      json['type'],
    ),
    fileHash: json['file_hash'] as String?,
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$PassportElementErrorUnspecifiedToJson(
  PassportElementErrorUnspecified instance,
) => <String, dynamic>{
  'source': ?_$EncryptedPassportElementSourceEnumMap[instance.source],
  'type': ?_$EncryptedPassportElementTypeEnumMap[instance.type],
  'file_hash': ?instance.fileHash,
  'message': ?instance.message,
};

PassportFile _$PassportFileFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['file_id', 'file_unique_id', 'file_size'],
  );
  return PassportFile(
    fileID: json['file_id'] as String?,
    fileUniqueID: json['file_unique_id'] as String?,
    fileSize: (json['file_size'] as num?)?.toInt(),
    fileDate: PassportFile._dateTimeFromTelegramInt(
      (json['fileDate'] as num?)?.toInt(),
    ),
  );
}

Map<String, dynamic> _$PassportFileToJson(PassportFile instance) =>
    <String, dynamic>{
      'file_id': ?instance.fileID,
      'file_unique_id': ?instance.fileUniqueID,
      'file_size': ?instance.fileSize,
      'fileDate': ?PassportFile._dateTimeToTelegramInt(instance.fileDate),
    };
