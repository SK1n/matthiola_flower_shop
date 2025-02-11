part of '../screen/cart_screen.dart';

class _InputUsername extends StatelessWidget {
  const _InputUsername();

  @override
  Widget build(BuildContext context) {
    void valueChanged(String value) {
      context.read<CartBloc>().add(UsernameChangedEvent(value));
    }

    final field = context.select((CartBloc bloc) => bloc.state.username);

    return TextFormField(
      onChanged: valueChanged,
      initialValue: field.value,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: t.sign_up.usernameLabel,
        errorText: field.getError,
      ),
    );
  }
}
