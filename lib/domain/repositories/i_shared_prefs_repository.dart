import 'package:matthiola_flower_shop/core/utils/failures/failure.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class ISharedPrefsRepository {
  // Read methods
  Result<int, Failure> readInt(String key);
  Result<double, Failure> readDouble(String key);
  Result<bool, Failure> readBool(String key);
  Result<String, Failure> readString(String key);
  Result<List<String>, Failure> readStringList(String key);
  Result<Map<String, dynamic>, Failure> readMap(String key);
  Result<List<Map<String, dynamic>>, Failure> readMapList(String key);

  // Write methods
  Future<Result<Unit, Failure>> writeInt(String key, int value);
  Future<Result<Unit, Failure>> writeDouble(String key, double value);
  Future<Result<Unit, Failure>> writeBool(String key, {bool value});
  Future<Result<Unit, Failure>> writeString(String key, String value);
  Future<Result<Unit, Failure>> writeStringList(String key, List<String> value);
  Future<Result<Unit, Failure>> writeMap(
    String key,
    Map<String, dynamic> value,
  );
  Future<Result<void, Failure>> writeMapList(
    String key,
    List<Map<String, dynamic>> value,
  ); // New

  // Remove method
  Future<Result<Unit, Failure>> remove(String key);
}
