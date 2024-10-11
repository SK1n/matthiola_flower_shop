part of 'create_account_bloc.dart';

class CreateAccountState extends Equatable {
  const CreateAccountState({
    this.isLoading = false,
  });

  final bool isLoading;

  @override
  List<Object> get props => [isLoading];

  CreateAccountState copyWith({
    bool? isLoading,
  }) {
    return CreateAccountState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
