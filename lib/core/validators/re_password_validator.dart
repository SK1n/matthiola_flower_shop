import 'package:formz/formz.dart';

enum RePasswordValidationError { required, invalid }

class RePasswordValidator extends FormzInput<
    ({String value, String matchedValue}), RePasswordValidationError?> {
  const RePasswordValidator.pure() : super.pure((value: '', matchedValue: ''));

  const RePasswordValidator.dirty([super.value = (value: '', matchedValue: '')])
      : super.dirty();

  @override
  RePasswordValidationError? validator(
    ({String value, String matchedValue}) value,
  ) {
    if (value.value.isEmpty) {
      return RePasswordValidationError.required;
    }
    if (value.value != value.matchedValue) {
      return RePasswordValidationError.invalid;
    }
    return null;
  }
}
