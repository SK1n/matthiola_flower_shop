part of '../screen/cart_screen.dart';

class _InputUsername extends StatelessWidget {
  const _InputUsername();

  @override
  Widget build(BuildContext context) {
    void valueChanged(String value) {
      context.read<CartFormCubit>().usernameChanged(value);
    }

    return BlocBuilder<CartFormCubit, CartFormState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: valueChanged,
          controller: state.usernameController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: t.sign_up.usernameLabel,
            errorText: state.username.getError,
          ),
        );
      },
    );
  }
}
