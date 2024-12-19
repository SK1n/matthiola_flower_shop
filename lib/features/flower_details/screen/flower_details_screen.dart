// ignore_for_file: lines_longer_than_80_chars

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:matthiola_flower_shop/core/constants/app_constants.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/core/utils/extensions/build_context_extension.dart';
import 'package:matthiola_flower_shop/core/utils/octo_blur_hash_fix.dart';
import 'package:matthiola_flower_shop/core/utils/snackbar_util.dart';
import 'package:matthiola_flower_shop/domain/models/cart/cart_entity.dart';
import 'package:matthiola_flower_shop/domain/models/flower/flower_entity.dart';
import 'package:matthiola_flower_shop/features/cart/use_cases/bloc/cart_bloc.dart';
import 'package:matthiola_flower_shop/features/favorites/use_cases/favorite_bloc.dart';
import 'package:matthiola_flower_shop/features/flower_details/use_cases/flower_details_bloc.dart';
import 'package:matthiola_flower_shop/features/home/use_cases/home_bloc.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';
import 'package:matthiola_flower_shop/widgets/loading_widget.dart';
import 'package:octo_image/octo_image.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

part 'app_bar.dart';
part 'listener.dart';
part 'text_part.dart';

class FlowerDetailsScreen extends StatelessWidget {
  const FlowerDetailsScreen({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocSideEffectListener<FlowerDetailsBloc, BaseCommand>(
      listener: _sideEffectListener,
      child: BlocBuilder<FlowerDetailsBloc, FlowerDetailsState>(
        builder: (context, state) {
          if (state.isLoading) return const LoadingWidget();
          return Scaffold(
            appBar: _AppBar(state.item),
            body: LayoutBuilder(
              builder: (context, constraints) {
                final imageSize = Size(
                  constraints.maxWidth,
                  constraints.maxHeight * 0.4,
                );
                return Column(
                  children: [
                    SizedBox(
                      height: imageSize.height,
                      width: imageSize.width,
                      child: OctoImage(
                        image: CachedNetworkImageProvider(
                          state.item.image,
                        ),
                        placeholderBuilder: OctoBlurHashFix.placeHolder(
                          AppConstants.PLACEHOLDER_BLUR_HASH,
                        ),
                        imageBuilder: (context, child) {
                          return child;
                        },
                        errorBuilder: OctoError.icon(color: Colors.red),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: _TextPart(state.item, state.quantity),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
