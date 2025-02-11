part of '../screen/cart_screen.dart';

class _InputEmail extends StatelessWidget {
  const _InputEmail();

  @override
  Widget build(BuildContext context) {
    void valueChanged(String value) {
      context.read<CartBloc>().add(EmailChangedEvent(value));
    }

    final field = context.select((CartBloc bloc) => bloc.state.email);

    return TextFormField(
      onChanged: valueChanged,
      initialValue: field.value,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: t.sign_up.emailLabel,
        errorText: field.getError,
      ),
    );
  }
}
