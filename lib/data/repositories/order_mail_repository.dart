// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/foundation.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:matthiola_flower_shop/core/constants/app_constants.dart';
import 'package:matthiola_flower_shop/core/constants/handlebars/order_handlebar.dart';
import 'package:matthiola_flower_shop/core/utils/failures/failure.dart';
import 'package:matthiola_flower_shop/domain/models/email_details/email_details_model.dart';
import 'package:matthiola_flower_shop/domain/models/mail_request/mail_request_entity.dart';
import 'package:matthiola_flower_shop/domain/models/order_request/order_request.dart';
import 'package:matthiola_flower_shop/domain/repositories/i_mail_repository.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mustache_template/mustache.dart';

class OrderMailRepository implements IMailRepository<OrderRequest> {
  @override
  Future<Result<Unit, Failure>> sendMail({
    required OrderRequest request,
    required EmailDetailsModel email,
  }) async {
    try {
      final data = _getMailRequest(request);
      final template =
          Template(ORDER_HANDLEBAR, htmlEscapeValues: false, lenient: true);

      final body = template.renderString(data.template.data.toJson());
      final smtpServer = gmail(
        email.email,
        email.password,
      );
      final message = Message()
        ..from = Address(
          email.email,
          AppConstants.APP_TITLE,
        )
        ..recipients.add(data.to)
        ..bccRecipients = kDebugMode ? [] : [email.email]
        ..subject = AppConstants.ORDER_EMAIL_SUBJECT
        ..html = body;
      await send(message, smtpServer);

      return const Result.success(unit);
    } on MailerException catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  MailRequestEntity _getMailRequest(OrderRequest order) {
    final products = order.products.map((product) {
      return MailRequestProductEntity(
        productName: product.productName,
        productPrice: product.productPrice,
        productType: product.productType,
        quantity: product.quantity,
      );
    }).toList();
    return MailRequestEntity(
      to: order.email,
      template: MailRequestTemplateEntity(
        name: AppConstants.ORDER_EMAIL_TEMPLATE,
        data: MailRequestDataEntity(
          displayName: order.displayName,
          address: order.address,
          email: order.email,
          phone: order.phone,
          products: products,
          totalPrice: order.totalPrice,
          subject: AppConstants.ORDER_EMAIL_SUBJECT,
        ),
      ),
    );
  }
}
