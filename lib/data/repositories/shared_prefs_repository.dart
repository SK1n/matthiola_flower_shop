import 'dart:convert';

import 'package:matthiola_flower_shop/core/constants/error_codes.dart';
import 'package:matthiola_flower_shop/core/utils/failures/failure.dart';
import 'package:matthiola_flower_shop/domain/repositories/i_shared_prefs_repository.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsRepository implements ISharedPrefsRepository {
  SharedPrefsRepository(this._prefs);
  final SharedPreferences _prefs;

  @override
  Result<int, Failure> readInt(String key) {
    try {
      final value = _prefs.getInt(key);
      if (value == null) {
        return const Result.error(Failure(code: ErrorCodes.notFound));
      }
      return Result.success(value);
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  @override
  Result<double, Failure> readDouble(String key) {
    try {
      final value = _prefs.getDouble(key);
      if (value == null) {
        return const Result.error(Failure(code: ErrorCodes.notFound));
      }
      return Result.success(value);
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  @override
  Result<bool, Failure> readBool(String key) {
    try {
      final value = _prefs.getBool(key);
      if (value == null) {
        return const Result.error(Failure(code: ErrorCodes.notFound));
      }
      return Result.success(value);
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  @override
  Result<String, Failure> readString(String key) {
    try {
      final value = _prefs.getString(key);
      if (value == null) {
        return const Result.error(Failure(code: ErrorCodes.notFound));
      }
      return Result.success(value);
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  @override
  Result<List<String>, Failure> readStringList(String key) {
    try {
      final value = _prefs.getStringList(key);
      if (value == null) {
        return const Result.error(Failure(code: ErrorCodes.notFound));
      }
      return Result.success(value);
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  @override
  Result<Map<String, dynamic>, Failure> readMap(String key) {
    try {
      final jsonString = _prefs.getString(key);
      if (jsonString == null) {
        return const Result.error(Failure(code: ErrorCodes.notFound));
      }
      final value = jsonDecode(jsonString) as Map<String, dynamic>;
      return Result.success(value);
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  @override
  Result<List<Map<String, dynamic>>, Failure> readMapList(
    String key,
  ) {
    try {
      final jsonString = _prefs.getString(key);
      if (jsonString == null) {
        return const Result.error(Failure(code: ErrorCodes.notFound));
      }
      final decodedList = jsonDecode(jsonString) as List<dynamic>;
      final mapList = List<Map<String, dynamic>>.from(
        decodedList.map(
          (item) => Map<String, dynamic>.from(item as Map<String, dynamic>),
        ),
      );
      return Result.success(mapList);
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  // Write methods
  @override
  Future<Result<Unit, Failure>> writeInt(String key, int value) async {
    try {
      final success = await _prefs.setInt(key, value);
      if (success) {
        return const Result.success(unit);
      } else {
        return const Result.error(Failure(code: ErrorCodes.writeError));
      }
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  @override
  Future<Result<Unit, Failure>> writeDouble(String key, double value) async {
    try {
      final success = await _prefs.setDouble(key, value);
      if (success) {
        return const Result.success(unit);
      } else {
        return const Result.error(Failure(code: ErrorCodes.writeError));
      }
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  @override
  Future<Result<Unit, Failure>> writeBool(
    String key, {
    bool value = false,
  }) async {
    try {
      final success = await _prefs.setBool(key, value);
      if (success) {
        return const Result.success(unit);
      } else {
        return const Result.error(Failure(code: ErrorCodes.writeError));
      }
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  @override
  Future<Result<Unit, Failure>> writeString(String key, String value) async {
    try {
      final success = await _prefs.setString(key, value);
      if (success) {
        return const Result.success(unit);
      } else {
        return const Result.error(Failure(code: ErrorCodes.writeError));
      }
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  @override
  Future<Result<Unit, Failure>> writeStringList(
    String key,
    List<String> value,
  ) async {
    try {
      final success = await _prefs.setStringList(key, value);
      if (success) {
        return const Result.success(unit);
      } else {
        return const Result.error(Failure(code: ErrorCodes.writeError));
      }
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  @override
  Future<Result<Unit, Failure>> writeMap(
    String key,
    Map<String, dynamic> value,
  ) async {
    try {
      final jsonString = jsonEncode(value);
      final success = await _prefs.setString(key, jsonString);
      if (success) {
        return const Result.success(unit);
      } else {
        return const Result.error(Failure(code: ErrorCodes.writeError));
      }
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  // Remove method
  @override
  Future<Result<Unit, Failure>> remove(String key) async {
    try {
      final success = await _prefs.remove(key);
      if (success) {
        return const Result.success(unit);
      } else {
        return const Result.error(Failure(code: ErrorCodes.deleteError));
      }
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }

  @override
  Future<Result<Unit, Failure>> writeMapList(
    String key,
    List<Map<String, dynamic>> value,
  ) async {
    try {
      final jsonString = jsonEncode(value);
      final success = await _prefs.setString(key, jsonString);
      if (success) {
        return const Result.success(unit);
      } else {
        return const Result.error(Failure(code: ErrorCodes.writeError));
      }
    } catch (e) {
      return Result.error(Failure(error: e));
    }
  }
}
