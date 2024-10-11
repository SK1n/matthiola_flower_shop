part of '../screen/login_screen.dart';

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: CupertinoButton.filled(
        onPressed: () {
          context.read<LoginBloc>().add(const LoginRequestedEvent());
        },
        child: Text(
          context.t.sign_in.signIn,
        ),
      ),
    );
  }
}
