import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:matthiola_flower_shop/core/router/router.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/core/utils/extensions/build_context_extension.dart';
import 'package:matthiola_flower_shop/core/utils/extensions/input_extension.dart';
import 'package:matthiola_flower_shop/core/utils/snackbar_util.dart';
import 'package:matthiola_flower_shop/features/login/use_cases/bloc/login_bloc.dart';
import 'package:matthiola_flower_shop/features/login/use_cases/cubit/login_form_cubit.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';
import 'package:matthiola_flower_shop/widgets/loading_widget.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

part '../widgets/input_email.dart';
part '../widgets/input_password.dart';
part '../widgets/submit_button.dart';
part 'listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSideEffectListener<LoginBloc, BaseCommand>(
      listener: _sideEffectListener,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state.isLoading) return const LoadingWidget();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(40),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        context.t.sign_in.title,
                        style: context.textTheme.displaySmall,
                      ),
                    ),
                    const Gap(40),
                    const _InputEmail(),
                    const Gap(10),
                    const _InputPassword(),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            context
                                .read<LoginBloc>()
                                .add(const LoginForgotPasswordTappedEvent());
                          },
                          child: Text(context.t.reset_password.title),
                        ),
                      ],
                    ),
                    const Gap(10),
                    _SubmitButton(state),
                    Expanded(child: Container()),
                    Center(
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
                                        const LoginCreateAccountTappedEvent(),
                                      );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(20),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
