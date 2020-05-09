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
  String get position {
    switch (this) {
      case MaskPositionPoint.forehead:
        return 'forehead';
      case MaskPositionPoint.eyes:
        return 'eyes';
      case MaskPositionPoint.mouth:
        return 'mouth';
      case MaskPositionPoint.chin:
        return 'chin';
      default:
        return null;
    }
  }
}
