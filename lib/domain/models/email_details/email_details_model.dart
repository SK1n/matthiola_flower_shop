import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_details_model.freezed.dart';
part 'email_details_model.g.dart';

@freezed
class EmailDetailsModel with _$EmailDetailsModel {
  factory EmailDetailsModel({
    required String email,
    required String password,
  }) = _EmailDetailsModel;

  factory EmailDetailsModel.fromJson(Map<String, Object?> json) =>
      _$EmailDetailsModelFromJson(json);
}
