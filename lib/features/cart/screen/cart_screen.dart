import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:matthiola_flower_shop/core/di/di.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/core/utils/extensions/build_context_extension.dart';
import 'package:matthiola_flower_shop/core/utils/extensions/input_extension.dart';
import 'package:matthiola_flower_shop/core/utils/snackbar_util.dart';
import 'package:matthiola_flower_shop/domain/models/cart/cart_entity.dart';
import 'package:matthiola_flower_shop/features/cart/use_cases/bloc/cart_bloc.dart';
import 'package:matthiola_flower_shop/features/cart/use_cases/cubit/cart_form_cubit.dart';
import 'package:matthiola_flower_shop/features/cart/widgets/cart_item.dart';
import 'package:matthiola_flower_shop/features/cart/widgets/empty_cart.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';
import 'package:matthiola_flower_shop/widgets/loading_widget.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

part '../widgets/input_address.dart';
part '../widgets/input_email.dart';
part '../widgets/input_phone.dart';
part '../widgets/input_username.dart';
part 'listener.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.shopping_bag,
                color: context.colorScheme.primary,
              ),
            ),
            Text(context.t.home.cart),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocSideEffectConsumer<CartBloc, CartState, BaseCommand>(
            sideEffectListener: _sideEffectListener,
            builder: (context, state) {
              if (state.isLoading) return const LoadingWidget();
              if (state.items.isEmpty) return const EmptyCart();
              final totalPrice = state.totalPrice.toStringAsFixed(2);
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: state.items.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CartItem(state.items[index]);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(),
                          SizedBox(
                            height: 30,
                            width: double.infinity,
                            child: AutoSizeText(
                              context.t.cart.total,
                              style: context.textTheme.titleLarge,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            width: double.infinity,
                            child: AutoSizeText(
                              context.t.generic.price(value: totalPrice),
                              style: context.textTheme.titleLarge,
                            ),
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          const _InputEmail(),
                          const Gap(10),
                          const _InputUsername(),
                          const Gap(10),
                          const _InputPhone(),
                          const Gap(10),
                          const _InputAddress(),
                          const Gap(10),
                          FilledButton(
                            onPressed: () {
                              context
                                  .read<CartBloc>()
                                  .add(const SubmitCartEvent());
                            },
                            style: FilledButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(context.t.checkout.sendOrder),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
