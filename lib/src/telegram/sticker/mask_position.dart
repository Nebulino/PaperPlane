//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

part of sticker;

/// This object describes the position on faces where
/// a mask should be placed by default.
///
/// https://core.telegram.org/bots/api#maskposition
@JsonSerializable(includeIfNull: false)
class MaskPosition {
  /// The part of the face relative to which the mask should be placed.
  /// One of “forehead”, “eyes”, “mouth”, or “chin”.
  @JsonKey(name: 'point', required: true)
  MaskPositionPoint point;

  /// Shift by X-axis measured in widths of the mask scaled to
  /// the face size, from left to right.
  /// For example, choosing -1.0 will place mask just to the left
  /// of the default mask position.
  @JsonKey(name: 'x_shift', required: true)
  double xShift;

  /// Shift by Y-axis measured in heights of the mask scaled
  /// to the face size, from top to bottom.
  /// For example, 1.0 will place the mask just below the default
  /// mask position.
  @JsonKey(name: 'y_shift', required: true)
  double yShift;

  /// Mask scaling coefficient. For example, 2.0 means double size.
  @JsonKey(name: 'scale', required: true)
  double scale;

  MaskPosition({
    this.point,
    this.xShift,
    this.yShift,
    this.scale,
  });

  factory MaskPosition.fromJson(Map<String, dynamic> json) =>
      _$MaskPositionFromJson(json);

  Map<String, dynamic> toJson() => _$MaskPositionToJson(this);
}
