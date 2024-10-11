part of 'profile_screen.dart';

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
          {
            context
                .read<HomeScaffoldBloc>()
                .add(const HomeScaffoldOnDestinationSelectedEvent(1));
            (route as LoginRoute).pushReplacement(context);
          }
      }
    },
  );
}
