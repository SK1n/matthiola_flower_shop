import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:matthiola_flower_shop/core/validators/email_validator.dart';
import 'package:matthiola_flower_shop/core/validators/phone_validator.dart';
import 'package:matthiola_flower_shop/core/validators/required_validator.dart';
import 'package:matthiola_flower_shop/domain/repositories/i_auth_repository.dart';

part 'cart_form_state.dart';

class CartFormCubit extends Cubit<CartFormState> {
  CartFormCubit(
    this.auth,
  ) : super(CartFormState()) {
    _initialEvent();
  }

  final IAuthRepository auth;

  Future<void> _initialEvent() async {
    try {
      if (auth.isAnonymous) {
        emit(
          state.copyWith(
            address: const RequiredValidator.pure(),
            phone: const PhoneValidator.pure(),
            email: const EmailValidator.pure(),
            username: const RequiredValidator.pure(),
          ),
        );
      }
      emit(state.copyWith(isLoading: true));
      final result = await auth.getUserData();
      if (result.isError()) return;
      final data = result.tryGetSuccess()!;
      final address = RequiredValidator.dirty(data.address);
      final phone = PhoneValidator.dirty(data.phone);
      final email = EmailValidator.dirty(data.email);
      final username = RequiredValidator.dirty(data.displayName);
      emit(
        state.copyWith(
          address: address,
          addressController: TextEditingController(text: data.address),
          phone: phone,
          phoneController: TextEditingController(text: data.phone),
          email: email,
          emailController: TextEditingController(text: data.email),
          username: username,
          usernameController: TextEditingController(text: data.displayName),
        ),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void emailChanged(String value) {
    final email = EmailValidator.dirty(value);
    emit(state.copyWith(email: email));
  }

  void addressChanged(String value) {
    final address = RequiredValidator.dirty(value);
    emit(state.copyWith(address: address));
  }

  void phoneChanged(String value) {
    final phone = PhoneValidator.dirty(value);
    emit(state.copyWith(phone: phone));
  }

  void usernameChanged(String value) {
    final username = RequiredValidator.dirty(value);
    emit(state.copyWith(username: username));
  }
}
