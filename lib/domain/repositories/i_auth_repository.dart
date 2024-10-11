import 'package:matthiola_flower_shop/core/utils/failures/failure.dart';
import 'package:matthiola_flower_shop/domain/models/create_account_request/create_account_request.dart';
import 'package:matthiola_flower_shop/domain/models/user/user_entity.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class IAuthRepository {
  Future<Result<Unit, Failure>> login(String email, String password);
  Future<Result<Unit, Failure>> signUpWithEmail(
    CreateAccountRequest request,
  );
  Future<Result<Unit, Failure>> sendResetPasswordEmail(String email);
  Future<Result<UserEntity, Failure>> getUserData();
  Future<void> signOut();
  Future<Result<Unit, Failure>> deleteAccount();
  Stream<Result<UserEntity, Failure>> userSubscription();
  bool isLoggedIn();
}
