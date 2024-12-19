import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:matthiola_flower_shop/core/constants/cloud_functions_constants.dart';
import 'package:matthiola_flower_shop/core/constants/error_codes.dart';
import 'package:matthiola_flower_shop/core/constants/firestore_constants.dart';
import 'package:matthiola_flower_shop/core/utils/failures/failure.dart';
import 'package:matthiola_flower_shop/domain/models/create_account_request/create_account_request.dart';
import 'package:matthiola_flower_shop/domain/models/user/user_entity.dart';
import 'package:matthiola_flower_shop/domain/repositories/i_auth_repository.dart';
import 'package:multiple_result/multiple_result.dart';

class AuthRepository implements IAuthRepository {
  const AuthRepository(this.auth, this.firestore, this.functions);

  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final FirebaseFunctions functions;

  @override
  Future<Result<Unit, Failure>> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return const Result.success(unit);
    } on FirebaseAuthException catch (e) {
      return Result.error(Failure(code: e.code));
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  @override
  Future<Result<Unit, Failure>> loginAnonymous() async {
    try {
      await auth.signInAnonymously();
      return const Result.success(unit);
    } on FirebaseAuthException catch (e) {
      return Result.error(Failure(code: e.code));
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  @override
  Future<Result<Unit, Failure>> signUpWithEmail(
    CreateAccountRequest request,
  ) async {
    try {
      final callable =
          functions.httpsCallable(CloudFunctionsConstants.CREATE_ACCOUNT);
      final response = await callable.call<dynamic>(request.toJson());
      if (response.data is Map<String, dynamic>) {
        return const Result.success(unit);
      } else {
        return Result.error(Failure(code: response.data as String));
      }
    } on FirebaseAuthException catch (e) {
      return Result.error(Failure(code: e.code));
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  @override
  Future<Result<Unit, Failure>> sendResetPasswordEmail(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return const Result.success(unit);
    } on FirebaseAuthException catch (e) {
      return Result.error(Failure(code: e.code));
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  @override
  Future<Result<UserEntity, Failure>> getUserData() async {
    try {
      if (!isLoggedIn()) {
        return const Result.error(Failure(code: ErrorCodes.unauthenticated));
      }
      if (auth.currentUser?.isAnonymous ?? false) {
        return Result.success(
          UserEntity(
            address: '',
            displayName: '',
            email: '',
            phone: '',
            uid: auth.currentUser!.uid,
          ),
        );
      }
      final result = await firestore
          .doc(FirestoreConstants.USERS_DOCUMENT(auth.currentUser!.uid))
          .get();
      final data = result.data();
      if (data?.isEmpty ?? true) {
        return const Result.error(Failure(code: ErrorCodes.userNotFound));
      }
      return Result.success(UserEntity.fromJson(data!));
    } on FirebaseAuthException catch (e) {
      return Result.error(Failure(code: e.code));
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  @override
  bool isLoggedIn() => auth.currentUser != null;

  @override
  Future<void> signOut() => auth.signOut();

  @override
  Future<Result<Unit, Failure>> deleteAccount() async {
    try {
      if (auth.currentUser == null) {
        return const Result.error(Failure(code: ErrorCodes.unauthenticated));
      }
      await auth.currentUser!.delete();
      return const Result.success(unit);
    } on FirebaseException catch (e) {
      return Result.error(Failure(code: e.code));
    } catch (e) {
      return const Result.error(Failure());
    }
  }

  @override
  Stream<Result<UserEntity, Failure>> userSubscription() async* {
    await for (final state in auth.authStateChanges()) {
      if (state == null) {
        yield const Result.success(UserEntity.empty);
        continue;
      }
      final result = await getUserData();
      if (result.isError()) {
        yield Result.error(result.tryGetError()!);
        continue;
      }
      yield Result.success(result.tryGetSuccess()!);
    }
  }

  @override
  bool get isAnonymous => auth.currentUser?.isAnonymous ?? false;
}
