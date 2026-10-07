//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

/// Contains every type of [encrypted passport element type].
///
/// Element type.
/// One of
///   “personal_details”,
///   “passport”,
///   “driver_license”,
///   “identity_card”,
///   “internal_passport”,
///   “address”,
///   “utility_bill”,
///   “bank_statement”,
///   “rental_agreement”,
///   “passport_registration”,
///   “temporary_registration”,
///   “phone_number”,
///   “email”.
///
/// [encrypted passport element type] : [EncryptedPassportElement]
enum EncryptedPassportElementType {
  personal_details,
  passport,
  driver_license,
  identity_card,
  internal_passport,
  address,
  utility_bill,
  bank_statement,
  rental_agreement,
  passport_registration,
  temporary_registration,
  phone_number,
  email,
}

extension EncryptedPassportElementTypeExtension
    on EncryptedPassportElementType {
  String get element => switch (this) {
        EncryptedPassportElementType.personal_details => 'personal_details',
        EncryptedPassportElementType.passport => 'passport',
        EncryptedPassportElementType.driver_license => 'driver_license',
        EncryptedPassportElementType.identity_card => 'identity_card',
        EncryptedPassportElementType.internal_passport => 'internal_passport',
        EncryptedPassportElementType.address => 'address',
        EncryptedPassportElementType.utility_bill => 'utility_bill',
        EncryptedPassportElementType.bank_statement => 'bank_statement',
        EncryptedPassportElementType.rental_agreement => 'rental_agreement',
        EncryptedPassportElementType.passport_registration =>
          'passport_registration',
        EncryptedPassportElementType.temporary_registration =>
          'temporary_registration',
        EncryptedPassportElementType.phone_number => 'phone_number',
        EncryptedPassportElementType.email => 'email',
      };
}
