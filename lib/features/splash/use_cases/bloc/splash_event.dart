part of 'splash_bloc.dart';

sealed class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class _InitialEvent extends SplashEvent {
  const _InitialEvent();
}
