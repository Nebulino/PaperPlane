//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

/// Contains every type of [mask position point].
///
/// [mask position point]: [MaskPosition]
enum MaskPositionPoint {
  forehead,
  eyes,
  mouth,
  chin,
}

extension MaskPositionPointExtension on MaskPositionPoint {
  String get position => switch (this) {
        MaskPositionPoint.forehead => 'forehead',
        MaskPositionPoint.eyes => 'eyes',
        MaskPositionPoint.mouth => 'mouth',
        MaskPositionPoint.chin => 'chin',
      };
}
