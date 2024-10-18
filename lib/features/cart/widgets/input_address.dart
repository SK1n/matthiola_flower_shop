part of '../screen/cart_screen.dart';

class _InputAddress extends StatelessWidget {
  const _InputAddress();

  @override
  Widget build(BuildContext context) {
    void valueChanged(String value) {
      context.read<CartFormCubit>().addressChanged(value);
    }

    return BlocBuilder<CartFormCubit, CartFormState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: valueChanged,
          controller: state.addressController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: context.t.sign_up.addressLabel,
            errorText: state.address.getError,
          ),
        );
      },
    );
  }
}
