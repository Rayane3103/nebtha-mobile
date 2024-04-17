import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nebtha/Components/plants%20page/product_card.dart';
import 'dart:convert';

import 'package:nebtha/Constants/design.dart';

class PlantsPage extends StatefulWidget {
  const PlantsPage({super.key,});

  @override
  _PlantsPageState createState() => _PlantsPageState();
}

class _PlantsPageState extends State<PlantsPage> {
  List<Map<String, dynamic>> products = [];
  Random random = Random();

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://nebta.onrender.com/api/product'));
    if (response.statusCode == 200) {
      // Check if the widget is still mounted before updating the state
      if (mounted) {
        setState(() {
          products = List<Map<String, dynamic>>.from(json.decode(response.body));
        });
      }
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: MediaQuery.of(context).size.height * 0.43,
      ),
      itemBuilder: (BuildContext context, int index) {
        final product = products[index];
        final randomIndex = random.nextInt(backgrounds.length);
        return ProductCard(
          color: backgrounds[randomIndex],
          reco: true,
          ProductName: product['ProductName'],
          ProductArabicName: product['ProductArabicName'],
          Productdesc: product['Productdesc'],
          Price: product['Price'],
          Image: product['Image'],
        );
      },
    );
  }
}
