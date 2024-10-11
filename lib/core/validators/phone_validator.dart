import 'package:formz/formz.dart';
import 'package:matthiola_flower_shop/core/constants/app_constants.dart';

enum PhoneValidationError { required, invalid }

class PhoneValidator extends FormzInput<String, PhoneValidationError> {
  const PhoneValidator.pure() : super.pure('');

  const PhoneValidator.dirty([super.value = '']) : super.dirty();

  static final RegExp _phoneRegExp = RegExp(
    AppConstants.PHONE_REG_EXP,
  );

  @override
  PhoneValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return PhoneValidationError.required;
    }
    return _phoneRegExp.hasMatch(value) ? null : PhoneValidationError.invalid;
  }
}
