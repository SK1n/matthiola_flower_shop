part of '../screen/home_screen.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({required this.cartItemsCount, super.key});
  final int cartItemsCount;

  @override
  Widget build(BuildContext context) {
    return Badge(
      backgroundColor: context.colorScheme.primary,
      textColor: context.colorScheme.onPrimary,
      label: Center(
        child: Text(
          cartItemsCount.toString(),
        ),
      ),
      isLabelVisible: cartItemsCount != 0,
      child: const Icon(Icons.shopping_bag_outlined),
    );
  }
}
