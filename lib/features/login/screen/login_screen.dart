import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:matthiola_flower_shop/core/router/router.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/core/utils/extensions/build_context_extension.dart';
import 'package:matthiola_flower_shop/core/utils/extensions/input_extension.dart';
import 'package:matthiola_flower_shop/core/utils/snackbar_util.dart';
import 'package:matthiola_flower_shop/features/login/use_cases/bloc/login_bloc.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';
import 'package:matthiola_flower_shop/widgets/loading_widget.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

part '../widgets/forgot_password_text.dart';
part '../widgets/input_email.dart';
part '../widgets/input_password.dart';
part '../widgets/register_text.dart';
part '../widgets/submit_button.dart';
part 'listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSideEffectListener<LoginBloc, BaseCommand>(
      listener: _sideEffectListener,
      child: Scaffold(
        appBar: AppBar(
          // title: Text(context.t.sign_in.appBarTitle),
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state.isLoading) return const LoadingWidget();
                return Center(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(60),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(60),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 100,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const _InputEmail(),
                              const Gap(20),
                              const _InputPassword(),
                              const Gap(20),
                              const _ForgotPasswordText(),
                              const Gap(20),
                              _SubmitButton(state),
                              const Gap(40),
                              const _RegisterText(),
                              const Gap(20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
