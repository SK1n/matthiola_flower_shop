part of '../screen/login_screen.dart';

class _InputEmail extends StatelessWidget {
  const _InputEmail();

  @override
  Widget build(BuildContext context) {
    void valueChanged(String value) {
      context.read<LoginFormCubit>().updateEmail(value);
    }

    return BlocBuilder<LoginFormCubit, LoginFormState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: valueChanged,
          initialValue: state.email.value,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: context.t.sign_in.emailLabel,
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
