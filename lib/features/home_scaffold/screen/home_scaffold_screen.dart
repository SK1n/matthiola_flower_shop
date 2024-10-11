import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:matthiola_flower_shop/core/router/router.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/core/utils/snackbar_util.dart';
import 'package:matthiola_flower_shop/features/cart/screen/cart_screen.dart';
import 'package:matthiola_flower_shop/features/cart/use_cases/bloc/cart_bloc.dart';
import 'package:matthiola_flower_shop/features/favorites/screen/favorite_screen.dart';
import 'package:matthiola_flower_shop/features/home/screen/home_screen.dart';
import 'package:matthiola_flower_shop/features/home_scaffold/use_cases/home_scaffold_bloc.dart';
import 'package:matthiola_flower_shop/features/profile/screen/profile_screen.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';

part 'listener.dart';

class HomeScaffoldScreen extends StatelessWidget {
  const HomeScaffoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSideEffectListener<CartBloc, BaseCommand>(
      listener: _cartSideEffectListener,
      child: BlocSideEffectListener<HomeScaffoldBloc, BaseCommand>(
        listener: _sideEffectListener,
        child: BlocBuilder<HomeScaffoldBloc, HomeScaffoldState>(
          builder: (context, state) {
            return Scaffold(
              bottomNavigationBar: NavigationBar(
                onDestinationSelected: (index) {
                  context
                      .read<HomeScaffoldBloc>()
                      .add(HomeScaffoldOnDestinationSelectedEvent(index));
                },
                selectedIndex: state.index,
                destinations: [
                  NavigationDestination(
                    selectedIcon: const Icon(Icons.favorite),
                    icon: const Icon(Icons.favorite_border),
                    label: context.t.home.favorite,
                  ),
                  NavigationDestination(
                    selectedIcon: const Icon(Icons.home),
                    icon: const Icon(Icons.home_outlined),
                    label: context.t.home.home,
                  ),
                  NavigationDestination(
                    selectedIcon: const Icon(Icons.shopping_bag),
                    icon: Badge(
                      label: Center(
                        child: Text(
                          context
                              .watch<CartBloc>()
                              .state
                              .items
                              .length
                              .toString(),
                        ),
                      ),
                      child: const Icon(Icons.shopping_bag_outlined),
                    ),
                    label: context.t.home.cart,
                  ),
                  NavigationDestination(
                    selectedIcon: const Icon(Icons.person),
                    icon: const Icon(Icons.person_outline),
                    label: context.t.home.profile,
                  ),
                ],
              ),
              body: SafeArea(
                child: [
                  const FavoriteScreen(),
                  HomeScreen(),
                  const CartScreen(),
                  const ProfileScreen(),
                ][state.index],
              ),
            );
          },
        ),
      ),
    );
  }
}
