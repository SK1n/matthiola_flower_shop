import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:matthiola_flower_shop/core/validators/email_validator.dart';
import 'package:matthiola_flower_shop/core/validators/password_validator.dart';
import 'package:matthiola_flower_shop/core/validators/phone_validator.dart';
import 'package:matthiola_flower_shop/core/validators/re_password_validator.dart';
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
    final password = PasswordValidator.dirty(value);
    emit(state.copyWith(password: password));
    rePasswordChanged(value);
  }

  void rePasswordChanged(String value) {
    final rePassword = RePasswordValidator.dirty(
      (value: value, matchedValue: state.password.value),
    );
    emit(state.copyWith(rePassword: rePassword));
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

  bool isValid() {
    final fields = <FormzInput<dynamic, dynamic>>[
      state.email,
      state.password,
      state.rePassword,
      state.username,
      state.address,
      state.phone,
    ];

    validate();
    return Formz.validate(fields);
  }

  void validate() {
    final updatedState = state.copyWith(
      email: EmailValidator.dirty(state.email.value),
      password: PasswordValidator.dirty(state.password.value),
      rePassword: RePasswordValidator.dirty(state.rePassword.value),
      username: RequiredValidator.dirty(state.username.value),
      address: RequiredValidator.dirty(state.address.value),
      phone: PhoneValidator.dirty(state.phone.value),
    );
    emit(updatedState);
  }

  void resetForm() {
    emit(
      state.copyWith(
        email: const EmailValidator.pure(),
        password: const PasswordValidator.pure(),
        rePassword: const RePasswordValidator.pure(),
        username: const RequiredValidator.pure(),
        showPassword: false,
      ),
    );
  }
}
