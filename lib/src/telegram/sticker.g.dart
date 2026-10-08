// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaskPosition _$MaskPositionFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['point', 'x_shift', 'y_shift', 'scale'],
  );
  return MaskPosition(
    point: $enumDecodeNullable(_$MaskPositionPointEnumMap, json['point']),
    xShift: (json['x_shift'] as num?)?.toDouble(),
    yShift: (json['y_shift'] as num?)?.toDouble(),
    scale: (json['scale'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$MaskPositionToJson(MaskPosition instance) =>
    <String, dynamic>{
      'point': ?_$MaskPositionPointEnumMap[instance.point],
      'x_shift': ?instance.xShift,
      'y_shift': ?instance.yShift,
      'scale': ?instance.scale,
    };

const _$MaskPositionPointEnumMap = {
  MaskPositionPoint.forehead: 'forehead',
  MaskPositionPoint.eyes: 'eyes',
  MaskPositionPoint.mouth: 'mouth',
  MaskPositionPoint.chin: 'chin',
};

Sticker _$StickerFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'file_id',
      'file_unique_id',
      'width',
      'height',
      'is_animated',
    ],
  );
  return Sticker(
    fileID: json['file_id'] as String?,
    fileUniqueID: json['file_unique_id'] as String?,
    width: (json['width'] as num?)?.toInt(),
    height: (json['height'] as num?)?.toInt(),
    isAnimated: json['is_animated'] as bool?,
    thumb: json['thumb'] == null
        ? null
        : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
    emoji: json['emoji'] as String?,
    setName: json['set_name'] as String?,
    maskPosition: json['mask_position'] == null
        ? null
        : MaskPosition.fromJson(json['mask_position'] as Map<String, dynamic>),
    fileSize: (json['file_size'] as num?)?.toInt(),
  );
}

Map<String, dynamic> _$StickerToJson(Sticker instance) => <String, dynamic>{
  'file_id': ?instance.fileID,
  'file_unique_id': ?instance.fileUniqueID,
  'width': ?instance.width,
  'height': ?instance.height,
  'is_animated': ?instance.isAnimated,
  'thumb': ?instance.thumb,
  'emoji': ?instance.emoji,
  'set_name': ?instance.setName,
  'mask_position': ?instance.maskPosition,
  'file_size': ?instance.fileSize,
};

StickerSet _$StickerSetFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'name',
      'title',
      'is_animated',
      'contains_masks',
      'stickers',
    ],
  );
  return StickerSet(
    name: json['name'] as String?,
    title: json['title'] as String?,
    isAnimated: json['is_animated'] as bool?,
    containsMasks: json['contains_masks'] as bool?,
    stickers: (json['stickers'] as List<dynamic>?)
        ?.map((e) => Sticker.fromJson(e as Map<String, dynamic>))
        .toList(),
    thumb: json['thumb'] == null
        ? null
        : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StickerSetToJson(StickerSet instance) =>
    <String, dynamic>{
      'name': ?instance.name,
      'title': ?instance.title,
      'is_animated': ?instance.isAnimated,
      'contains_masks': ?instance.containsMasks,
      'stickers': ?instance.stickers,
      'thumb': ?instance.thumb,
    };
