part of 'flower_details_screen.dart';

class _TextPart extends StatelessWidget {
  const _TextPart(this.item, this.quantity);

  final FlowerEntity item;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleText(context),
          _buildFlowerTypeText(context),
          if (item.description.isNotEmpty) _buildDescriptionText(context),
          const Gap(10),
          _buildQuantityContainer(context),
          const Gap(15),
          _buildAddToCartButton(context),
        ],
      ),
    );
  }

  Widget _buildTitleText(BuildContext context) {
    return AutoSizeText(
      context.t.flower_details.title(name: item.name, price: item.price),
      style: context.textTheme.titleLarge,
      maxLines: 1,
    );
  }

  Widget _buildFlowerTypeText(BuildContext context) {
    return AutoSizeText(
      item.flowerType,
      style: context.textTheme.titleMedium,
      maxLines: 1,
    );
  }

  Widget _buildDescriptionText(BuildContext context) {
    return AutoSizeText(
      item.description,
      style: context.textTheme.bodySmall,
    );
  }

  Widget _buildQuantityContainer(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(child: _buildRemoveButton(context)),
                Flexible(
                  child: Center(
                    child: AutoSizeText(
                      quantity.toString(),
                      style: context.textTheme.titleSmall,
                      minFontSize: 5,
                    ),
                  ),
                ),
                Expanded(child: _buildAddButton(context)),
              ],
            ),
          ),
          const Gap(20),
          Expanded(
            child: AutoSizeText(
              context.t.flower_details.batchOf(value: item.batchSize),
              textAlign: TextAlign.end,
              style: context.textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w100,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRemoveButton(BuildContext context) {
    return _buildOutlinedButton(
      context,
      onPressed: () {
        context.read<FlowerDetailsBloc>().add(
              FlowerDetailsRemoveEvent(item.batchSize),
            );
      },
      icon: Icons.remove,
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return _buildFilledButton(
      context,
      onPressed: () {
        context.read<FlowerDetailsBloc>().add(
              FlowerDetailsAddEvent(item.batchSize),
            );
      },
      icon: Icons.add,
    );
  }

  Widget _buildAddToCartButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: () {
          context.read<CartBloc>().add(
                AddToCart(CartEntity(item: item, quantity: quantity)),
              );
        },
        style: _buttonStyle(context),
        child: Text(context.t.flower_details.addToCard),
      ),
    );
  }

  Widget _buildOutlinedButton(
    BuildContext context, {
    required VoidCallback onPressed,
    required IconData icon,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      style: _buttonStyle(context),
      child: Icon(icon),
    );
  }

  Widget _buildFilledButton(
    BuildContext context, {
    required VoidCallback onPressed,
    required IconData icon,
  }) {
    return FilledButton(
      onPressed: onPressed,
      style: _buttonStyle(context),
      child: Icon(icon),
    );
  }

  ButtonStyle _buttonStyle(BuildContext context) {
    return ButtonStyle(
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
