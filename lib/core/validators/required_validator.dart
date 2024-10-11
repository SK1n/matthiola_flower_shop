import 'package:formz/formz.dart';

enum RequiredValidationError { invalid }

class RequiredValidator extends FormzInput<String, RequiredValidationError> {
  const RequiredValidator.pure() : super.pure('');

  const RequiredValidator.dirty([super.value = '']) : super.dirty();
  @override
  RequiredValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return RequiredValidationError.invalid;
    }
    return null;
  }
}
