part of '../screen/create_account_screen.dart';

class _InputRePassword extends StatelessWidget {
  const _InputRePassword();

  @override
  Widget build(BuildContext context) {
    void rePasswordChanged(String value) {
      context.read<CreateAccountFormCubit>().rePasswordChanged(value);
    }

    return BlocBuilder<CreateAccountFormCubit, CreateAccountFormState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: rePasswordChanged,
          initialValue: state.password.value.$2,
          obscureText: !state.showPassword,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: t.sign_up.rePasswordLabel,
            errorText: state.password.getErrorTuple2,
          ),
        );
      },
    );
  }
}
