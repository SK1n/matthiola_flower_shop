import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/core/utils/snackbar_util.dart';
import 'package:matthiola_flower_shop/core/validators/email_validator.dart';
import 'package:matthiola_flower_shop/features/forgot_password/use_cases/bloc/forgot_password_bloc.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';
import 'package:matthiola_flower_shop/widgets/loading_widget.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';

part '../widgets/input_email.dart';
part 'listener.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.reset_password.title),
      ),
      body: BlocSideEffectListener<ForgotPasswordBloc, BaseCommand>(
        listener: _sideEffectListener,
        child: SafeArea(
          child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
            builder: (context, state) {
              if (state.isLoading) return const LoadingWidget();
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    const Gap(10),
                    const _InputEmail(),
                    const Gap(20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: CupertinoButton.filled(
                        onPressed: () {
                          context
                              .read<ForgotPasswordBloc>()
                              .add(const ForgotPasswordSubmitEvent());
                        },
                        child: Text(
                          context.t.reset_password.reset,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
