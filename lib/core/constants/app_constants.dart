final class AppConstants {
  static const String PHONE_REG_EXP =
      r'^(\+4|)?(07[0-8]{1}[0-9]{1}|02[0-9]{2}|03[0-9]{2}){1}?(\s|\.|\-)?([0-9]{3}(\s|\.|\-|)){2}$';

  static const String APP_TITLE = 'Matthiola flower shop';

  static const String PLACEHOLDER_BLUR_HASH = 'LEHV6nWB2yk8pyo0adR*.7kCMdnj';

  static const String CONTACT_EMAIL = 'huchiudaniel@gmail.com';

  static const String SMTP_EMAIL = 'matthiolaflowershop@outlook.com';

  static const String ORDER_EMAIL_TEMPLATE = 'confirm-order';

  static const String ORDER_EMAIL_SUBJECT = 'Confirmare comandă';

  static const String SMTP_PASSWORD = 'SMTP_PASSWORD';

  static const String PASSWORD_SHORT_TEXT = 'validator.passwordShort';
  static const String PASSWORD_MISSING_LETTER_TEXT =
      'validator.passwordMissingLetter';
  static const String PASSWORD_MISSING_DIGIT_TEXT =
      'validator.passwordMissingDigit';
  static const String PASSWORD_MISMATCH_TEXT = 'validator.passwordMismatch';
  static const String REQUIRED_TEXT = 'validator.required';
  static const String PHONE_FORMAT_TEXT = 'validator.phoneFormat';
  static const String EMAIL_INVALID_TEXT = 'validator.invalidEmail';

  static const String FLOWER_TYPE_THREAD = 'home.threadFlower';
  static const String FLOWER_TYPE_POT = 'home.potFlower';
}
