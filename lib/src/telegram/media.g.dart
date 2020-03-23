// GENERATED CODE - DO NOT MODIFY BY HAND

part of media;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Animation _$AnimationFromJson(Map<String, dynamic> json) {
  return Animation(
    file_id: json['file_id'] as String,
    file_unique_id: json['file_unique_id'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    duration: json['duration'] as int,
    thumb: json['thumb'] == null
        ? null
        : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
    file_name: json['file_name'] as String,
    mime_type: json['mime_type'] as String,
    file_size: json['file_size'] as int,
  );
}

Map<String, dynamic> _$AnimationToJson(Animation instance) => <String, dynamic>{
      'file_id': instance.file_id,
      'file_unique_id': instance.file_unique_id,
      'width': instance.width,
      'height': instance.height,
      'duration': instance.duration,
      'thumb': instance.thumb,
      'file_name': instance.file_name,
      'mime_type': instance.mime_type,
      'file_size': instance.file_size,
    };

Audio _$AudioFromJson(Map<String, dynamic> json) {
  return Audio(
    file_id: json['file_id'] as String,
    file_unique_id: json['file_unique_id'] as String,
    duration: json['duration'] as int,
    performer: json['performer'] as String,
    title: json['title'] as String,
    mime_type: json['mime_type'] as String,
    file_size: json['file_size'] as int,
    thumb: json['thumb'] == null
        ? null
        : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AudioToJson(Audio instance) => <String, dynamic>{
      'file_id': instance.file_id,
      'file_unique_id': instance.file_unique_id,
      'duration': instance.duration,
      'performer': instance.performer,
      'title': instance.title,
      'mime_type': instance.mime_type,
      'file_size': instance.file_size,
      'thumb': instance.thumb,
    };

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact(
    phone_number: json['phone_number'] as String,
    first_name: json['first_name'] as String,
    last_name: json['last_name'] as String,
    user_id: json['user_id'] as int,
    vcard: json['vcard'] as String,
  );
}

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'phone_number': instance.phone_number,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'user_id': instance.user_id,
      'vcard': instance.vcard,
    };

Document _$DocumentFromJson(Map<String, dynamic> json) {
  return Document(
    file_id: json['file_id'] as String,
    file_unique_id: json['file_unique_id'] as String,
    thumb: json['thumb'] == null
        ? null
        : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
    file_name: json['file_name'] as String,
    mime_type: json['mime_type'] as String,
    file_size: json['file_size'] as int,
  );
}

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'file_id': instance.file_id,
      'file_unique_id': instance.file_unique_id,
      'thumb': instance.thumb,
      'file_name': instance.file_name,
      'mime_type': instance.mime_type,
      'file_size': instance.file_size,
    };

File _$FileFromJson(Map<String, dynamic> json) {
  return File(
    file_id: json['file_id'] as String,
    file_unique_id: json['file_unique_id'] as String,
    file_size: json['file_size'] as int,
    file_path: json['file_path'] as String,
  );
}

Map<String, dynamic> _$FileToJson(File instance) => <String, dynamic>{
      'file_id': instance.file_id,
      'file_unique_id': instance.file_unique_id,
      'file_size': instance.file_size,
      'file_path': instance.file_path,
    };

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    longitude: (json['longitude'] as num)?.toDouble(),
    latitude: (json['latitude'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };

PhotoSize _$PhotoSizeFromJson(Map<String, dynamic> json) {
  return PhotoSize(
    file_id: json['file_id'] as String,
    file_unique_id: json['file_unique_id'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    file_size: json['file_size'] as int,
  );
}

Map<String, dynamic> _$PhotoSizeToJson(PhotoSize instance) => <String, dynamic>{
      'file_id': instance.file_id,
      'file_unique_id': instance.file_unique_id,
      'width': instance.width,
      'height': instance.height,
      'file_size': instance.file_size,
    };

Venue _$VenueFromJson(Map<String, dynamic> json) {
  return Venue(
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    title: json['title'] as String,
    address: json['address'] as String,
    foursquare_id: json['foursquare_id'] as String,
    foursquare_type: json['foursquare_type'] as String,
  );
}

Map<String, dynamic> _$VenueToJson(Venue instance) => <String, dynamic>{
      'location': instance.location,
      'title': instance.title,
      'address': instance.address,
      'foursquare_id': instance.foursquare_id,
      'foursquare_type': instance.foursquare_type,
    };

Video _$VideoFromJson(Map<String, dynamic> json) {
  return Video(
    file_id: json['file_id'] as String,
    file_unique_id: json['file_unique_id'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    duration: json['duration'] as int,
    thumb: json['thumb'] == null
        ? null
        : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
    mime_type: json['mime_type'] as String,
    file_size: json['file_size'] as int,
  );
}

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'file_id': instance.file_id,
      'file_unique_id': instance.file_unique_id,
      'width': instance.width,
      'height': instance.height,
      'duration': instance.duration,
      'thumb': instance.thumb,
      'mime_type': instance.mime_type,
      'file_size': instance.file_size,
    };

VideoNote _$VideoNoteFromJson(Map<String, dynamic> json) {
  return VideoNote(
    file_id: json['file_id'] as String,
    file_unique_id: json['file_unique_id'] as String,
    length: json['length'] as int,
    duration: json['duration'] as int,
    thumb: json['thumb'] == null
        ? null
        : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
    file_size: json['file_size'] as int,
  );
}

Map<String, dynamic> _$VideoNoteToJson(VideoNote instance) => <String, dynamic>{
      'file_id': instance.file_id,
      'file_unique_id': instance.file_unique_id,
      'length': instance.length,
      'duration': instance.duration,
      'thumb': instance.thumb,
      'file_size': instance.file_size,
    };

Voice _$VoiceFromJson(Map<String, dynamic> json) {
  return Voice(
    file_id: json['file_id'] as String,
    file_unique_id: json['file_unique_id'] as String,
    duration: json['duration'] as int,
    mime_type: json['mime_type'] as String,
    file_size: json['file_size'] as int,
  );
}

Map<String, dynamic> _$VoiceToJson(Voice instance) => <String, dynamic>{
      'file_id': instance.file_id,
      'file_unique_id': instance.file_unique_id,
      'duration': instance.duration,
      'mime_type': instance.mime_type,
      'file_size': instance.file_size,
    };
