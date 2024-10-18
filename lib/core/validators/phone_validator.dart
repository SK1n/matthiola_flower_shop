import 'package:formz/formz.dart';
import 'package:matthiola_flower_shop/core/constants/app_constants.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';

enum PhoneValidationError {
  required(AppConstants.REQUIRED_TEXT),
  invalid(AppConstants.PHONE_FORMAT_TEXT);

  const PhoneValidationError(this.key);
  final String key;
  String get text => t[key] as String;
}

class PhoneValidator extends FormzInput<String, String> {
  const PhoneValidator.pure() : super.pure('');

  const PhoneValidator.dirty([super.value = '']) : super.dirty();

  static final RegExp _phoneRegExp = RegExp(
    AppConstants.PHONE_REG_EXP,
  );

  @override
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return PhoneValidationError.required.text;
    }
    return _phoneRegExp.hasMatch(value)
        ? null
        : PhoneValidationError.invalid.text;
  }
}
