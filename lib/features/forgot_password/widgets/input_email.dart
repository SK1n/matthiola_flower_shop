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
            errorText: state.email.getError,
          ),
        );
      },
    );
  }
}
