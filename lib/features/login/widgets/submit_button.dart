part of '../screen/login_screen.dart';

class _SubmitButton extends StatelessWidget {
  const _SubmitButton(this.state);

  final LoginState state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: FilledButton(
        onPressed: state.formIsValid
            ? () {
                context.read<LoginBloc>().add(const LoginRequestedEvent());
              }
            : null,
        child: Text(
          context.t.sign_in.signIn,
        ),
      ),
    );
  }
}
