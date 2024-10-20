import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:matthiola_flower_shop/core/constants/app_constants.dart';
import 'package:matthiola_flower_shop/core/utils/extensions/build_context_extension.dart';
import 'package:matthiola_flower_shop/core/utils/octo_blur_hash_fix.dart';
import 'package:matthiola_flower_shop/domain/models/cart/cart_entity.dart';
import 'package:matthiola_flower_shop/features/cart/use_cases/bloc/cart_bloc.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';
import 'package:octo_image/octo_image.dart';

class CartItem extends StatelessWidget {
  const CartItem(this.item, {super.key});

  final CartEntity item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: item.error.isEmpty ? 120 : 130,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  SizedBox(
                    height: 120,
                    width: 100,
                    child: OctoImage(
                      image: CachedNetworkImageProvider(
                        item.item.image,
                      ),
                      placeholderBuilder: OctoBlurHashFix.placeHolder(
                        AppConstants.PLACEHOLDER_BLUR_HASH,
                      ),
                      errorBuilder: OctoError.icon(color: Colors.red),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Gap(5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            item.item.name,
                            style: context.textTheme.titleLarge,
                          ),
                        ),
                        Expanded(
                          child: AutoSizeText(
                            context.t.generic.price(
                              value: (item.item.price * item.quantity)
                                  .toStringAsFixed(2),
                            ),
                            style: context.textTheme.titleLarge,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      context.read<CartBloc>().add(
                                            RemoveFromCart(
                                              CartEntity(
                                                item: item.item,
                                                quantity: item.item.batchSize,
                                              ),
                                            ),
                                          );
                                    },
                                    child: const Icon(Icons.remove),
                                  ),
                                ),
                                Expanded(
                                  child: AutoSizeText(
                                    item.quantity.toString(),
                                    textAlign: TextAlign.center,
                                    style: context.textTheme.titleLarge,
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      context.read<CartBloc>().add(
                                            AddToCart(
                                              CartEntity(
                                                item: item.item,
                                                quantity: item.item.batchSize,
                                              ),
                                              showDialog: false,
                                            ),
                                          );
                                    },
                                    child: const Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(5),
                      ],
                    ),
                  ),
                  const Gap(20),
                  GestureDetector(
                    onTap: () {
                      context.read<CartBloc>().add(RecyclePressed(item));
                    },
                    child: Icon(
                      Icons.delete,
                      color: context.colorScheme.error,
                    ),
                  ),
                  const Gap(5),
                ],
              ),
            ),
            if (item.error.isNotEmpty)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: AutoSizeText(
                    item.error,
                    style: context.textTheme.titleLarge!
                        .copyWith(color: Colors.red),
                    maxFontSize: 15,
                    minFontSize: 10,
                  ),
                ),
              )
            else
              Container(),
          ],
        ),
      ),
    );
  }
}
