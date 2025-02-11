import 'package:matthiola_flower_shop/core/utils/failures/failure.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class IRepository<T> {
  Future<Result<T, Failure>> get(String collection) {
    throw UnimplementedError();
  }

  Future<Result<List<T>, Failure>> getList(String collection) {
    throw UnimplementedError();
  }

  Future<Result<Unit, Failure>> patch(T data, String path) {
    throw UnimplementedError();
  }

  Future<Result<String, Failure>> put(T data, String path) {
    throw UnimplementedError();
  }

  Future<Result<bool, Failure>> exists(String path) {
    throw UnimplementedError();
  }

  Future<Result<List<T>, Failure>> search(String query) {
    throw UnimplementedError();
  }
}
