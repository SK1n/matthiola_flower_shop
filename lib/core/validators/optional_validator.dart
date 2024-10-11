import 'package:formz/formz.dart';

enum OptionalValidationError { invalid }

class OptionalValidator extends FormzInput<String, OptionalValidationError> {
  const OptionalValidator.pure() : super.pure('');

  const OptionalValidator.dirty([super.value = '']) : super.dirty();
  @override
  OptionalValidationError? validator(String? value) {
    return null;
  }
}
