import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matthiola_flower_shop/core/utils/extensions/build_context_extension.dart';
import 'package:matthiola_flower_shop/features/cart/use_cases/bloc/cart_bloc.dart';
import 'package:matthiola_flower_shop/features/home/use_cases/home_bloc.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItemsCount = context.watch<CartBloc>().state.items.length;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SizedBox(
          height: 50,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          context.t.home.welcomeBack,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                          maxFontSize: 30,
                          minFontSize: 10,
                        ),
                      ),
                      Expanded(
                        child: AutoSizeText(
                          state.user.displayName,
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontWeight: FontWeight.w300,
                                  ),
                          maxFontSize: 20,
                          minFontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    context.read<HomeBloc>().add(const OnCartTappedEvent());
                  },
                  child: Badge(
                    backgroundColor: context.colorScheme.primary,
                    textColor: context.colorScheme.onPrimary,
                    label: Center(
                      child: Text(
                        cartItemsCount.toString(),
                      ),
                    ),
                    isLabelVisible: cartItemsCount != 0,
                    child: const Icon(Icons.shopping_bag_outlined),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
