import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:matthiola_flower_shop/core/di/di.dart';
import 'package:matthiola_flower_shop/features/cart/screen/cart_screen.dart';
import 'package:matthiola_flower_shop/features/cart/use_cases/bloc/cart_bloc.dart';
import 'package:matthiola_flower_shop/features/create_account/screen/create_account_screen.dart';
import 'package:matthiola_flower_shop/features/create_account/use_cases/bloc/create_account_bloc.dart';
import 'package:matthiola_flower_shop/features/create_account/use_cases/cubit/create_account_form_cubit.dart';
import 'package:matthiola_flower_shop/features/favorites/screen/favorite_screen.dart';
import 'package:matthiola_flower_shop/features/favorites/use_cases/favorite_bloc.dart';
import 'package:matthiola_flower_shop/features/flower_details/screen/flower_details_screen.dart';
import 'package:matthiola_flower_shop/features/flower_details/use_cases/flower_details_bloc.dart';
import 'package:matthiola_flower_shop/features/forgot_password/screen/forgot_password_screen.dart';
import 'package:matthiola_flower_shop/features/forgot_password/use_cases/bloc/forgot_password_bloc.dart';
import 'package:matthiola_flower_shop/features/home/screen/home_screen.dart';
import 'package:matthiola_flower_shop/features/home/use_cases/home_bloc.dart';
import 'package:matthiola_flower_shop/features/home_scaffold/screen/home_scaffold_screen.dart';
import 'package:matthiola_flower_shop/features/home_scaffold/use_cases/home_scaffold_bloc.dart';
import 'package:matthiola_flower_shop/features/login/screen/login_screen.dart';
import 'package:matthiola_flower_shop/features/login/use_cases/bloc/login_bloc.dart';
import 'package:matthiola_flower_shop/features/profile/screen/profile_screen.dart';
import 'package:matthiola_flower_shop/features/profile/use_cases/profile_bloc.dart';
import 'package:matthiola_flower_shop/features/splash/screen/splash_screen.dart';
import 'package:matthiola_flower_shop/features/splash/use_cases/bloc/splash_bloc.dart';
import 'package:matthiola_flower_shop/widgets/loading_widget.dart';
import 'package:upgrader/upgrader.dart';

part 'router.g.dart';

final router = GoRouter(
  routes: $appRoutes,
  initialLocation: Routes.SPLASH,
  debugLogDiagnostics: kDebugMode,
);

@TypedGoRoute<SplashRoute>(
  path: Routes.SPLASH,
)
@immutable
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider.value(
      value: getIt<SplashBloc>(),
      child: const SplashScreen(),
    );
  }
}

@TypedGoRoute<LoginRoute>(
  path: Routes.LOGIN,
  routes: [
    TypedGoRoute<CreateAccountRoute>(path: Routes.CREATE_ACCOUNT),
    TypedGoRoute<ForgotPasswordRoute>(path: Routes.FORGOT_PASSWORD),
  ],
)
@immutable
class LoginRoute extends GoRouteData {
  const LoginRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<LoginBloc>(),
        ),
      ],
      child: const LoginScreen(),
    );
  }

  @override
  FutureOr<bool> onExit(BuildContext context, GoRouterState state) {
    getIt.resetLazySingleton<LoginBloc>();
    return super.onExit(context, state);
  }
}

@immutable
class CreateAccountRoute extends GoRouteData {
  const CreateAccountRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<CreateAccountBloc>(),
        ),
        BlocProvider.value(
          value: getIt<CreateAccountFormCubit>(),
        ),
      ],
      child: const CreateAccountScreen(),
    );
  }

  @override
  FutureOr<bool> onExit(BuildContext context, GoRouterState state) {
    getIt.resetLazySingleton<CreateAccountFormCubit>();
    return super.onExit(context, state);
  }
}

@immutable
class ForgotPasswordRoute extends GoRouteData {
  const ForgotPasswordRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider.value(
      value: getIt<ForgotPasswordBloc>(),
      child: const ForgotPasswordScreen(),
    );
  }

  @override
  FutureOr<bool> onExit(BuildContext context, GoRouterState state) {
    getIt.resetLazySingleton<ForgotPasswordBloc>();
    return super.onExit(context, state);
  }
}

@TypedStatefulShellRoute<HomeScaffoldRoute>(
  branches: [
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<HomeRoute>(
          path: Routes.HOME,
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<FavoriteRoute>(
          path: Routes.FAVORITE,
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<ProfileRoute>(
          path: Routes.PROFILE,
        ),
      ],
    ),
  ],
)
@immutable
class HomeScaffoldRoute extends StatefulShellRouteData {
  const HomeScaffoldRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return BlocProvider.value(
      value: getIt<HomeScaffoldBloc>(),
      child: UpgradeAlert(
        upgrader: Upgrader(
          messages: UpgraderMessages(code: 'ro'),
        ),
        child: HomeScaffoldScreen(
          navigationShell: navigationShell,
        ),
      ),
    );
  }
}

@TypedGoRoute<FlowerDetailsRoute>(
  path: Routes.FLOWER_DETAILS,
)
@immutable
class FlowerDetailsRoute extends GoRouteData {
  const FlowerDetailsRoute(this.id);

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return FutureBuilder(
      future: Future.wait([getIt.isReady<FlowerDetailsBloc>()]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingWidget();
        }
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: getIt<FlowerDetailsBloc>()..add(FlowerDetailsGetEvent(id)),
            ),
            BlocProvider.value(
              value: getIt<CartBloc>(),
            ),
            BlocProvider.value(
              value: getIt<FavoriteBloc>(),
            ),
          ],
          child: FlowerDetailsScreen(
            id: id,
          ),
        );
      },
    );
  }
}

class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return FutureBuilder(
      future: Future.wait([
        getIt.isReady<HomeBloc>(),
        getIt.isReady<CartBloc>(),
        getIt.isReady<FavoriteBloc>(),
      ]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingWidget();
        }
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: getIt<CartBloc>()),
            BlocProvider.value(value: getIt<HomeBloc>()),
            BlocProvider.value(value: getIt<FavoriteBloc>()),
          ],
          child: const HomeScreen(),
        );
      },
    );
  }
}

class FavoriteRoute extends GoRouteData {
  const FavoriteRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<FavoriteBloc>(),
        ),
        BlocProvider.value(
          value: getIt<HomeBloc>(),
        ),
      ],
      child: const FavoriteScreen(),
    );
  }
}

class ProfileRoute extends GoRouteData {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<ProfileBloc>()),
        BlocProvider.value(value: getIt<HomeBloc>()),
      ],
      child: const ProfileScreen(),
    );
  }
}

@TypedGoRoute<CartRoute>(path: Routes.CART)
@immutable
class CartRoute extends GoRouteData {
  const CartRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<CartBloc>(),
        ),
      ],
      child: const CartScreen(),
    );
  }
}

sealed class Routes {
  static const String SPLASH = '/';
  static const String LOGIN = '/login';
  static const String CREATE_ACCOUNT = 'create_account';
  static const String FORGOT_PASSWORD = 'forgot_password';
  static const String HOME = '/home';
  static const String FAVORITE = '/favorite';
  static const String PROFILE = '/profile';
  static const String FLOWER_DETAILS = '/details/:id';
  static const String CART = '/cart';
}
