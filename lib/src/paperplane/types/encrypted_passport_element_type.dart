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
  String get element {
    switch (this) {
      case EncryptedPassportElementType.personal_details:
        return 'personal_details';
      case EncryptedPassportElementType.passport:
        return 'passport';
      case EncryptedPassportElementType.driver_license:
        return 'driver_license';
      case EncryptedPassportElementType.identity_card:
        return 'identity_card';
      case EncryptedPassportElementType.internal_passport:
        return 'internal_passport';
      case EncryptedPassportElementType.address:
        return 'address';
      case EncryptedPassportElementType.utility_bill:
        return 'utility_bill';
      case EncryptedPassportElementType.bank_statement:
        return 'bank_statement';
      case EncryptedPassportElementType.rental_agreement:
        return 'rental_agreement';
      case EncryptedPassportElementType.passport_registration:
        return 'passport_registration';
      case EncryptedPassportElementType.temporary_registration:
        return 'temporary_registration';
      case EncryptedPassportElementType.phone_number:
        return 'phone_number';
      case EncryptedPassportElementType.email:
        return 'email';
      default:
        return null;
    }
  }
}
