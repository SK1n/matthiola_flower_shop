import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:matthiola_flower_shop/core/router/router.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/core/utils/snackbar_util.dart';
import 'package:matthiola_flower_shop/features/home_scaffold/use_cases/home_scaffold_bloc.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

part 'listener.dart';

class HomeScaffoldScreen extends StatelessWidget {
  const HomeScaffoldScreen({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          context
              .read<HomeScaffoldBloc>()
              .add(ShellIndexChangedEvent(index, navigationShell));
        },
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          NavigationDestination(
            selectedIcon: const Icon(Icons.home),
            icon: const Icon(Icons.home_outlined),
            label: context.t.home.home,
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.favorite),
            icon: const Icon(Icons.favorite_border),
            label: context.t.home.favorite,
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.person),
            icon: const Icon(Icons.person_outline),
            label: context.t.home.profile,
          ),
        ],
      ),
      body: BlocSideEffectListener<HomeScaffoldBloc, BaseCommand>(
        listener: _sideEffectListener,
        child: SafeArea(
          child: navigationShell,
        ),
      ),
    );
  }
}
