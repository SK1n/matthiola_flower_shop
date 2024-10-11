import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:matthiola_flower_shop/core/router/router.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/core/utils/extensions/build_context_extension.dart';
import 'package:matthiola_flower_shop/core/utils/snackbar_util.dart';
import 'package:matthiola_flower_shop/features/home/use_cases/home_bloc.dart';
import 'package:matthiola_flower_shop/features/home_scaffold/use_cases/home_scaffold_bloc.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';

part 'listener.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSideEffectListener<HomeBloc, BaseCommand>(
      listener: _sideEffectListener,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.person),
                  ),
                  Text(context.t.home.profile),
                ],
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: CircleAvatar(
                                radius: 30,
                                child: Icon(Icons.person),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    state.user.displayName,
                                    style: context.textTheme.titleMedium,
                                  ),
                                  AutoSizeText(
                                    state.user.email,
                                    style: context.textTheme.titleMedium,
                                  ),
                                  AutoSizeText(
                                    state.user.address,
                                    style: context.textTheme.titleMedium,
                                  ),
                                  AutoSizeText(
                                    state.user.phone,
                                    style: context.textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: OutlinedButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(const SignOutEvent());
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 40),
                    ),
                    child: Text(context.t.profile.logOut),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void showDeleteAccountDialog(BuildContext context, HomeBloc bloc) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.t.profile.deleteAccount),
          content: Text(
            context.t.profile.deleteMessage,
          ),
          actions: <Widget>[
            TextButton(
              child: Text(context.t.profile.cancelDelete),
              onPressed: () => context.pop(),
            ),
            TextButton(
              child: Text(context.t.profile.confirmDelete),
              onPressed: () {
                bloc.add(const DeleteAccountEvent());
              },
            ),
          ],
        );
      },
    );
  }
}
