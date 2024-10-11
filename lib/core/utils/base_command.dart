import 'package:go_router/go_router.dart';
import 'package:matthiola_flower_shop/core/utils/failures/failure.dart';

sealed class BaseCommand {
  BaseCommand();

  factory BaseCommand.failure(Failure failure, {Exception? e}) = FailureCommand;
  factory BaseCommand.success(String message) = SuccessCommand;
  factory BaseCommand.go(GoRouteData route) = GoCommand;
  factory BaseCommand.pop({dynamic data}) = PopCommand;
  factory BaseCommand.goBranch(int branch) = GoBranchCommand;

  void when({
    required void Function(Failure) failure,
    required void Function(String) success,
    void Function({dynamic data})? pop,
    void Function(GoRouteData)? go,
    void Function(int)? goBranch,
  }) {
    if (this is FailureCommand) {
      failure((this as FailureCommand).failure);
      return;
    } else if (this is SuccessCommand) {
      success((this as SuccessCommand).message);
      return;
    } else if (this is PopCommand) {
      pop?.call(data: (this as PopCommand).data);
      return;
    } else if (this is GoCommand) {
      go?.call((this as GoCommand).route);
      return;
    } else if (this is GoBranchCommand) {
      goBranch?.call((this as GoBranchCommand).branch);
      return;
    }
  }
}

class FailureCommand extends BaseCommand {
  FailureCommand(this.failure, {Exception? e}) : e = e ?? Exception();
  final Failure failure;
  final Exception e;
}

class SuccessCommand extends BaseCommand {
  SuccessCommand(this.message);
  final String message;
}

class PopCommand extends BaseCommand {
  PopCommand({this.data});

  final dynamic data;
}

class GoCommand extends BaseCommand {
  GoCommand(this.route);
  final GoRouteData route;
}

class GoBranchCommand extends BaseCommand {
  GoBranchCommand(this.branch);
  final int branch;
}
