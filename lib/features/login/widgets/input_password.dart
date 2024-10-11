part of '../screen/login_screen.dart';

class _InputPassword extends StatelessWidget {
  const _InputPassword();

  @override
  Widget build(BuildContext context) {
    void passwordChanged(String value) {
      context.read<LoginFormCubit>().updatePassword(value);
    }

    void toggleShowPassword() {
      context.read<LoginFormCubit>().toggleShowPassword();
    }

    return BlocBuilder<LoginFormCubit, LoginFormState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: passwordChanged,
          initialValue: state.password.value,
          obscureText: !state.showPassword,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: t.sign_in.passwordLabel,
            border: const OutlineInputBorder(),
            suffixIcon: GestureDetector(
              onTap: toggleShowPassword,
              child: Icon(
                state.showPassword
                    ? CupertinoIcons.eye
                    : CupertinoIcons.eye_slash,
              ),
            ),
            errorText: _getErrorText(context, state.password),
          ),
        );
      },
    );
  }

  String? _getErrorText(
    BuildContext context,
    FormzInput<dynamic, dynamic> field,
  ) {
    if (field.isPure || field.error == null) {
      return null;
    }

    final errors = field.error as Set<PasswordValidationError>;
    final errorMessages = <String>[];

    if (errors.contains(PasswordValidationError.required)) {
      return context.t.generic.required;
    }

    if (errors.contains(PasswordValidationError.tooShort)) {
      errorMessages.add(context.t.sign_in.passwordShort);
    }
    if (errors.contains(PasswordValidationError.missingLetter)) {
      errorMessages.add(context.t.sign_in.passwordMissingLetter);
    }
    if (errors.contains(PasswordValidationError.missingDigit)) {
      errorMessages.add(context.t.sign_in.passwordMissingDigit);
    }

    return errorMessages.isNotEmpty ? errorMessages.join('\n') : null;
  }
}
