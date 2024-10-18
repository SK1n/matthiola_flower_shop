import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:matthiola_flower_shop/core/validators/email_validator.dart';
import 'package:matthiola_flower_shop/core/validators/password_validator.dart';
import 'package:matthiola_flower_shop/core/validators/phone_validator.dart';
import 'package:matthiola_flower_shop/core/validators/required_validator.dart';

part 'create_account_form_state.dart';

class CreateAccountFormCubit extends Cubit<CreateAccountFormState> {
  CreateAccountFormCubit() : super(const CreateAccountFormState());

  void emailChanged(String? value) {
    if (value == null) {
      emit(
        state.copyWith(
          email: const EmailValidator.pure(),
        ),
      );
      return;
    }
    final email = EmailValidator.dirty(value);
    emit(state.copyWith(email: email));
  }

  void passwordChanged(String value) {
    final password = PasswordValidator.dirty((value, state.password.value.$2));
    emit(state.copyWith(password: password));
  }

  void rePasswordChanged(String value) {
    final password = PasswordValidator.dirty((state.password.value.$1, value));
    emit(state.copyWith(password: password));
  }

  void usernameChanged(String value) {
    final username = RequiredValidator.dirty(value);
    emit(state.copyWith(username: username));
  }

  void phoneChanged(String value) {
    final phone = PhoneValidator.dirty(value);
    emit(state.copyWith(phone: phone));
  }

  void addressChanged(String value) {
    final address = RequiredValidator.dirty(value);
    emit(state.copyWith(address: address));
  }

  void showPassword() {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  void isValid() {
    final fields = <FormzInput<dynamic, dynamic>>[
      state.email,
      state.password,
      state.username,
      state.address,
      state.phone,
    ];
    if (Formz.isPure(fields)) return emit(state.copyWith(formIsValid: false));
    return emit(state.copyWith(formIsValid: Formz.validate(fields)));
  }

  void resetForm() {
    emit(
      state.copyWith(
        email: const EmailValidator.pure(),
        password: const PasswordValidator.pure(),
        username: const RequiredValidator.pure(),
        showPassword: false,
      ),
    );
  }
}
