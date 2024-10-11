import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matthiola_flower_shop/core/constants/app_constants.dart';
import 'package:matthiola_flower_shop/core/utils/extensions/build_context_extension.dart';
import 'package:matthiola_flower_shop/core/utils/octo_blur_hash_fix.dart';
import 'package:matthiola_flower_shop/domain/models/cart/cart_entity.dart';
import 'package:matthiola_flower_shop/domain/models/flower/flower_entity.dart';
import 'package:matthiola_flower_shop/features/cart/use_cases/bloc/cart_bloc.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';
import 'package:octo_image/octo_image.dart';

class FlowerCard extends StatelessWidget {
  const FlowerCard({required this.flower, this.isFavorite = false, super.key});

  final FlowerEntity flower;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final imageSize = Size(double.infinity, constraints.maxHeight * 0.65);
        return Card(
          elevation: 4,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: imageSize.height,
                    width: imageSize.width,
                    child: OctoImage(
                      image: CachedNetworkImageProvider(
                        flower.image,
                      ),
                      placeholderBuilder: OctoBlurHashFix.placeHolder(
                        AppConstants.PLACEHOLDER_BLUR_HASH,
                      ),
                      errorBuilder: OctoError.icon(color: Colors.red),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 5,
                        right: 10,
                        bottom: 5,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  flower.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  minFontSize: 15,
                                ),
                                AutoSizeText(
                                  flower.flowerType,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontWeight: FontWeight.w300,
                                      ),
                                  maxLines: 1,
                                ),
                                AutoSizeText(
                                  context.t.generic.price(
                                    value: flower.price.toString(),
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                  maxLines: 1,
                                ),
                                // if (flower.quantity <= 20 && !isFavorite)
                                //   const AutoSizeText(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: GestureDetector(
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
                              child: CircleAvatar(
                                backgroundColor: context.colorScheme.primary,
                                child: Icon(
                                  Icons.add,
                                  color: context.colorScheme.onInverseSurface,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (!isFavorite)
                Positioned(
                  top: 0,
                  right: 0,
                  child: _BannerWidget(flower.quantity, constraints.maxWidth),
                ),
            ],
          ),
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
