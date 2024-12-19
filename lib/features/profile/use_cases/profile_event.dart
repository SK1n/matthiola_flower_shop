part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends ProfileEvent {
  const LoginEvent();
}

class OpenDeleteDialogEvent extends ProfileEvent {
  const OpenDeleteDialogEvent();
}
