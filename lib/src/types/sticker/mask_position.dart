/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

part of sticker;

/// MaskPosition telegram.types Class
/// https://core.telegram.org/bots/api#maskposition
@JsonSerializable()
class MaskPosition {
  String point;
  double x_shift;
  double y_shift;
  double scale;

  MaskPosition({this.point, this.x_shift, this.y_shift, this.scale});

  factory MaskPosition.fromJson(Map<String, dynamic> json) =>
      _$MaskPositionFromJson(json);

  Map<String, dynamic> toJson() => _$MaskPositionToJson(this);
}
