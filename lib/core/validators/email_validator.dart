// ignore_for_file: constant_identifier_names

import 'package:formz/formz.dart';
import 'package:matthiola_flower_shop/core/constants/app_constants.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';

enum EmailValidationError {
  required(AppConstants.REQUIRED_TEXT),
  invalid(AppConstants.EMAIL_INVALID_TEXT);

  const EmailValidationError(this.key);
  final String key;
  String get text => t[key] as String;
}

class EmailValidator extends FormzInput<String, String> {
  const EmailValidator.pure() : super.pure('');

  const EmailValidator.dirty([super.value = '']) : super.dirty();

  static const String _EMAIL_REG_EXP =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static final RegExp _emailRegExp = RegExp(
    _EMAIL_REG_EXP,
  );

  @override
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return EmailValidationError.required.text;
    }
    return _emailRegExp.hasMatch(value)
        ? null
        : EmailValidationError.invalid.text;
  }
}
