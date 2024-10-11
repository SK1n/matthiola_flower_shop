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
            errorText: _getErrorText(context, state.email),
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
      case EmailValidationError.required:
        return context.t.sign_up.required;
      case EmailValidationError.invalid:
        return context.t.sign_up.emailFormat;
    }
    return null;
  }
}
