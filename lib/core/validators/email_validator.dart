// ignore_for_file: constant_identifier_names

import 'package:formz/formz.dart';

enum EmailValidationError { required, invalid }

class EmailValidator extends FormzInput<String, EmailValidationError> {
  const EmailValidator.pure() : super.pure('');

  const EmailValidator.dirty([super.value = '']) : super.dirty();

  static const String _EMAIL_REG_EXP =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static final RegExp _emailRegExp = RegExp(
    _EMAIL_REG_EXP,
  );

  @override
  EmailValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return EmailValidationError.required;
    }
    return _emailRegExp.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}
