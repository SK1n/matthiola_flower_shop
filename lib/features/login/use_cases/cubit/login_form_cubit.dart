import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:matthiola_flower_shop/core/validators/email_validator.dart';
import 'package:matthiola_flower_shop/core/validators/password_validator.dart';

part 'login_form_state.dart';

class LoginFormCubit extends Cubit<LoginFormState> {
  LoginFormCubit() : super(const LoginFormState());

  void updateEmail(String value) {
    final email = EmailValidator.dirty(value);
    emit(state.copyWith(email: email));
  }

  void updatePassword(String value) {
    final password = PasswordValidator.dirty((value, value));
    emit(state.copyWith(password: password));
  }

  void toggleShowPassword() {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  void clear() {
    emit(
      state.copyWith(
        password: const PasswordValidator.pure(),
        email: const EmailValidator.pure(),
      ),
    );
  }

  void isValid() {
    final form = <FormzInput<dynamic, dynamic>>[state.email, state.password];
    if (Formz.isPure(form)) return emit(state.copyWith(formIsValid: false));
    return emit(state.copyWith(formIsValid: Formz.validate(form)));
  }
}
