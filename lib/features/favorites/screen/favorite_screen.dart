import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:matthiola_flower_shop/core/router/router.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/core/utils/snackbar_util.dart';
import 'package:matthiola_flower_shop/features/favorites/use_cases/favorite_bloc.dart';
import 'package:matthiola_flower_shop/features/home/widgets/flower_card.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';
import 'package:matthiola_flower_shop/widgets/not_found_widget.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';

part 'listener.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSideEffectListener<FavoriteBloc, BaseCommand>(
      listener: _sideEffectListener,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.favorite),
              ),
              Text(context.t.home.favorite),
            ],
          ),
        ),
        body: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state.items.isEmpty) {
              return NotFoundWidget(
                message: context.t.home.emptyFavorite,
              );
            }
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  sliver: SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 20,
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
                          isFavorite: true,
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
