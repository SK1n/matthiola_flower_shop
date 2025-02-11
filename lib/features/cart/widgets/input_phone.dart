part of '../screen/cart_screen.dart';

class _InputPhone extends StatelessWidget {
  const _InputPhone();

  @override
  Widget build(BuildContext context) {
    void valueChanged(String value) {
      context.read<CartBloc>().add(PhoneChangedEvent(value));
    }

    final field = context.select((CartBloc bloc) => bloc.state.phone);

    return TextFormField(
      onChanged: valueChanged,
      initialValue: field.value,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: t.sign_up.phoneLabel,
        errorMaxLines: 10,
        errorText: field.getError,
      ),
    );
  }
}
