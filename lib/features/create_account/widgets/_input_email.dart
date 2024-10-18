part of '../screen/create_account_screen.dart';

class _InputEmail extends StatelessWidget {
  const _InputEmail();

  @override
  Widget build(BuildContext context) {
    void valueChanged(String value) {
      context.read<CreateAccountFormCubit>().emailChanged(value);
    }

    return BlocBuilder<CreateAccountFormCubit, CreateAccountFormState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: valueChanged,
          initialValue: state.email.value,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: t.sign_up.emailLabel,
            errorText: state.email.getError,
          ),
        );
      },
    );
  }
}
