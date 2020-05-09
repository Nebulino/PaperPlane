//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

part of passport;

/// This object represents a file uploaded to Telegram Passport.
/// Currently all Telegram Passport files are in JPEG format when
/// decrypted and don't exceed 10MB.
///
/// https://core.telegram.org/bots/api#passportfile
@JsonSerializable(includeIfNull: false)
class PassportFile {
  /// Identifier for this file, which can be used to download or reuse the file.
  @JsonKey(name: 'file_id', required: true)
  String fileID;

  /// Unique identifier for this file, which is supposed to
  /// be the same over time and for different bots.
  /// Can't be used to download or reuse the file.
  @JsonKey(name: 'file_unique_id', required: true)
  String fileUniqueID;

  /// File size.
  @JsonKey(name: 'file_size', required: true)
  int fileSize;

  /// Unix time when the file was uploaded.
  @JsonKey(
      name: 'fileDate',
      fromJson: _dateTimeFromTelegramInt,
      toJson: _dateTimeToTelegramInt)
  DateTime fileDate;

  PassportFile({
    this.fileID,
    this.fileUniqueID,
    this.fileSize,
    this.fileDate,
  });

  factory PassportFile.fromJson(Map<String, dynamic> json) =>
      _$PassportFileFromJson(json);

  Map<String, dynamic> toJson() => _$PassportFileToJson(this);

  /// Helper: converts into a DateTime type from
  /// a int (unix time) received from Telegram API.
  static DateTime _dateTimeFromTelegramInt(int unixTime) => unixTime == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);

  /// Helper: converts from a DateTime type into
  /// a int (unix time) to be sent to Telegram API.
  static int _dateTimeToTelegramInt(DateTime dateTime) => dateTime == null
      ? null
      : (dateTime.millisecondsSinceEpoch / 1000).round();
}
