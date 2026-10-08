// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Animation _$AnimationFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'file_id',
      'file_unique_id',
      'width',
      'height',
      'duration',
    ],
  );
  return Animation(
    fileID: json['file_id'] as String?,
    fileUniqueID: json['file_unique_id'] as String?,
    width: (json['width'] as num?)?.toInt(),
    height: (json['height'] as num?)?.toInt(),
    duration: Animation._durationFromTelegramSeconds(
      (json['duration'] as num?)?.toInt(),
    ),
    thumb: json['thumb'] == null
        ? null
        : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
    fileName: json['file_name'] as String?,
    mimeType: json['mime_type'] as String?,
    fileSize: (json['file_size'] as num?)?.toInt(),
  );
}

Map<String, dynamic> _$AnimationToJson(Animation instance) => <String, dynamic>{
  'file_id': ?instance.fileID,
  'file_unique_id': ?instance.fileUniqueID,
  'width': ?instance.width,
  'height': ?instance.height,
  'duration': ?Animation._durationToTelegramSeconds(instance.duration),
  'thumb': ?instance.thumb,
  'file_name': ?instance.fileName,
  'mime_type': ?instance.mimeType,
  'file_size': ?instance.fileSize,
};

Audio _$AudioFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['file_id', 'file_unique_id', 'duration'],
  );
  return Audio(
    fileID: json['file_id'] as String?,
    fileUniqueID: json['file_unique_id'] as String?,
    duration: Audio._durationFromTelegramSeconds(
      (json['duration'] as num?)?.toInt(),
    ),
    performer: json['performer'] as String?,
    title: json['title'] as String?,
    mimeType: json['mime_type'] as String?,
    fileSize: (json['file_size'] as num?)?.toInt(),
    thumb: json['thumb'] == null
        ? null
        : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AudioToJson(Audio instance) => <String, dynamic>{
  'file_id': ?instance.fileID,
  'file_unique_id': ?instance.fileUniqueID,
  'duration': ?Audio._durationToTelegramSeconds(instance.duration),
  'performer': ?instance.performer,
  'title': ?instance.title,
  'mime_type': ?instance.mimeType,
  'file_size': ?instance.fileSize,
  'thumb': ?instance.thumb,
};

Contact _$ContactFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['phone_number', 'first_name']);
  return Contact(
    phoneNumber: json['phone_number'] as String?,
    firstName: json['first_name'] as String?,
    lastName: json['last_name'] as String?,
    userID: (json['user_id'] as num?)?.toInt(),
    vcard: json['vcard'] as String?,
  );
}

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
  'phone_number': ?instance.phoneNumber,
  'first_name': ?instance.firstName,
  'last_name': ?instance.lastName,
  'user_id': ?instance.userID,
  'vcard': ?instance.vcard,
};

Document _$DocumentFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['file_id', 'file_unique_id']);
  return Document(
    fileID: json['file_id'] as String?,
    fileUniqueID: json['file_unique_id'] as String?,
    thumb: json['thumb'] == null
        ? null
        : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
    fileName: json['file_name'] as String?,
    mimeType: json['mime_type'] as String?,
    file_size: (json['file_size'] as num?)?.toInt(),
  );
}

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
  'file_id': ?instance.fileID,
  'file_unique_id': ?instance.fileUniqueID,
  'thumb': ?instance.thumb,
  'file_name': ?instance.fileName,
  'mime_type': ?instance.mimeType,
  'file_size': ?instance.file_size,
};

File _$FileFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['file_id', 'file_unique_id']);
  return File(
    fileID: json['file_id'] as String?,
    fileUniqueID: json['file_unique_id'] as String?,
    fileSize: (json['file_size'] as num?)?.toInt(),
    filePath: json['file_path'] as String?,
  );
}

Map<String, dynamic> _$FileToJson(File instance) => <String, dynamic>{
  'file_id': ?instance.fileID,
  'file_unique_id': ?instance.fileUniqueID,
  'file_size': ?instance.fileSize,
  'file_path': ?instance.filePath,
};

Location _$LocationFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['longitude', 'latitude']);
  return Location(
    longitude: (json['longitude'] as num?)?.toDouble(),
    latitude: (json['latitude'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
  'longitude': ?instance.longitude,
  'latitude': ?instance.latitude,
};

PhotoSize _$PhotoSizeFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['file_id', 'file_unique_id', 'width', 'height'],
  );
  return PhotoSize(
    fileID: json['file_id'] as String?,
    fileUniqueID: json['file_unique_id'] as String?,
    width: (json['width'] as num?)?.toInt(),
    height: (json['height'] as num?)?.toInt(),
    fileSize: (json['file_size'] as num?)?.toInt(),
  );
}

Map<String, dynamic> _$PhotoSizeToJson(PhotoSize instance) => <String, dynamic>{
  'file_id': ?instance.fileID,
  'file_unique_id': ?instance.fileUniqueID,
  'width': ?instance.width,
  'height': ?instance.height,
  'file_size': ?instance.fileSize,
};

Venue _$VenueFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['location', 'title', 'address']);
  return Venue(
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    title: json['title'] as String?,
    address: json['address'] as String?,
    foursquareID: json['foursquare_id'] as String?,
    foursquareType: json['foursquare_type'] as String?,
  );
}

Map<String, dynamic> _$VenueToJson(Venue instance) => <String, dynamic>{
  'location': ?instance.location,
  'title': ?instance.title,
  'address': ?instance.address,
  'foursquare_id': ?instance.foursquareID,
  'foursquare_type': ?instance.foursquareType,
};

Video _$VideoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'file_id',
      'file_unique_id',
      'width',
      'height',
      'duration',
    ],
  );
  return Video(
    fileID: json['file_id'] as String?,
    fileUniqueID: json['file_unique_id'] as String?,
    width: (json['width'] as num?)?.toInt(),
    height: (json['height'] as num?)?.toInt(),
    duration: Video._durationFromTelegramSeconds(
      (json['duration'] as num?)?.toInt(),
    ),
    thumb: json['thumb'] == null
        ? null
        : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
    mimeType: json['mime_type'] as String?,
    fileSize: (json['file_size'] as num?)?.toInt(),
  );
}

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
  'file_id': ?instance.fileID,
  'file_unique_id': ?instance.fileUniqueID,
  'width': ?instance.width,
  'height': ?instance.height,
  'duration': ?Video._durationToTelegramSeconds(instance.duration),
  'thumb': ?instance.thumb,
  'mime_type': ?instance.mimeType,
  'file_size': ?instance.fileSize,
};

VideoNote _$VideoNoteFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['file_id', 'file_unique_id', 'length', 'duration'],
  );
  return VideoNote(
    fileID: json['file_id'] as String?,
    fileUniqueID: json['file_unique_id'] as String?,
    length: (json['length'] as num?)?.toInt(),
    duration: VideoNote._durationFromTelegramSeconds(
      (json['duration'] as num?)?.toInt(),
    ),
    thumb: json['thumb'] == null
        ? null
        : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
    fileSize: (json['file_size'] as num?)?.toInt(),
  );
}

Map<String, dynamic> _$VideoNoteToJson(VideoNote instance) => <String, dynamic>{
  'file_id': ?instance.fileID,
  'file_unique_id': ?instance.fileUniqueID,
  'length': ?instance.length,
  'duration': ?VideoNote._durationToTelegramSeconds(instance.duration),
  'thumb': ?instance.thumb,
  'file_size': ?instance.fileSize,
};

Voice _$VoiceFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['file_id', 'file_unique_id', 'duration'],
  );
  return Voice(
    fileID: json['file_id'] as String?,
    fileUniqueID: json['file_unique_id'] as String?,
    duration: Voice._durationFromTelegramSeconds(
      (json['duration'] as num?)?.toInt(),
    ),
    mimeType: json['mime_type'] as String?,
    file_size: (json['file_size'] as num?)?.toInt(),
  );
}

Map<String, dynamic> _$VoiceToJson(Voice instance) => <String, dynamic>{
  'file_id': ?instance.fileID,
  'file_unique_id': ?instance.fileUniqueID,
  'duration': ?Voice._durationToTelegramSeconds(instance.duration),
  'mime_type': ?instance.mimeType,
  'file_size': ?instance.file_size,
};
