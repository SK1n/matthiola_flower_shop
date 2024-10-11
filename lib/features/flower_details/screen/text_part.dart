part of 'flower_details_screen.dart';

class _TextPart extends StatelessWidget {
  const _TextPart(this.item, this.quantity);

  final FlowerEntity item;

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: AutoSizeText(
                context.t.flower_details
                    .title(name: item.name, price: item.price),
                style: context.textTheme.titleLarge,
                maxLines: 1,
              ),
            ),
            Flexible(
              child: AutoSizeText(
                item.flowerType,
                style: context.textTheme.titleMedium,
                maxLines: 1,
              ),
            ),
            if (item.description.isNotEmpty)
              Flexible(child: AutoSizeText(item.description)),
            const Gap(10),
            Container(
              height: 80,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(child: _removeButton(context)),
                        Flexible(
                          child: Center(
                            child: AutoSizeText(
                              quantity.toString(),
                              style: context.textTheme.titleSmall,
                              minFontSize: 5,
                            ),
                          ),
                        ),
                        Expanded(child: _addButton(context)),
                      ],
                    ),
                  ),
                  const Gap(5),
                  Expanded(
                    child: AutoSizeText(
                      context.t.flower_details.batchOf(
                        value: item.batchSize,
                      ),
                      textAlign: TextAlign.end,
                      style: context.textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w100,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _addToCartButton(context),
          ],
        ),
      ),
    );
  }

  Widget _removeButton(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        context.read<FlowerDetailsBloc>().add(
              FlowerDetailsRemoveEvent(item.batchSize),
            );
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
      ),
      child: const Icon(Icons.remove),
    );
  }

  Widget _addButton(BuildContext context) {
    return FilledButton(
      onPressed: () {
        context.read<FlowerDetailsBloc>().add(
              FlowerDetailsAddEvent(item.batchSize),
            );
      },
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
      ),
      child: const Icon(Icons.add),
    );
  }

  Widget _addToCartButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: () {
          context.read<CartBloc>().add(
                AddToCart(CartEntity(item: item, quantity: quantity)),
              );
        },
        style: OutlinedButton.styleFrom(
          maximumSize: const Size(double.infinity, 50),
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          context.t.flower_details.addToCard,
        ),
      ),
    );
  }
}
