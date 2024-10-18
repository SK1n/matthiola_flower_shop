import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matthiola_flower_shop/core/constants/assets_constants.dart';
import 'package:matthiola_flower_shop/core/router/router.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/core/utils/snackbar_util.dart';
import 'package:matthiola_flower_shop/features/splash/use_cases/bloc/splash_bloc.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

part 'listener.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSideEffectListener<SplashBloc, BaseCommand>(
      listener: _sideEffectListener,
      child: CupertinoPageScaffold(
        child: SafeArea(
          child: Center(
            child: SvgPicture.asset(
              AssetsConstants.APP_LOGO,
              width: MediaQuery.sizeOf(context).width / 2,
              height: MediaQuery.sizeOf(context).width / 2,
            ),
          ),
        ),
      ),
    );
  }
}
