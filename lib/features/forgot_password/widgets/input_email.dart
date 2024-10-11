part of '../screen/forgot_password_screen.dart';

class _InputEmail extends StatelessWidget {
  const _InputEmail();

  @override
  Widget build(BuildContext context) {
    void valueChanged(String value) {
      context.read<ForgotPasswordBloc>().add(ForgotPasswordUpdateEmail(value));
    }

    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: valueChanged,
          initialValue: state.email.value,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: context.t.reset_password.emailLabel,
            border: const OutlineInputBorder(),
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
        return context.t.generic.required;
      case EmailValidationError.invalid:
        return context.t.sign_in.emailFormat;
    }
    return null;
  }
}
