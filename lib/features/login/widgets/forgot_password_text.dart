part of '../screen/login_screen.dart';

class _ForgotPasswordText extends StatelessWidget {
  const _ForgotPasswordText();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<LoginBloc>().add(
              const RedirectEvent(ForgotPasswordRoute()),
            );
      },
      child: Text(
        context.t.sign_in.reset,
        style: context.textTheme.titleMedium!.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
    );
  }
}
