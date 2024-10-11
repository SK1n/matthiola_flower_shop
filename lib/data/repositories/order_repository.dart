import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:matthiola_flower_shop/core/constants/error_codes.dart';
import 'package:matthiola_flower_shop/core/constants/firestore_constants.dart';
import 'package:matthiola_flower_shop/core/utils/failures/failure.dart';
import 'package:matthiola_flower_shop/core/utils/failures/order_failure.dart';
import 'package:matthiola_flower_shop/data/repositories/order_mail_repository.dart';
import 'package:matthiola_flower_shop/domain/models/email_details/email_details_model.dart';
import 'package:matthiola_flower_shop/domain/models/flower/flower_entity.dart';
import 'package:matthiola_flower_shop/domain/models/order_request/order_request.dart';
import 'package:matthiola_flower_shop/domain/models/order_response/order_response.dart';
import 'package:matthiola_flower_shop/domain/repositories/i_repository.dart';
import 'package:multiple_result/multiple_result.dart';

class OrderRepository extends IRepository<OrderRequest> {
  OrderRepository(this.provider);
  final FirebaseFirestore provider;

  @override
  Future<Result<String, Failure>> put(
    OrderRequest data,
    String path,
  ) async {
    try {
      await provider.runTransaction((transaction) async {
        final orderResponse = <OrderResponse>[];
        var goodRequest = true;
        final orderDoc =
            provider.collection(FirestoreConstants.ORDERS_COLLECTION).doc();

        final productsToUpdate = <FlowerEntity>[];
        for (final product in data.products) {
          final doc = provider
              .collection(FirestoreConstants.FLOWERS_COLLECTION)
              .doc(product.productUid);
          final snapshot = await transaction.get(doc);

          if (!snapshot.exists) {
            throw const Failure(code: ErrorCodes.httpCode404);
          }
          final currentProduct = FlowerEntity.fromJson(snapshot.data()!);

          if (currentProduct.quantity < int.parse(product.quantity) ||
              currentProduct.price != double.parse(product.productPrice)) {
            goodRequest = false;
            orderResponse.add(
              OrderResponse(
                id: currentProduct.id,
                quantity: currentProduct.quantity,
                price:
                    currentProduct.price != double.parse(product.productPrice)
                        ? currentProduct.price
                        : null,
              ),
            );
            continue;
          }
          productsToUpdate.add(currentProduct);
        }

        if (!goodRequest) {
          throw OrderFailure(orderResponse);
        }

        final mailData = await _getEmailDetails(transaction);

        for (final product in data.products) {
          final productRef = provider
              .collection(FirestoreConstants.FLOWERS_COLLECTION)
              .doc(product.productUid);

          final currentProduct = productsToUpdate.firstWhere(
            (p) => p.id == product.productUid,
          );
          final newProduct = currentProduct.copyWith(
            quantity: currentProduct.quantity - int.parse(product.quantity),
          );

          if (!kDebugMode) {
            transaction.update(
              productRef,
              newProduct.toJson(),
            );
          }
        }

        if (!kDebugMode) {
          transaction.set(orderDoc, data.toJson());
        }
        final mailResult = await OrderMailRepository()
            .sendMail(request: data, email: mailData);
        if (mailResult.isError()) {
          throw mailResult.tryGetError()!;
        }
      });

      return const Result.success('');
    } on Failure catch (e) {
      return Result.error(e);
    } on FirebaseException catch (e) {
      return Result.error(Failure(code: e.code));
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  Future<EmailDetailsModel> _getEmailDetails(Transaction transaction) async {
    try {
      final doc = provider
          .collection(FirestoreConstants.CONFIGS_COLLECTION)
          .doc(FirestoreConstants.EMAIL_DOCUMENT);
      final result = await transaction.get(doc);
      final data = result.data();
      if (data == null) throw const Failure();
      return EmailDetailsModel.fromJson(data);
    } on FirebaseException catch (e) {
      throw Failure(code: e.code);
    } catch (e) {
      throw const Failure();
    }
  }
}
