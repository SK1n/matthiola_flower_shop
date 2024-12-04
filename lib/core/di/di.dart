import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:matthiola_flower_shop/data/repositories/auth_repository.dart';
import 'package:matthiola_flower_shop/data/repositories/flower_repository.dart';
import 'package:matthiola_flower_shop/data/repositories/order_repository.dart';
import 'package:matthiola_flower_shop/data/repositories/shared_prefs_repository.dart';
import 'package:matthiola_flower_shop/domain/models/flower/flower_entity.dart';
import 'package:matthiola_flower_shop/domain/models/order_request/order_request.dart';
import 'package:matthiola_flower_shop/domain/repositories/i_auth_repository.dart';
import 'package:matthiola_flower_shop/domain/repositories/i_repository.dart';
import 'package:matthiola_flower_shop/domain/repositories/i_shared_prefs_repository.dart';
import 'package:matthiola_flower_shop/features/cart/use_cases/bloc/cart_bloc.dart';
import 'package:matthiola_flower_shop/features/cart/use_cases/cubit/cart_form_cubit.dart';
import 'package:matthiola_flower_shop/features/create_account/use_cases/bloc/create_account_bloc.dart';
import 'package:matthiola_flower_shop/features/create_account/use_cases/cubit/create_account_form_cubit.dart';
import 'package:matthiola_flower_shop/features/favorites/use_cases/favorite_bloc.dart';
import 'package:matthiola_flower_shop/features/flower_details/use_cases/flower_details_bloc.dart';
import 'package:matthiola_flower_shop/features/forgot_password/use_cases/bloc/forgot_password_bloc.dart';
import 'package:matthiola_flower_shop/features/home/use_cases/home_bloc.dart';
import 'package:matthiola_flower_shop/features/home_scaffold/use_cases/home_scaffold_bloc.dart';
import 'package:matthiola_flower_shop/features/login/use_cases/bloc/login_bloc.dart';
import 'package:matthiola_flower_shop/features/login/use_cases/cubit/login_form_cubit.dart';
import 'package:matthiola_flower_shop/features/profile/use_cases/profile_bloc.dart';
import 'package:matthiola_flower_shop/features/splash/use_cases/bloc/splash_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void _configurePackages() {
  getIt
    ..registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance)
    ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance)
    ..registerLazySingleton<FirebaseFunctions>(
      () => FirebaseFunctions.instance,
    )
    ..registerLazySingletonAsync<SharedPreferences>(
      SharedPreferences.getInstance,
    )
    ..isReady<SharedPreferences>();
}

void _configureServices() {}

void _configureRepositories() {
  getIt
    ..registerLazySingleton<IAuthRepository>(
      () => AuthRepository(
        getIt<FirebaseAuth>(),
        getIt<FirebaseFirestore>(),
        getIt<FirebaseFunctions>(),
      ),
    )
    ..registerLazySingleton<IRepository<FlowerEntity>>(
      () => FlowerRepository(
        getIt<FirebaseFirestore>(),
      ),
    )
    ..registerLazySingleton<ISharedPrefsRepository>(
      () => SharedPrefsRepository(
        getIt<SharedPreferences>(),
      ),
    )
    ..registerLazySingleton<IRepository<OrderRequest>>(
      () => OrderRepository(
        getIt<FirebaseFirestore>(),
      ),
    );
}

void _confitureCubits() {
  getIt
    ..registerLazySingleton<LoginFormCubit>(LoginFormCubit.new)
    ..registerLazySingleton<CreateAccountFormCubit>(CreateAccountFormCubit.new)
    ..registerLazySingleton<CartFormCubit>(
      () => CartFormCubit(
        getIt<IAuthRepository>(),
      ),
    );
}

void _configureBlocs() {
  getIt
    ..registerLazySingleton(
      () => SplashBloc(
        getIt<IAuthRepository>(),
      ),
    )
    ..registerLazySingleton(
      () => LoginBloc(
        getIt<IAuthRepository>(),
        getIt<LoginFormCubit>(),
      ),
    )
    ..registerLazySingleton<CreateAccountBloc>(
      () => CreateAccountBloc(
        getIt<IAuthRepository>(),
        getIt<CreateAccountFormCubit>(),
      ),
    )
    ..registerLazySingleton<ForgotPasswordBloc>(
      () => ForgotPasswordBloc(
        getIt<IAuthRepository>(),
      ),
    )
    ..registerLazySingleton<HomeScaffoldBloc>(HomeScaffoldBloc.new)
    ..registerLazySingleton<HomeBloc>(
      () => HomeBloc(
        getIt<IRepository<FlowerEntity>>(),
        getIt<IAuthRepository>(),
      ),
    )
    ..registerLazySingleton<FlowerDetailsBloc>(
      () => FlowerDetailsBloc(
        getIt<IRepository<FlowerEntity>>(),
        getIt<HomeBloc>(),
      ),
    )
    ..registerLazySingleton<CartBloc>(
      () => CartBloc(
        getIt<ISharedPrefsRepository>(),
        getIt<CartFormCubit>(),
        getIt<IRepository<OrderRequest>>(),
        getIt<HomeBloc>(),
        getIt<HomeScaffoldBloc>(),
      ),
    )
    ..registerLazySingleton<FavoriteBloc>(
      () => FavoriteBloc(
        getIt<ISharedPrefsRepository>(),
        getIt<HomeBloc>(),
      ),
    )
    ..registerLazySingleton<ProfileBloc>(ProfileBloc.new);
}

void configureDi() {
  _configurePackages();
  _configureServices();
  _configureRepositories();
  _confitureCubits();
  _configureBlocs();
}
