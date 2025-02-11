part of '../screen/create_account_screen.dart';

class _InputPassword extends StatelessWidget {
  const _InputPassword();

  @override
  Widget build(BuildContext context) {
    void passwordChanged(String value) {
      context.read<CreateAccountFormCubit>().passwordChanged(value);
    }

    return BlocBuilder<CreateAccountFormCubit, CreateAccountFormState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: passwordChanged,
          initialValue: state.password.value.$1,
          obscureText: !state.showPassword,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            labelText: context.t.sign_up.passwordLabel,
            suffixIcon: GestureDetector(
              onTap: () {
                context.read<CreateAccountFormCubit>().showPassword();
              },
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
