part of '../screen/login_screen.dart';

class _InputPassword extends StatelessWidget {
  const _InputPassword();

  @override
  Widget build(BuildContext context) {
    void passwordChanged(String value) {
      context.read<LoginBloc>().add(PasswordChangedEvent(value));
    }

    void toggleShowPassword() {
      context.read<LoginBloc>().add(const TogglePasswordVisibilityEvent());
    }

    final field = context.select((LoginBloc bloc) => bloc.state.password);
    final showPassword =
        context.select((LoginBloc bloc) => bloc.state.showPassword);

    return TextFormField(
      onChanged: passwordChanged,
      initialValue: field.value.$1,
      obscureText: !showPassword,
      decoration: InputDecoration(
        labelText: t.sign_in.passwordLabel,
        suffixIcon: GestureDetector(
          onTap: toggleShowPassword,
          child: Icon(
            showPassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
          ),
        ),
        errorText: field.getErrorTuple1,
      ),
    );
  }
}
