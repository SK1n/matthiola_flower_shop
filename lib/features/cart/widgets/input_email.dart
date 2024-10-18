part of '../screen/cart_screen.dart';

class _InputEmail extends StatelessWidget {
  const _InputEmail();

  @override
  Widget build(BuildContext context) {
    void valueChanged(String value) {
      context.read<CartFormCubit>().emailChanged(value);
    }

    return BlocBuilder<CartFormCubit, CartFormState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: valueChanged,
          controller: state.emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: t.sign_up.emailLabel,
            errorText: state.email.getError,
          ),
        );
      },
    );
  }
}
