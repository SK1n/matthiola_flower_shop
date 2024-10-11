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
          initialValue: state.rePassword.value.value,
          obscureText: !state.showPassword,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: t.sign_up.rePasswordLabel,
            errorText: _getErrorText(context, state.rePassword),
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
      case RePasswordValidationError.required:
        return context.t.sign_up.required;
      case RePasswordValidationError.invalid:
        return context.t.sign_up.passwordMismatch;
    }
    return null;
  }
}
