import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matthiola_flower_shop/domain/models/flower/flower_entity.dart';
import 'package:matthiola_flower_shop/features/home/use_cases/home_bloc.dart';
import 'package:matthiola_flower_shop/features/home/widgets/flower_card.dart';
import 'package:matthiola_flower_shop/widgets/loading_widget.dart';

class HomePaginationWidget extends StatelessWidget {
  const HomePaginationWidget({required this.page, super.key});

  final int page;

  @override
  Widget build(BuildContext context) {
    final query = context.select((HomeBloc bloc) => bloc.state.firestoreQuery);
    return FirestoreQueryBuilder<FlowerEntity>(
      query: query[page],
      builder: (context, snapshot, _) {
        if (snapshot.isFetching) {
          return const LoadingWidget();
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            childAspectRatio: 0.7,
            mainAxisSpacing: 10,
          ),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: snapshot.docs.length,
          itemBuilder: (context, index) {
            final data = snapshot.docs[index].data();
            return GestureDetector(
              onTap: () {
                context.read<HomeBloc>().add(
                      HomeOnFlowerTappedEvent(data.id),
                    );
              },
              child: FlowerCard(flower: data),
            );
          },
        );
      },
    );
  }
}
