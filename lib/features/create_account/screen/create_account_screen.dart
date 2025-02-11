import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/core/utils/extensions/input_extension.dart';
import 'package:matthiola_flower_shop/core/utils/snackbar_util.dart';
import 'package:matthiola_flower_shop/features/create_account/use_cases/bloc/create_account_bloc.dart';
import 'package:matthiola_flower_shop/features/create_account/use_cases/cubit/create_account_form_cubit.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';
import 'package:matthiola_flower_shop/widgets/loading_widget.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

part '../widgets/input_address.dart';
part '../widgets/input_email.dart';
part '../widgets/input_password.dart';
part '../widgets/input_phone.dart';
part '../widgets/input_re_password.dart';
part '../widgets/input_username.dart';
part 'listener.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: BlocSideEffectConsumer<CreateAccountBloc, CreateAccountState,
          BaseCommand>(
        sideEffectListener: _sideEffectListener,
        builder: _builder,
      ),
    );
  }

  Widget _builder(BuildContext context, CreateAccountState state) {
    if (state.isLoading) return const LoadingWidget();
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: Column(
            children: [
              const Gap(10),
              const _InputEmail(),
              const Gap(10),
              const _InputUsername(),
              const Gap(10),
              const _InputAddress(),
              const Gap(10),
              const _InputPhone(),
              const Gap(10),
              const _InputPassword(),
              const Gap(10),
              const _InputRePassword(),
              const Gap(20),
              FilledButton(
                onPressed: state.formIsValid
                    ? () {
                        context
                            .read<CreateAccountBloc>()
                            .add(const CreateAccountCreateEvent());
                      }
                    : null,
                child: Text(
                  context.t.sign_up.createAccount,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
