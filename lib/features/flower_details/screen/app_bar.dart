part of 'flower_details_screen.dart';

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar(this.flower);

  final FlowerEntity flower;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        final item = state.items.firstWhere(
          (element) => element.id == flower.id,
          orElse: () => FlowerEntity.empty,
        );
        final isAnonymous = state.isAnonymous;

        final isFavorite = item != FlowerEntity.empty;
        return AppBar(
          title: Text(flower.name),
          actions: isAnonymous
              ? null
              : [
                  IconButton(
                    onPressed: () {
                      isFavorite
                          ? context
                              .read<FavoriteBloc>()
                              .add(DeleteFavoriteEvent(item))
                          : context
                              .read<FavoriteBloc>()
                              .add(SaveFavoriteEvent(flower));
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_outline,
                      color: context.colorScheme.primary,
                    ),
                  ),
                ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
