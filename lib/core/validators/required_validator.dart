import 'package:formz/formz.dart';
import 'package:matthiola_flower_shop/core/constants/app_constants.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';

enum RequiredValidationError {
  required(AppConstants.REQUIRED_TEXT);

  const RequiredValidationError(this.key);
  final String key;
  String get text => t[key] as String;
}

class RequiredValidator extends FormzInput<String, String> {
  const RequiredValidator.pure() : super.pure('');

  const RequiredValidator.dirty([super.value = '']) : super.dirty();
  @override
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return RequiredValidationError.required.text;
    }
    return null;
  }
}
