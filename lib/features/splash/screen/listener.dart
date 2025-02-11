part of 'splash_screen.dart';

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
        case LoginRoute:
          (route as LoginRoute).go(context);
        case HomeScaffoldRoute:
          GoRouter.of(context).pushReplacement(const HomeRoute().location);
      }
    },
  );
}
