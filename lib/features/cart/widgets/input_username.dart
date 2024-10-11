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
            errorText: _getErrorText(context, state.username),
          ),
        );
      },
    );
  }

  String? _getErrorText(
    BuildContext context,
    FormzInput<dynamic, dynamic> field,
  ) {
    if (field.isPure || field.error == null) {
      return null;
    }

    switch (field.error) {
      case RequiredValidationError.invalid:
        return context.t.sign_up.required;
    }
    return null;
  }
}
