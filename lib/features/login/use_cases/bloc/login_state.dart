// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.isLoading = false,
    this.formIsValid = false,
  });

  final bool isLoading;
  final bool formIsValid;

  @override
  List<Object> get props => [isLoading, formIsValid];

  LoginState copyWith({
    bool? isLoading,
    bool? formIsValid,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      formIsValid: formIsValid ?? this.formIsValid,
    );
  }
}
