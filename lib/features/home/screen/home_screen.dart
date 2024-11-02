import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:matthiola_flower_shop/core/router/router.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/core/utils/extensions/build_context_extension.dart';
import 'package:matthiola_flower_shop/core/utils/flower_type.dart';
import 'package:matthiola_flower_shop/core/utils/snackbar_util.dart';
import 'package:matthiola_flower_shop/domain/models/flower/flower_entity.dart';
import 'package:matthiola_flower_shop/features/home/use_cases/home_bloc.dart';
import 'package:matthiola_flower_shop/features/home/widgets/flower_card.dart';
import 'package:matthiola_flower_shop/features/home/widgets/user_tile.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';
import 'package:matthiola_flower_shop/widgets/loading_widget.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

part '../widgets/search_widget.dart';
part 'listener.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                : state.choiceChipSelectedItem == 1
                    ? state.potData
                    : state.accessoriesData;
          }
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: RefreshIndicator.adaptive(
                onRefresh: () async {
                  context.read<HomeBloc>().add(const GetFlowerData());
                },
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
                        child: _SearchBar(state: state),
                      ),
                    ),
                    const SliverGap(10),
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
                              final selected = FlowerType.fromCode(
                                    state.choiceChipSelectedItem,
                                  ) ==
                                  flowerType;
                              if (flowerType.isInvalid) {
                                return Container();
                              }
                              return ChoiceChip(
                                label: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      flowerType.svg,
                                      colorFilter: ColorFilter.mode(
                                        context.colorScheme.onPrimaryContainer,
                                        BlendMode.srcIn,
                                      ),
                                      width: 24,
                                      height: 24,
                                    ),
                                    const Gap(5),
                                    Text(flowerType.text),
                                  ],
                                ),
                                showCheckmark: false,
                                selected: selected,
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
                    const SliverGap(10),
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 10),
                      sliver: SliverGrid.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          childAspectRatio: 0.7,
                          mainAxisSpacing: 10,
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
              ),
            ),
          );
        },
      ),
    );
  }
}
