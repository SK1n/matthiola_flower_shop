// ignore_for_file: one_member_abstracts

import 'package:matthiola_flower_shop/core/utils/failures/failure.dart';
import 'package:matthiola_flower_shop/domain/models/email_details/email_details_model.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class IMailRepository<T> {
  Future<Result<Unit, Failure>> sendMail({
    required T request,
    required EmailDetailsModel email,
  });
}
