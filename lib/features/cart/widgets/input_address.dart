part of '../screen/cart_screen.dart';

class _InputAddress extends StatelessWidget {
  const _InputAddress();

  @override
  Widget build(BuildContext context) {
    void valueChanged(String value) {
      context.read<CartBloc>().add(AddressChangedEvent(value));
    }

    final field = context.select((CartBloc bloc) => bloc.state.address);

    return TextFormField(
      onChanged: valueChanged,
      keyboardType: TextInputType.text,
      initialValue: field.value,
      decoration: InputDecoration(
        labelText: context.t.sign_up.addressLabel,
        errorText: field.getError,
      ),
    );
  }
}
