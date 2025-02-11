part of '../screen/login_screen.dart';

class _InputEmail extends StatelessWidget {
  const _InputEmail();

  @override
  Widget build(BuildContext context) {
    void valueChanged(String value) {
      context.read<LoginBloc>().add(EmailChangedEvent(value));
    }

    final field = context.select((LoginBloc bloc) => bloc.state.email);

    return TextFormField(
      onChanged: valueChanged,
      initialValue: field.value,
      decoration: InputDecoration(
        labelText: context.t.sign_in.emailLabel,
        errorText: field.getError,
      ),
    );
  }
}
