part of 'favorite_screen.dart';

void _sideEffectListener(BuildContext context, BaseCommand command) {
  command.when(
    failure: (failure) {
      return SnackbarUtil.showErrorSnackbar(context, failure.message);
    },
    success: (success) {
      return SnackbarUtil.showSuccessSnackbar(context, success);
    },
    go: (route) {
      switch (route.runtimeType) {
        case FlowerDetailsRoute:
          (route as FlowerDetailsRoute).go(context);
      }
    },
    pop: ({data}) => context.pop(),
  );
}
