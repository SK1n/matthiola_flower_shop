part of 'login_screen.dart';

void _sideEffectListener(BuildContext context, BaseCommand command) {
  command.when(
    failure: (failure) {
      return SnackbarUtil.showErrorSnackbar(context, failure.message);
    },
    success: (success) {
      return SnackbarUtil.showSuccessSnackbar(context, success);
    },
    pop: ({data}) {
      context.pop();
    },
    go: (route) {
      switch (route.runtimeType) {
        case CreateAccountRoute:
          (route as CreateAccountRoute).push<void>(context);
        case ForgotPasswordRoute:
          (route as ForgotPasswordRoute).push<void>(context);
      }
    },
  );
}
