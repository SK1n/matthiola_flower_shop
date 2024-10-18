import 'package:equatable/equatable.dart';
import 'package:matthiola_flower_shop/core/constants/error_codes.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';

class Failure extends Equatable implements Exception {
  const Failure({this.code = ErrorCodes.unknownError, this.error = ''});

  final String code;
  final Object error;

  String get message => _getCode();

  @override
  List<Object> get props => [error, code];

  String _getCode() => _fromMap()[code] ?? t.errors.unknownError;

  Map<String, String> _fromMap() {
    return {
      ErrorCodes.invalidEmail: t.errors.invalidEmail,
      ErrorCodes.userDisabled: t.errors.userDisabled,
      ErrorCodes.userNotFound: t.errors.userNotFound,
      ErrorCodes.invalidCredentials: t.errors.invalidCredentials,
      ErrorCodes.wrongPassword: t.errors.wrongPassword,
      ErrorCodes.operationNotAllowed: t.errors.operationNotAllowed,
      ErrorCodes.weakPassword: t.errors.weakPassword,
      ErrorCodes.emailAlreadyInUse: t.errors.emailAlreadyInUse,
      ErrorCodes.permissionDenied: t.errors.permissionDenied,
      ErrorCodes.notFound: t.errors.notFound,
      ErrorCodes.aborted: t.errors.aborted,
      ErrorCodes.deadlineExceeded: t.errors.deadlineExceeded,
      ErrorCodes.unavailable: t.errors.unavailable,
      ErrorCodes.invalidArgument: t.errors.invalidArgument,
      ErrorCodes.alreadyExists: t.errors.alreadyExists,
      ErrorCodes.resourceExhausted: t.errors.resourceExhausted,
      ErrorCodes.unauthenticated: t.errors.unauthenticated,
      ErrorCodes.failedPrecondition: t.errors.failedPrecondition,
      ErrorCodes.dataLoss: t.errors.dataLoss,
      ErrorCodes.internal: t.errors.internal,
      ErrorCodes.outOfRange: t.errors.outOfRange,
      ErrorCodes.unknownError: t.errors.unknownError,
      ErrorCodes.permissionsDenied: t.errors.permissionsDenied,
      ErrorCodes.httpCode400: t.errors.httpCode400,
      ErrorCodes.httpCode401: t.errors.httpCode401,
      ErrorCodes.httpCode403: t.errors.httpCode403,
      ErrorCodes.httpCode404: t.errors.httpCode404,
      ErrorCodes.httpCode408: t.errors.httpCode408,
      ErrorCodes.httpCode409: t.errors.httpCode409,
      ErrorCodes.httpCode429: t.errors.httpCode429,
      ErrorCodes.httpCode500: t.errors.httpCode500,
      ErrorCodes.httpCode503: t.errors.httpCode503,
      ErrorCodes.serviceDisabled: t.errors.serviceDisabled,
      ErrorCodes.permissionsDeniedForever: t.errors.permissionsDeniedForever,
      ErrorCodes.emailOrPasswordEmpty: t.errors.emailOrPasswordEmpty,
      ErrorCodes.emptySearch: t.errors.emptySearch,
      ErrorCodes.writeError: t.errors.writeError,
      ErrorCodes.deleteError: t.errors.deleteError,
      ErrorCodes.maxQuantityReached: t.flower_details.maxQuantityReached,
      ErrorCodes.cantRefreshNow: t.home.cantRefreshNow,
    };
  }
}
