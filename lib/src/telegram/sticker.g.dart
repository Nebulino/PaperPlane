// GENERATED CODE - DO NOT MODIFY BY HAND

part of sticker;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaskPosition _$MaskPositionFromJson(Map<String, dynamic> json) {
  return MaskPosition(
    point: json['point'] as String,
    x_shift: (json['x_shift'] as num)?.toDouble(),
    y_shift: (json['y_shift'] as num)?.toDouble(),
    scale: (json['scale'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MaskPositionToJson(MaskPosition instance) =>
    <String, dynamic>{
      'point': instance.point,
      'x_shift': instance.x_shift,
      'y_shift': instance.y_shift,
      'scale': instance.scale,
    };

Sticker _$StickerFromJson(Map<String, dynamic> json) {
  return Sticker(
    file_id: json['file_id'] as String,
    file_unique_id: json['file_unique_id'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    is_animated: json['is_animated'] as bool,
    thumb: json['thumb'] == null
        ? null
        : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
    emoji: json['emoji'] as String,
    set_name: json['set_name'] as String,
    mask_position: json['mask_position'] == null
        ? null
        : MaskPosition.fromJson(json['mask_position'] as Map<String, dynamic>),
    file_size: json['file_size'] as int,
  );
}

Map<String, dynamic> _$StickerToJson(Sticker instance) => <String, dynamic>{
      'file_id': instance.file_id,
      'file_unique_id': instance.file_unique_id,
      'width': instance.width,
      'height': instance.height,
      'is_animated': instance.is_animated,
      'thumb': instance.thumb,
      'emoji': instance.emoji,
      'set_name': instance.set_name,
      'mask_position': instance.mask_position,
      'file_size': instance.file_size,
    };

StickerSet _$StickerSetFromJson(Map<String, dynamic> json) {
  return StickerSet(
    name: json['name'] as String,
    title: json['title'] as String,
    is_animated: json['is_animated'] as bool,
    contains_masks: json['contains_masks'] as bool,
    stickers: (json['stickers'] as List)
        ?.map((e) =>
            e == null ? null : Sticker.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StickerSetToJson(StickerSet instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'is_animated': instance.is_animated,
      'contains_masks': instance.contains_masks,
      'stickers': instance.stickers,
    };
