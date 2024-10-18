part of 'create_account_bloc.dart';

class CreateAccountState extends Equatable {
  const CreateAccountState({
    this.isLoading = false,
    this.formIsValid = false,
  });

  final bool isLoading;
  final bool formIsValid;

  @override
  List<Object> get props => [isLoading, formIsValid];

  CreateAccountState copyWith({
    bool? isLoading,
    bool? formIsValid,
  }) {
    return CreateAccountState(
      isLoading: isLoading ?? this.isLoading,
      formIsValid: formIsValid ?? this.formIsValid,
    );
  }
}
