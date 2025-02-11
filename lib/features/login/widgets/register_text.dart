part of '../screen/login_screen.dart';

class _RegisterText extends StatelessWidget {
  const _RegisterText();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: context.textTheme.titleMedium,
          children: [
            TextSpan(
              text: t.sign_in.noAccount,
            ),
            TextSpan(
              text: ' ${t.sign_in.register}',
              style: context.textTheme.titleMedium!.copyWith(
                color: context.colorScheme.primary,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.read<LoginBloc>().add(
                        const RedirectEvent(CreateAccountRoute()),
                      );
                },
            ),
          ],
        ),
      ),
    );
  }
}
