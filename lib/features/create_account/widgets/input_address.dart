part of '../screen/create_account_screen.dart';

class _InputAddress extends StatelessWidget {
  const _InputAddress();

  @override
  Widget build(BuildContext context) {
    void valueChanged(String value) {
      context.read<CreateAccountFormCubit>().addressChanged(value);
    }

    return BlocBuilder<CreateAccountFormCubit, CreateAccountFormState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: valueChanged,
          initialValue: state.address.value,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: context.t.sign_up.addressLabel,
            errorText: state.address.getError,
          ),
        );
      },
    );
  }
}
