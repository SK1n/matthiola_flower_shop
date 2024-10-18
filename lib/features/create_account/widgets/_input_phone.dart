part of '../screen/create_account_screen.dart';

class _InputPhone extends StatelessWidget {
  const _InputPhone();

  @override
  Widget build(BuildContext context) {
    void valueChanged(String value) {
      context.read<CreateAccountFormCubit>().phoneChanged(value);
    }

    return BlocBuilder<CreateAccountFormCubit, CreateAccountFormState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: valueChanged,
          initialValue: state.phone.value,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: t.sign_up.phoneLabel,
            errorMaxLines: 10,
            errorText: state.phone.getError,
          ),
        );
      },
    );
  }
}
