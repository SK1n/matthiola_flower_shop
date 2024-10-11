part of 'login_screen.dart';

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
        case CreateAccountRoute:
          (route as CreateAccountRoute).go(context);
        case ForgotPasswordRoute:
          (route as ForgotPasswordRoute).go(context);
        case HomeScaffoldRoute:
          (route as HomeScaffoldRoute).pushReplacement(context);
      }
    },
  );
}
