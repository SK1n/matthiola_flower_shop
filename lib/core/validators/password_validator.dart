// ignore_for_file: constant_identifier_names

import 'package:formz/formz.dart';
import 'package:matthiola_flower_shop/core/constants/app_constants.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';

enum PasswordValidationError {
  required(AppConstants.REQUIRED_TEXT),
  tooShort(AppConstants.PASSWORD_SHORT_TEXT),
  missingLetter(AppConstants.PASSWORD_MISSING_LETTER_TEXT),
  missingDigit(AppConstants.PASSWORD_MISSING_DIGIT_TEXT),
  notMatching(AppConstants.PASSWORD_MISMATCH_TEXT);

  const PasswordValidationError(this.key);
  final String key;

  String get text => t[key] as String;
}

class PasswordValidator
    extends FormzInput<(String, String), (String?, String?)> {
  const PasswordValidator.pure() : super.pure(('', ''));

  const PasswordValidator.dirty([super.value = ('', '')]) : super.dirty();

  static const String PASSWORD_LENGTH_SHORT = r'^.{8,}$';
  static const String PASSWORD_CONTAINS_LETTERS = '(?=.*[A-Za-z])';
  static const String PASSWORD_CONTAINS_DIGITS = r'(?=.*\d)';

  static final _passwordLengthRegExp = RegExp(PASSWORD_LENGTH_SHORT);
  static final _passwordLetterRegExp = RegExp(PASSWORD_CONTAINS_LETTERS);
  static final _passwordDigitRegExp = RegExp(PASSWORD_CONTAINS_DIGITS);

  @override
  (String?, String?)? validator((String a, String b)? value) {
    if (value == null) {
      return (
        PasswordValidationError.required.text,
        PasswordValidationError.required.text
      );
    }

    final validatorA = _validateString(value.$1);
    final validatorB = _validateString(value.$2);

    if (value.$1 != value.$2) {
      return (
        PasswordValidationError.notMatching.text,
        PasswordValidationError.notMatching.text
      );
    }

    return validatorA == null && validatorB == null
        ? null
        : (validatorA, validatorB);
  }

  String? _validateString(String string) {
    if (string.isEmpty) return PasswordValidationError.required.text;

    final texts = <String>{};

    if (!_passwordLengthRegExp.hasMatch(string)) {
      texts.add(PasswordValidationError.tooShort.text);
    }
    if (!_passwordLetterRegExp.hasMatch(string)) {
      texts.add(PasswordValidationError.missingLetter.text);
    }
    if (!_passwordDigitRegExp.hasMatch(string)) {
      texts.add(PasswordValidationError.missingDigit.text);
    }
    if (texts.isEmpty) return null;
    return texts.join('\n');
  }
}
