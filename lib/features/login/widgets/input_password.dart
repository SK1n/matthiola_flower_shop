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
          initialValue: state.password.value.$1,
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
            errorText: state.password.getErrorTuple1,
          ),
        );
      },
    );
  }
}
