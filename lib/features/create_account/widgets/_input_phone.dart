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
            errorText: _getErrorText(context, state.phone),
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

    switch (field.error) {
      case PhoneValidationError.required:
        return context.t.sign_up.required;
      case PhoneValidationError.invalid:
        return context.t.sign_up.phoneFormat;
    }
    return null;
  }
}
