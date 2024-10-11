import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:matthiola_flower_shop/core/router/router.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/core/utils/debouncer.dart';
import 'package:matthiola_flower_shop/core/utils/flower_type.dart';
import 'package:matthiola_flower_shop/core/utils/snackbar_util.dart';
import 'package:matthiola_flower_shop/domain/models/flower/flower_entity.dart';
import 'package:matthiola_flower_shop/features/home/use_cases/home_bloc.dart';
import 'package:matthiola_flower_shop/features/home/widgets/flower_card.dart';
import 'package:matthiola_flower_shop/features/home/widgets/user_tile.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';
import 'package:matthiola_flower_shop/widgets/loading_widget.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';

part 'listener.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Debouncer debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return BlocSideEffectListener<HomeBloc, BaseCommand>(
      listener: _sideEffectListener,
      child: BlocConsumer<HomeBloc, HomeState>(
        listenWhen: (previous, current) => current.query.isEmpty,
        listener: (context, state) {
          controller.text = state.query;
        },
        builder: (context, state) {
          if (state.isLoading) return const LoadingWidget();
          var data = <FlowerEntity>[];
          if (state.filteredData.isNotEmpty) {
            data = state.filteredData;
          } else {
            data = state.choiceChipSelectedItem == 0
                ? state.stemData
                : state.potData;
          }
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CustomScrollView(
              slivers: [
                const SliverPadding(
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  sliver: SliverToBoxAdapter(
                    child: UserTile(),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 10),
                  sliver: SliverToBoxAdapter(
                    child: TextField(
                      onChanged: (query) {
                        _onSearch(context, query);
                      },
                      controller: controller,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(CupertinoIcons.search),
                        hintText: context.t.home.search,
                        suffixIcon: (state.filteredData.isNotEmpty ||
                                state.query.isNotEmpty)
                            ? GestureDetector(
                                onTap: () {
                                  context
                                      .read<HomeBloc>()
                                      .add(const HomeClearQueryEvent());
                                },
                                child: const Icon(Icons.clear),
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 10),
                  sliver: SliverToBoxAdapter(
                    child: Visibility(
                      maintainAnimation: true,
                      maintainState: true,
                      visible: state.filteredData.isEmpty,
                      child: Wrap(
                        spacing: 8,
                        children: FlowerType.values.map((flowerType) {
                          if (flowerType.isInvalid) {
                            return Container();
                          }
                          return ChoiceChip(
                            label:
                                Text(_flowerTypeToString(context, flowerType)),
                            showCheckmark: false,
                            selected: FlowerType.fromCode(
                                  state.choiceChipSelectedItem,
                                ) ==
                                flowerType,
                            onSelected: (isSelected) {
                              context.read<HomeBloc>().add(
                                    HomeFlowerTypeChanged(
                                      FlowerType.toCode(flowerType),
                                    ),
                                  );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 10),
                  sliver: SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<HomeBloc>()
                              .add(HomeOnFlowerTappedEvent(data[index].id));
                        },
                        child: FlowerCard(flower: data[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onSearch(BuildContext context, String query) {
    debouncer.run(() {
      context.read<HomeBloc>().add(HomeOnSearchEvent(query));
    });
  }

  String _flowerTypeToString(BuildContext context, FlowerType flowerType) {
    switch (flowerType) {
      case FlowerType.thread:
        return context.t.home.threadFlower;
      case FlowerType.pot:
        return context.t.home.potFlower;
      case FlowerType.invalid:
        return '';
    }
  }
}
