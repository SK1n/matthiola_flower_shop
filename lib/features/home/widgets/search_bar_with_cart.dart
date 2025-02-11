part of '../screen/home_screen.dart';

// class _SearchBarWithCart extends StatelessWidget {
//   const _SearchBarWithCart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cartItemsCount = context.watch<CartBloc>().state.items.length;
//     return Row(
//       children: [
//         const Expanded(child: _SearchBar()),
//         Padding(
//           padding: const EdgeInsets.only(left: 20),
//           child: GestureDetector(
//             onTap: () {
//               context.read<HomeBloc>().add(const OnCartTappedEvent());
//             },
//             child: CartBadge(cartItemsCount: cartItemsCount),
//           ),
//         ),
//       ],
//     );
//   }
// }
