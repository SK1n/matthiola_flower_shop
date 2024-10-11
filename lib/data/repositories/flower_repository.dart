import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matthiola_flower_shop/core/constants/error_codes.dart';
import 'package:matthiola_flower_shop/core/utils/failures/failure.dart';
import 'package:matthiola_flower_shop/domain/models/flower/flower_entity.dart';
import 'package:matthiola_flower_shop/domain/repositories/i_repository.dart';
import 'package:multiple_result/multiple_result.dart';

class FlowerRepository implements IRepository<FlowerEntity> {
  const FlowerRepository(this.provider);
  final FirebaseFirestore provider;
  @override
  Future<Result<FlowerEntity, Failure>> get(String path) async {
    try {
      if ((path.split('/').length % 2) != 0) {
        return const Result.error(Failure(code: ErrorCodes.invalidArgument));
      }
      final result = await provider.doc(path).get();
      final data = result.data();
      final entity = FlowerEntity.fromJson(data!);
      return Result.success(entity);
    } on FirebaseException catch (e) {
      return Result.error(Failure(code: e.code));
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  @override
  Future<Result<List<FlowerEntity>, Failure>> getList(String path) async {
    try {
      final result = await provider
          .collection(path)
          .where('quantity', isGreaterThan: 0)
          .get();
      final list = <FlowerEntity>[];
      for (final doc in result.docs) {
        final data = doc.data();
        final entity = FlowerEntity.fromJson(data);
        list.add(entity);
      }
      return Result.success(list);
    } on FirebaseException catch (e) {
      return Result.error(Failure(code: e.code));
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  @override
  Future<Result<String, Failure>> put(FlowerEntity data, String path) async {
    try {
      final result = await provider.collection(path).add(data.toJson());
      return Result.success(result.id);
    } on FirebaseException catch (e) {
      return Result.error(Failure(code: e.code));
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  @override
  Future<Result<Unit, Failure>> patch(FlowerEntity data, String path) async {
    try {
      await provider.doc(path).update(data.toJson());
      return const Result.success(unit);
    } on FirebaseException catch (e) {
      return Result.error(Failure(code: e.code));
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  @override
  Future<Result<bool, Failure>> exists(String path) async {
    try {
      final result = await provider.doc(path).get();
      return Result.success(result.exists);
    } on FirebaseException catch (e) {
      return Result.error(Failure(code: e.code));
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }
}
