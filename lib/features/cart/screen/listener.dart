part of 'cart_screen.dart';

void _sideEffectListener(BuildContext context, BaseCommand command) {
  command.when(
    failure: (failure) {
      return SnackbarUtil.showErrorSnackbar(context, failure.message);
    },
    success: (success) {
      return SnackbarUtil.showSuccessSnackbar(context, success);
    },
    go: (route) {},
    showDialog: ([dynamic data]) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(context.t.cart.removeDialog.title),
            content: Text(
              context.t.cart.removeDialog.content,
            ),
            actions: [
              TextButton(
                child: Text(context.t.cart.removeDialog.cancel),
                onPressed: () {
                  context.pop();
                },
              ),
              TextButton(
                child: Text(context.t.cart.removeDialog.remove),
                onPressed: () {
                  if (data == null) return context.pop();
                  getIt<CartBloc>().add(RecyclePressed(data as CartEntity));
                  context.pop();
                },
              ),
            ],
          );
        },
      );
    },
  );
}
