import 'package:flutter/material.dart';

class PurchaseButton extends StatefulWidget {
  const PurchaseButton({super.key});

  @override
  State<PurchaseButton> createState() => _PurchaseButtonState();
}

class _PurchaseButtonState extends State<PurchaseButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('purchase button');
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(23.0, 0, 12, 0),
        child: Container(
          width: 130,
          height: 35,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  blurRadius: 2,
                )
              ],
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 185, 229, 187)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('purchase'),
              Icon(Icons.shopping_cart),
            ],
          ),
        ),
      ),
    );
  }
}
