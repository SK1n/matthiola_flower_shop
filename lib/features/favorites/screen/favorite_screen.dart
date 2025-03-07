import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:matthiola_flower_shop/core/router/router.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/core/utils/extensions/build_context_extension.dart';
import 'package:matthiola_flower_shop/core/utils/snackbar_util.dart';
import 'package:matthiola_flower_shop/features/favorites/use_cases/favorite_bloc.dart';
import 'package:matthiola_flower_shop/features/home/widgets/flower_card.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';
import 'package:matthiola_flower_shop/widgets/not_found_widget.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

part 'listener.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSideEffectConsumer<FavoriteBloc, FavoriteState, BaseCommand>(
      sideEffectListener: _sideEffectListener,
      builder: (context, state) {
        if (state.isAnonymous) {
          return _buildAnonymous(context);
        }
        if (state.items.isEmpty) {
          return NotFoundWidget(
            message: context.t.home.emptyFavorite,
          );
        }
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.favorite,
                      color: context.colorScheme.primary,
                    ),
                  ),
                  Text(context.t.home.favorite),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 10,
                ),
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context
                          .read<FavoriteBloc>()
                          .add(FavoritePressedEvent(state.items[index].id));
                    },
                    child: FlowerCard(
                      flower: state.items[index],
                      showBanner: true,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget _buildAnonymous(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.favorite_outline,
          size: 100,
          color: context.colorScheme.primary,
        ),
        const Gap(20),
        Text(
          context.t.generic.anonymous.favorites,
          style: context.textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const Gap(30),
        FilledButton(
          onPressed: () {
            context.read<FavoriteBloc>().add(const LoginEvent());
          },
          child: Text(context.t.generic.anonymous.button),
        ),
      ],
    ),
  );
}
