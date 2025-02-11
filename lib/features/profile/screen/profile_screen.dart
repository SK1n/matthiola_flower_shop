import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:matthiola_flower_shop/core/di/di.dart';
import 'package:matthiola_flower_shop/core/router/router.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/core/utils/extensions/build_context_extension.dart';
import 'package:matthiola_flower_shop/core/utils/snackbar_util.dart';
import 'package:matthiola_flower_shop/features/home/use_cases/home_bloc.dart';
import 'package:matthiola_flower_shop/features/profile/use_cases/profile_bloc.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

part 'listener.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSideEffectConsumer<HomeBloc, HomeState, BaseCommand>(
      sideEffectListener: _sideEffectListener,
      builder: (context, state) {
        return BlocSideEffectConsumer<ProfileBloc, ProfileState, BaseCommand>(
          sideEffectListener: _profileSideEffectListener,
          builder: (context, profileState) {
            return state.isAnonymous
                ? _buildAnonymous(context)
                : CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        title: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Icon(
                                Icons.person,
                                color: context.colorScheme.primary,
                              ),
                            ),
                            Text(context.t.home.profile),
                          ],
                        ),
                      ),
                      const SliverGap(10),
                      SliverToBoxAdapter(
                        child: Center(
                          child: CircleAvatar(
                            radius: 40,
                            child: Icon(
                              Icons.person,
                              color: context.colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: ListTile(
                          leading: Icon(
                            Icons.person,
                            color: context.colorScheme.primary,
                          ),
                          title: Text(state.user.displayName),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: ListTile(
                          leading: Icon(
                            Icons.email,
                            color: context.colorScheme.primary,
                          ),
                          title: Text(state.user.email),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: ListTile(
                          leading: Icon(
                            Icons.location_on,
                            color: context.colorScheme.primary,
                          ),
                          title: Text(state.user.address),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: ListTile(
                          leading: Icon(
                            Icons.phone,
                            color: context.colorScheme.primary,
                          ),
                          title: Text(state.user.phone),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.all(8),
                        sliver: SliverToBoxAdapter(
                          child: OutlinedButton(
                            onPressed: () {
                              context
                                  .read<HomeBloc>()
                                  .add(const SignOutEvent());
                            },
                            child: Text(context.t.profile.logOut),
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.all(8),
                        sliver: SliverToBoxAdapter(
                          child: OutlinedButton(
                            onPressed: () {
                              context
                                  .read<ProfileBloc>()
                                  .add(const OpenDeleteDialogEvent());
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: context.colorScheme.error,
                            ),
                            child: Text(
                              context.t.profile.deleteAccount,
                              style: TextStyle(
                                color: context.colorScheme.onErrorContainer,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
          },
        );
      },
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

  Widget _buildAnonymous(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_outline,
            size: 100,
            color: context.colorScheme.primary,
          ),
          const Gap(20),
          Text(
            context.t.generic.anonymous.profil,
            style: context.textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const Gap(30),
          FilledButton(
            onPressed: () {
              context.read<ProfileBloc>().add(const LoginEvent());
            },
            child: Text(context.t.generic.anonymous.button),
          ),
        ],
      ),
    );
  }
}
