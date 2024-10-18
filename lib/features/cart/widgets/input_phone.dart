part of '../screen/cart_screen.dart';

class _InputPhone extends StatelessWidget {
  const _InputPhone();

  @override
  Widget build(BuildContext context) {
    void valueChanged(String value) {
      context.read<CartFormCubit>().phoneChanged(value);
    }

    return BlocBuilder<CartFormCubit, CartFormState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: valueChanged,
          controller: state.phoneController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: t.sign_up.phoneLabel,
            errorMaxLines: 10,
            errorText: state.phone.getError,
          ),
        );
      },
    );
  }
}
