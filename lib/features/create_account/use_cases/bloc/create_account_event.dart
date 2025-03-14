part of 'create_account_bloc.dart';

sealed class CreateAccountEvent extends Equatable {
  const CreateAccountEvent();

  @override
  List<Object> get props => [];
}

class CreateAccountCreateEvent extends CreateAccountEvent {
  const CreateAccountCreateEvent();
}

class _SubscribeToFormCubit extends CreateAccountEvent {
  const _SubscribeToFormCubit();
}
