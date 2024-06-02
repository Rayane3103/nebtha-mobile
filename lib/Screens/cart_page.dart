import 'package:flutter/material.dart';
import 'package:nebtha/Components/cart_page/Slider.dart';
import 'package:nebtha/Components/cart_page/card_widget.dart';
import 'package:nebtha/Constants/design.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> selectedProducts;
  final Map<String, dynamic> profileData;

  const CartPage({super.key, required this.selectedProducts, required this.profileData});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    print('Selected Product Names (After Navigation): ${widget.selectedProducts.map((product) => product['ProductName']).toList()}');
  }
  
  int calculateTotalPrice() {
    int sum = 0;
    for (var product in widget.selectedProducts){
      sum += (product['Price'] as num).toInt();
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = calculateTotalPrice();
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.67,
          child: ListView.builder(
            itemCount: widget.selectedProducts.length,
            itemBuilder: (context, index) {
              final product = widget.selectedProducts[index];
              return CardWidget(
                ProductName: product['ProductName'],
                isPowder: true,
                Quantity: 100,
                Price: product['Price'],
                MyImage: product['Image'],
              );
            },
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.42,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' $totalPrice DA',
                      style: const TextStyle(
                          color: primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            MySlider(
              totalPrice: totalPrice,
              profileData: widget.profileData,
              selectedProducts: widget.selectedProducts,
            ),
          ],
        ),
      ],
    );
  }
}

