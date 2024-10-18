part of 'home_screen.dart';

void _sideEffectListener(BuildContext context, BaseCommand command) {
  command.when(
    failure: (failure) {
      return SnackbarUtil.showErrorSnackbar(context, failure.message);
    },
    success: (success) {
      return SnackbarUtil.showSuccessSnackbar(context, success);
    },
    pop: ({data}) => context.pop(),
    go: (route) {
      switch (route.runtimeType) {
        case FlowerDetailsRoute:
          (route as FlowerDetailsRoute).go(context);
        case LoginRoute:
          (route as LoginRoute).pushReplacement(context);
        case CartRoute:
          (route as CartRoute).go(context);
      }
    },
  );
}
