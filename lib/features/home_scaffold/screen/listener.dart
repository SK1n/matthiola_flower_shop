part of 'home_scaffold_screen.dart';

void _sideEffectListener(BuildContext context, BaseCommand command) {
  command.when(
    failure: (failure) {
      return SnackbarUtil.showErrorSnackbar(context, failure.message);
    },
    success: (success) {
      return SnackbarUtil.showSuccessSnackbar(context, success);
    },
    pop: ({data}) => context.pop(),
    go: (route) async {
      switch (route.runtimeType) {
        case FlowerDetailsRoute:
          (route as FlowerDetailsRoute).go(context);
      }
    },
  );
}

void _cartSideEffectListener(BuildContext context, BaseCommand command) {
  command.when(
    failure: (failure) {
      return SnackbarUtil.showErrorSnackbar(context, failure.message);
    },
    success: (success) {
      return SnackbarUtil.showSuccessSnackbar(context, success);
    },
  );
}
