import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:matthiola_flower_shop/core/constants/assets_constants.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({super.key, this.message = ''});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          LottieBuilder.asset(
            AssetsConstants.NOT_FOUND_ANIM,
            width: 100,
            height: 100,
          ),
          Text(message),
        ],
      ),
    );
  }
}
