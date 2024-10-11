import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_account_request.freezed.dart';
part 'create_account_request.g.dart';

@freezed
class CreateAccountRequest with _$CreateAccountRequest {
  factory CreateAccountRequest({
    required String email,
    required String password,
    required String displayName,
    required String address,
    required String phone,
  }) = _CreateAccountRequest;

  factory CreateAccountRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAccountRequestFromJson(json);
}
