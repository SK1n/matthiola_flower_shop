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
            errorText: _getErrorText(context, state.address),
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
