// ignore_for_file: constant_identifier_names

import 'package:formz/formz.dart';

enum NumberValidationError { required, invalid }

class NumberValidator extends FormzInput<String, NumberValidationError> {
  const NumberValidator.pure() : super.pure('');

  const NumberValidator.dirty([super.value = '']) : super.dirty();

  static const String _price_REG_EXP = r'^\d{1,8}(?:\.\d{1,2})?$';

  static final RegExp _priceRegExp = RegExp(
    _price_REG_EXP,
  );

  @override
  NumberValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return NumberValidationError.required;
    }
    return _priceRegExp.hasMatch(value) ? null : NumberValidationError.invalid;
  }
}
