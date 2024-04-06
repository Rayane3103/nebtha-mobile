import 'package:flutter/material.dart';
import 'package:nebtha/Components/plants%20page/list_of_two.dart';
import 'package:nebtha/Components/plants%20page/product_card.dart';

class PlantsPage extends StatelessWidget {
  const PlantsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          RowOfTwo(w1: ProductCard(reco: false), w2: ProductCard(reco: true)),
          RowOfTwo(w1: ProductCard(reco: true), w2: ProductCard(reco: false)),
          RowOfTwo(w1: ProductCard(reco: false), w2: ProductCard(reco: false)),
        ],
      ),
    );
  }
}
