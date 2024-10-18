import 'package:formz/formz.dart';

extension InputExtension on FormzInput<dynamic, String> {
  String? get getError => isPure ? null : error;
}

extension InputExtensionTuple on FormzInput<dynamic, (String?, String?)> {
  String? get getErrorTuple1 => isPure ? null : error?.$1;
  String? get getErrorTuple2 => isPure ? null : error?.$2;
}
