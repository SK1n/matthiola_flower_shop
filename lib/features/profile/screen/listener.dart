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

void _profileSideEffectListener(BuildContext context, BaseCommand command) {
  command.when(
    failure: (failure) {
      return SnackbarUtil.showErrorSnackbar(context, failure.message);
    },
    success: (success) {
      return SnackbarUtil.showSuccessSnackbar(context, success);
    },
    pop: ({data}) => context.pop(),
    showDialog: ([data]) {
      showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog.adaptive(
            title: Text(context.t.profile.deleteAccount),
            content: Text(context.t.profile.deleteMessage),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text(
                  context.t.profile.cancelDelete,
                ),
              ),
              FilledButton(
                onPressed: () {
                  getIt<HomeBloc>().add(const DeleteAccountEvent());

                  context.pop();
                },
                style: FilledButton.styleFrom(
                  backgroundColor: context.colorScheme.errorContainer,
                ),
                child: Text(
                  context.t.profile.confirmDelete,
                  style: TextStyle(
                    color: context.colorScheme.onErrorContainer,
                  ),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
