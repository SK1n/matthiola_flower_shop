import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/core/utils/failures/failure.dart';
import 'package:matthiola_flower_shop/domain/models/create_account_request/create_account_request.dart';
import 'package:matthiola_flower_shop/domain/repositories/i_auth_repository.dart';
import 'package:matthiola_flower_shop/features/create_account/use_cases/cubit/create_account_form_cubit.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';

part 'create_account_event.dart';
part 'create_account_state.dart';

class CreateAccountBloc extends SideEffectBloc<CreateAccountEvent,
    CreateAccountState, BaseCommand> {
  CreateAccountBloc(
    this.repository,
    this.form,
  ) : super(const CreateAccountState()) {
    on<CreateAccountCreateEvent>(_onCreateAccountCreateEvent);
  }

  final IAuthRepository repository;
  final CreateAccountFormCubit form;

  Future<void> _onCreateAccountCreateEvent(
    CreateAccountCreateEvent event,
    Emitter<CreateAccountState> emit,
  ) async {
    if (!form.isValid()) return;
    emit(state.copyWith(isLoading: true));
    try {
      final formState = form.state;
      final result = await repository.signUpWithEmail(
        CreateAccountRequest(
          email: formState.email.value,
          password: formState.password.value,
          displayName: formState.username.value,
          address: formState.address.value,
          phone: formState.phone.value,
        ),
      );
      if (result.isError()) {
        return produceSideEffect(BaseCommand.failure(result.tryGetError()!));
      }
      produceSideEffect(BaseCommand.success(t.sign_up.accountCreated));
      produceSideEffect(BaseCommand.pop());
    } on Exception catch (e) {
      produceSideEffect(BaseCommand.failure(Failure(error: e.toString())));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
