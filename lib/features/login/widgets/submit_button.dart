part of '../screen/login_screen.dart';

class _SubmitButton extends StatelessWidget {
  const _SubmitButton(this.state);

  final LoginState state;

  @override
  Widget build(BuildContext context) {
    final isValid = context.select((LoginBloc bloc) => bloc.state.isValid);
    return FilledButton.icon(
      onPressed: isValid ? () => _onPressed(context) : null,
      icon: const Icon(Icons.arrow_forward_ios),
      iconAlignment: IconAlignment.end,
      label: Text(context.t.sign_in.signIn),
    );
  }

  void _onPressed(BuildContext context) {
    context.read<LoginBloc>().add(const LoginRequestedEvent());
  }
}
