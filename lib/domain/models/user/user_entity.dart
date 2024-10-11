import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String address,
    required String displayName,
    required String email,
    required String phone,
    required String uid,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  static const UserEntity empty =
      UserEntity(address: '', displayName: '', email: '', phone: '', uid: '');
}
