import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:matthiola_flower_shop/core/constants/app_constants.dart';
import 'package:matthiola_flower_shop/core/router/router.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/core/utils/extensions/build_context_extension.dart';
import 'package:matthiola_flower_shop/core/utils/flower_type.dart';
import 'package:matthiola_flower_shop/core/utils/octo_blur_hash_fix.dart';
import 'package:matthiola_flower_shop/core/utils/snackbar_util.dart';
import 'package:matthiola_flower_shop/domain/models/flower/flower_entity.dart';
import 'package:matthiola_flower_shop/features/cart/use_cases/bloc/cart_bloc.dart';
import 'package:matthiola_flower_shop/features/home/use_cases/home_bloc.dart';
import 'package:matthiola_flower_shop/features/home/widgets/debounced_search_bar.dart';
import 'package:matthiola_flower_shop/features/home/widgets/home_pagination_widget.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';
import 'package:octo_image/octo_image.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

part '../widgets/cart_badge.dart';
part '../widgets/search_bar_with_cart.dart';
part '../widgets/search_widget.dart';
part 'listener.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: FlowerType.values.length - 1,
      vsync: this,
    );
    controller.addListener(_indexChanged);
  }

  void _indexChanged() {
    context.read<HomeBloc>().add(ControllerIndexChangedEvent(controller.index));
  }

  @override
  Widget build(BuildContext context) {
    final cartItemsCount = context.watch<CartBloc>().state.items.length;
    return BlocSideEffectConsumer<CartBloc, CartState, BaseCommand>(
      sideEffectListener: _sideEffectListener,
      builder: (context, state) {
        return BlocSideEffectConsumer<HomeBloc, HomeState, BaseCommand>(
          sideEffectListener: _sideEffectListener,
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                _searchBar(context, cartItemsCount),
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverFillRemaining(
                    child: TabBarView(
                      controller: controller,
                      children: [
                        HomePaginationWidget(
                          page: FlowerType.toCode(FlowerType.thread),
                        ),
                        HomePaginationWidget(
                          page: FlowerType.toCode(FlowerType.pot),
                        ),
                        HomePaginationWidget(
                          page: FlowerType.toCode(FlowerType.accessory),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  List<Widget> _tabs(TabController controller) {
    final tabs = <Widget>[];
    final selectedIndex = context.watch<HomeBloc>().state.controllerIndex;
    for (final flowerType in FlowerType.values) {
      if (flowerType.isInvalid) continue;
      final isSelected = FlowerType.fromCode(selectedIndex) == flowerType;
      tabs.add(
        Tab(
          text: flowerType.text,
          iconMargin: const EdgeInsets.all(5),
          icon: SvgPicture.asset(
            flowerType.svg,
            colorFilter: ColorFilter.mode(
              isSelected
                  ? context.colorScheme.primary
                  : context.colorScheme.onPrimaryContainer,
              BlendMode.srcIn,
            ),
            width: 24,
            height: 24,
          ),
        ),
      );
    }
    return tabs;
  }

  Widget _searchBar(
    BuildContext context,
    int cartItemsCount,
  ) {
    return SliverAppBar(
      floating: true,
      title: DebouncedSearchBar<FlowerEntity>(
        resultToString: (result) => result.name,
        hintText: context.t.generic.search,
        noResultsBuilder: _noResultsBuilder(context),
        resultTitleBuilder: (result) => _buildSuggestionItem(context, result),
        onResultSelected: (result) {
          context.read<HomeBloc>().add(HomeOnFlowerTappedEvent(result.id));
        },
        searchFunction: (query) async {
          final completer = Completer<List<FlowerEntity>>();
          final bloc = context.read<HomeBloc>();
          final subscription = bloc.stream.listen((state) {
            if (state.query == query) {
              completer.complete(state.filteredData);
            }
          });

          bloc.add(HomeOnSearchEvent(query));

          try {
            final results =
                await completer.future.timeout(const Duration(seconds: 5));
            return results;
          } catch (e) {
            return [];
          } finally {
            await subscription.cancel();
          }
        },
      ),
      stretch: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
            onTap: () {
              context.read<HomeBloc>().add(const OnCartTappedEvent());
            },
            child: CartBadge(cartItemsCount: cartItemsCount),
          ),
        ),
      ],
      bottom: TabBar(
        tabs: _tabs(controller),
        indicatorSize: TabBarIndicatorSize.tab,
        controller: controller,
      ),
    );
  }

  Widget _noResultsBuilder(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Gap(10),
          const Icon(
            Icons.search_off,
            size: 50,
            color: Colors.grey,
          ),
          const SizedBox(height: 10),
          Text(
            context.t.generic.noResults,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.grey,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionItem(BuildContext context, FlowerEntity flower) {
    return Card(
      color: context.colorScheme.surface.withAlpha(200),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: OctoImage(
            image: CachedNetworkImageProvider(flower.image),
            placeholderBuilder: OctoBlurHashFix.placeHolder(
              AppConstants.PLACEHOLDER_BLUR_HASH,
            ),
            width: 50,
            height: 50,
            errorBuilder: OctoError.icon(color: Colors.red),
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          flower.name,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(4),
            Text(
              flower.description,
              style: context.textTheme.bodySmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Gap(4),
            Text(
              context.t.generic.price(value: flower.price.toString()).trim(),
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
