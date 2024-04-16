import 'package:flutter/material.dart';
import 'package:nebtha/Components/Slider.dart';
import 'package:nebtha/Components/card_widget.dart';
import 'package:nebtha/Constants/design.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Widget> widgetList = const [
    CardWidget(
      prix: 2000,
    ),
    CardWidget(
      prix: 500,
    ),
    CardWidget(
      prix: 2000,
    ),
    CardWidget(
      prix: 1000,
    ),
  ];
  int afficherprix(List<CardWidget> cardWidgets) {
    int sum = 0;
    for (CardWidget cardWidget in cardWidgets) {
      sum += cardWidget.prix;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    List<CardWidget> cardWidgets = widgetList.cast<CardWidget>();
    int sum = afficherprix(cardWidgets);
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.66,
          width: MediaQuery.of(context).size.width * 1,
          child: SingleChildScrollView(
            child: Column(
              children: widgetList,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.33,
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
                      '$sum DA',
                      style: const TextStyle(
                          color: primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const MySlider(),
          ],
        ),
      ],
    );
  }
}
