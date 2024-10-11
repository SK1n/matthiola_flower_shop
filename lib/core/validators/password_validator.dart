// ignore_for_file: constant_identifier_names

import 'package:formz/formz.dart';

enum PasswordValidationError {
  required,
  invalid,
  tooShort,
  missingLetter,
  missingDigit
}

class PasswordValidator
    extends FormzInput<String, Set<PasswordValidationError>> {
  const PasswordValidator.pure() : super.pure('');

  const PasswordValidator.dirty([super.value = '']) : super.dirty();

  static const String PASSWORD_LENGTH_SHORT = r'^.{8,}$';

  static const String PASSWORD_CONTAINS_LETTERS = '(?=.*[A-Za-z])';

  static const String PASSWORD_CONTAINS_DIGITS = r'(?=.*\d)';

  static final _passwordLengthRegExp = RegExp(PASSWORD_LENGTH_SHORT);

  static final _passwordLetterRegExp = RegExp(PASSWORD_CONTAINS_LETTERS);

  static final _passwordDigitRegExp = RegExp(PASSWORD_CONTAINS_DIGITS);

  @override
  Set<PasswordValidationError>? validator(String? value) {
    if (value == null || value.isEmpty) {
      return {PasswordValidationError.required};
    }

    final errors = <PasswordValidationError>{};

    if (!_passwordLengthRegExp.hasMatch(value)) {
      errors.add(PasswordValidationError.tooShort);
    }
    if (!_passwordLetterRegExp.hasMatch(value)) {
      errors.add(PasswordValidationError.missingLetter);
    }
    if (!_passwordDigitRegExp.hasMatch(value)) {
      errors.add(PasswordValidationError.missingDigit);
    }
    return errors.isEmpty ? null : errors;
  }
}
