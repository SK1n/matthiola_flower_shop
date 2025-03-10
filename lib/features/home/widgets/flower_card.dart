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
import 'package:matthiola_flower_shop/features/home/use_cases/home_bloc.dart';
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
    final isAnonymous =
        context.select((HomeBloc bloc) => bloc.state.isAnonymous);

    return LayoutBuilder(
      builder: (context, constraints) {
        final imageSize = Size(
          constraints.maxWidth,
          constraints.maxHeight * 0.65,
        );
        if (flower.quantity == 0) {
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _FlowerImage(
                    flower: flower,
                    imageSize: imageSize,
                    showBanner: showBanner,
                    isAnonymous: isAnonymous,
                    isFavorite: isFavorite,
                  ),
                  const Gap(5),
                  _FlowerDetails(
                    flower: flower,
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: context.colorScheme.primaryContainer.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Center(
                child: Text(
                  context.t.home.outOfStock,
                  style: context.textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _FlowerImage(
              flower: flower,
              imageSize: imageSize,
              showBanner: showBanner,
              isAnonymous: isAnonymous,
              isFavorite: isFavorite,
            ),
            const Gap(5),
            _FlowerDetails(
              flower: flower,
            ),
          ],
        );
      },
    );
  }
}

class _FlowerImage extends StatelessWidget {
  const _FlowerImage({
    required this.flower,
    required this.imageSize,
    required this.showBanner,
    required this.isAnonymous,
    required this.isFavorite,
  });

  final FlowerEntity flower;
  final Size imageSize;
  final bool showBanner;
  final bool isAnonymous;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Theme.of(context).cardTheme.clipBehavior!,
      child: SizedBox(
        height: imageSize.height,
        width: imageSize.width,
        child: Stack(
          children: [
            Card(
              margin: EdgeInsets.zero,
              child: OctoImage(
                image: CachedNetworkImageProvider(flower.image),
                placeholderBuilder: OctoBlurHashFix.placeHolder(
                  AppConstants.PLACEHOLDER_BLUR_HASH,
                ),
                width: imageSize.width,
                height: imageSize.height,
                errorBuilder: OctoError.icon(color: Colors.red),
                fit: BoxFit.cover,
              ),
            ),
            if (!showBanner) _BannerWidget(flower.quantity, imageSize.width),
            if (!isAnonymous)
              Positioned(
                top: 5,
                right: 5,
                child: _FavoriteButton(
                  isFavorite: isFavorite,
                  onTap: () {
                    context.read<FavoriteBloc>().add(
                          isFavorite
                              ? DeleteFavoriteEvent(flower)
                              : SaveFavoriteEvent(flower),
                        );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({
    required this.isFavorite,
    required this.onTap,
  });

  final bool isFavorite;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          const Icon(Icons.favorite, color: Colors.black),
          Icon(
            isFavorite ? Icons.favorite : Icons.favorite_outline,
            color: context.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

class _FlowerDetails extends StatelessWidget {
  const _FlowerDetails({required this.flower});

  final FlowerEntity flower;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AutoSizeText(
                    flower.name.capitalize,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                        .price(value: flower.price.toString())
                        .trim(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: context.colorScheme.primary,
                        ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          const Gap(8),
          _AddToCartButton(flower: flower),
        ],
      ),
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  const _AddToCartButton({required this.flower});

  final FlowerEntity flower;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
      left: 5,
      top: 5,
      child: Container(
        decoration: BoxDecoration(
          color: quantity >= delimiter
              ? context.colorScheme.secondaryContainer
              : context.colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        constraints: BoxConstraints(
          maxWidth: width / 1.2,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: AutoSizeText(
            context.t.home.lastProducts(n: quantity),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: quantity >= delimiter
                      ? context.colorScheme.onSecondaryContainer
                      : context.colorScheme.onErrorContainer,
                ),
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
