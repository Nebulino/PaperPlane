//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

part of '../message.dart';

/// Describes the options used for link preview generation.
///
/// See https://core.telegram.org/bots/api#linkpreviewoptions
@JsonSerializable(includeIfNull: false)
class LinkPreviewOptions {
  /// Whether the link preview is disabled.
  @JsonKey(name: 'is_disabled')
  bool? isDisabled;

  /// URL to use for the link preview.
  ///
  /// If empty, the first URL found in the message text will be used.
  @JsonKey(name: 'url')
  String? url;

  /// Whether the media in the link preview is supposed to be shrunk.
  ///
  /// Ignored if the [url] isn't explicitly specified or media size change
  /// isn't supported.
  @JsonKey(name: 'prefer_small_media')
  bool? preferSmallMedia;

  /// Whether the media in the link preview is supposed to be enlarged.
  ///
  /// Ignored if the [url] isn't explicitly specified or media size change
  /// isn't supported.
  @JsonKey(name: 'prefer_large_media')
  bool? preferLargeMedia;

  /// Whether the link preview must be shown above the message text.
  ///
  /// Otherwise, the link preview will be shown below the message text.
  @JsonKey(name: 'show_above_text')
  bool? showAboveText;

  LinkPreviewOptions({
    this.isDisabled,
    this.url,
    this.preferSmallMedia,
    this.preferLargeMedia,
    this.showAboveText,
  });

  factory LinkPreviewOptions.fromJson(Map<String, dynamic> json) =>
      _$LinkPreviewOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$LinkPreviewOptionsToJson(this);
}
