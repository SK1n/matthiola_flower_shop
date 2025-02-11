import 'package:go_router/go_router.dart';
import 'package:matthiola_flower_shop/core/utils/failures/failure.dart';

sealed class BaseCommand {
  BaseCommand();

  factory BaseCommand.failure(Failure failure, {Exception? e}) = FailureCommand;
  factory BaseCommand.success(String message) = SuccessCommand;
  factory BaseCommand.go(RouteData route) = GoCommand;
  factory BaseCommand.pop({dynamic data}) = PopCommand;
  factory BaseCommand.goBranch(
    int branch,
    StatefulNavigationShell navigationShell,
  ) = GoBranch;
  factory BaseCommand.showDialog([dynamic data]) = ShowDialogCommand;

  void when({
    required void Function(Failure) failure,
    required void Function(String) success,
    void Function({dynamic data})? pop,
    void Function(RouteData)? go,
    void Function(int, StatefulNavigationShell)? goBranch,
    void Function([dynamic data])? showDialog,
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
    } else if (this is GoBranch) {
      return goBranch!(
        (this as GoBranch).branch,
        (this as GoBranch).navigationShell,
      );
    } else if (this is ShowDialogCommand) {
      showDialog?.call((this as ShowDialogCommand).data);
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
  final RouteData route;
}

class GoBranch extends BaseCommand {
  GoBranch(this.branch, this.navigationShell);
  final int branch;
  final StatefulNavigationShell navigationShell;
}

class ShowDialogCommand extends BaseCommand {
  ShowDialogCommand([this.data]);
  final dynamic data;
}
