part of '../screen/create_account_screen.dart';

class _InputUsername extends StatelessWidget {
  const _InputUsername();

  @override
  Widget build(BuildContext context) {
    void valueChanged(String value) {
      context.read<CreateAccountFormCubit>().usernameChanged(value);
    }

    return BlocBuilder<CreateAccountFormCubit, CreateAccountFormState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: valueChanged,
          initialValue: state.username.value,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: t.sign_up.usernameLabel,
            errorText: state.username.getError,
          ),
        );
      },
    );
  }
}
