import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:matthiola_flower_shop/core/constants/app_constants.dart';
import 'package:matthiola_flower_shop/core/constants/assets_constants.dart';
import 'package:matthiola_flower_shop/core/utils/extensions/build_context_extension.dart';
import 'package:matthiola_flower_shop/core/utils/octo_blur_hash_fix.dart';
import 'package:matthiola_flower_shop/domain/models/cart/cart_entity.dart';
import 'package:matthiola_flower_shop/domain/models/flower/flower_entity.dart';
import 'package:matthiola_flower_shop/features/cart/use_cases/bloc/cart_bloc.dart';
import 'package:matthiola_flower_shop/features/favorites/use_cases/favorite_bloc.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';
import 'package:octo_image/octo_image.dart';

class FlowerCard extends StatelessWidget {
  const FlowerCard({
    required this.flower,
    this.showBanner = false,
    super.key,
  });

  final FlowerEntity flower;
  final bool showBanner;

  @override
  Widget build(BuildContext context) {
    final isFavorite =
        context.watch<FavoriteBloc>().state.items.contains(flower);
    return LayoutBuilder(
      builder: (context, constraints) {
        final imageSize =
            Size(constraints.maxWidth, constraints.maxHeight * 0.65);

        return Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              clipBehavior: Theme.of(context).cardTheme.clipBehavior!,
              child: SizedBox(
                height: imageSize.height,
                width: imageSize.width,
                child: Stack(
                  children: [
                    Card(
                      margin: EdgeInsets.zero,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: OctoImage(
                          image: CachedNetworkImageProvider(
                            flower.image,
                          ),
                          placeholderBuilder: OctoBlurHashFix.placeHolder(
                            AppConstants.PLACEHOLDER_BLUR_HASH,
                          ),
                          width: imageSize.width,
                          height: imageSize.height,
                          errorBuilder: OctoError.icon(color: Colors.red),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    if (!showBanner)
                      _BannerWidget(flower.quantity, imageSize.width),
                    Positioned(
                      top: showBanner ? 10 : 30,
                      right: 5,
                      child: GestureDetector(
                        onTap: () {
                          isFavorite
                              ? context
                                  .read<FavoriteBloc>()
                                  .add(DeleteFavoriteEvent(flower))
                              : context
                                  .read<FavoriteBloc>()
                                  .add(SaveFavoriteEvent(flower));
                        },
                        child: Stack(
                          children: [
                            const Icon(
                              Icons.favorite,
                              color: Colors.grey,
                            ),
                            Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: context.colorScheme.primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(5),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            flower.name.capitalize,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            minFontSize: 15,
                          ),
                        ),
                        Expanded(
                          child: AutoSizeText(
                            context.t.generic
                                .price(
                                  value: flower.price.toString(),
                                )
                                .trim(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: context.colorScheme.primary,
                                ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.read<CartBloc>().add(
                            AddToCart(
                              CartEntity(
                                item: flower,
                                quantity: flower.batchSize,
                              ),
                            ),
                          );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        AssetsConstants.ADD_TO_CART,
                        colorFilter: ColorFilter.mode(
                          context.colorScheme.primary,
                          BlendMode.srcIn,
                        ),
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _BannerWidget extends StatelessWidget {
  const _BannerWidget(this.quantity, this.width);

  final double width;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    const delimiter = 100;
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: quantity >= delimiter
              ? context.colorScheme.onTertiaryContainer
              : context.colorScheme.error,
        ),
        width: width,
        height: 25,
        padding: const EdgeInsets.all(4),
        child: AutoSizeText(
          quantity >= delimiter
              ? context.t.home.inStock(value: quantity)
              : context.t.home.lastProducts(n: quantity),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontWeight: FontWeight.w400,
                color: context.colorScheme.onError,
              ),
          maxLines: 1,
        ),
      ),
    );
  }
}
