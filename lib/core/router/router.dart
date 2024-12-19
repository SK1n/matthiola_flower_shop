import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:matthiola_flower_shop/core/di/di.dart';
import 'package:matthiola_flower_shop/features/cart/screen/cart_screen.dart';
import 'package:matthiola_flower_shop/features/cart/use_cases/bloc/cart_bloc.dart';
import 'package:matthiola_flower_shop/features/cart/use_cases/cubit/cart_form_cubit.dart';
import 'package:matthiola_flower_shop/features/create_account/screen/create_account_screen.dart';
import 'package:matthiola_flower_shop/features/create_account/use_cases/bloc/create_account_bloc.dart';
import 'package:matthiola_flower_shop/features/create_account/use_cases/cubit/create_account_form_cubit.dart';
import 'package:matthiola_flower_shop/features/favorites/use_cases/favorite_bloc.dart';
import 'package:matthiola_flower_shop/features/flower_details/screen/flower_details_screen.dart';
import 'package:matthiola_flower_shop/features/flower_details/use_cases/flower_details_bloc.dart';
import 'package:matthiola_flower_shop/features/forgot_password/screen/forgot_password_screen.dart';
import 'package:matthiola_flower_shop/features/forgot_password/use_cases/bloc/forgot_password_bloc.dart';
import 'package:matthiola_flower_shop/features/home/use_cases/home_bloc.dart';
import 'package:matthiola_flower_shop/features/home_scaffold/screen/home_scaffold_screen.dart';
import 'package:matthiola_flower_shop/features/home_scaffold/use_cases/home_scaffold_bloc.dart';
import 'package:matthiola_flower_shop/features/login/screen/login_screen.dart';
import 'package:matthiola_flower_shop/features/login/use_cases/bloc/login_bloc.dart';
import 'package:matthiola_flower_shop/features/login/use_cases/cubit/login_form_cubit.dart';
import 'package:matthiola_flower_shop/features/profile/use_cases/profile_bloc.dart';
import 'package:matthiola_flower_shop/features/splash/screen/splash_screen.dart';
import 'package:matthiola_flower_shop/features/splash/use_cases/bloc/splash_bloc.dart';

part 'router.g.dart';

final router = GoRouter(
  routes: $appRoutes,
  initialLocation: _Routes.SPLASH,
  debugLogDiagnostics: kDebugMode,
);

@TypedGoRoute<SplashRoute>(path: _Routes.SPLASH)
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
  path: _Routes.LOGIN,
  routes: [
    TypedGoRoute<CreateAccountRoute>(path: _Routes.CREATE_ACCOUNT),
    TypedGoRoute<ForgotPasswordRoute>(path: _Routes.FORGOT_PASSWORD),
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
        BlocProvider.value(
          value: getIt<LoginFormCubit>()..clear(),
        ),
      ],
      child: const LoginScreen(),
    );
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
}

@TypedGoRoute<HomeScaffoldRoute>(
  path: _Routes.HOME,
  routes: [
    TypedGoRoute<FlowerDetailsRoute>(
      path: _Routes.FLOWER_DETAILS,
    ),
    TypedGoRoute<CartRoute>(path: _Routes.CART),
  ],
)
@immutable
class HomeScaffoldRoute extends GoRouteData {
  const HomeScaffoldRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<HomeScaffoldBloc>(),
        ),
        BlocProvider.value(
          value: getIt<HomeBloc>(),
        ),
        BlocProvider.value(
          value: getIt<CartBloc>(),
        ),
        BlocProvider.value(
          value: getIt<FavoriteBloc>(),
        ),
        BlocProvider.value(
          value: getIt<ProfileBloc>(),
        ),
      ],
      child: const HomeScaffoldScreen(),
    );
  }

  @override
  FutureOr<bool> onExit(BuildContext context, GoRouterState state) {
    getIt.resetLazySingleton<CartBloc>();
    return super.onExit(context, state);
  }
}

class FlowerDetailsRoute extends GoRouteData {
  const FlowerDetailsRoute(this.id);

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
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
  }
}

///
class CartRoute extends GoRouteData {
  const CartRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<CartBloc>(),
        ),
        BlocProvider.value(
          value: getIt<CartFormCubit>(),
        ),
      ],
      child: const CartScreen(),
    );
  }

  @override
  FutureOr<bool> onExit(BuildContext context, GoRouterState state) {
    getIt.resetLazySingleton<CartFormCubit>();
    return super.onExit(context, state);
  }
}

final class _Routes {
  static const String SPLASH = '/';
  static const String LOGIN = '/login';
  static const String CREATE_ACCOUNT = 'create_account';
  static const String FORGOT_PASSWORD = 'forgot_password';
  static const String HOME = '/home';
  static const String FLOWER_DETAILS = 'details/:id';
  static const String CART = 'cart';
}
