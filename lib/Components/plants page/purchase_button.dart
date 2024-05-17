import 'package:flutter/material.dart';
import 'package:nebtha/Constants/design.dart';

class PurchaseButton extends StatelessWidget {

  const PurchaseButton({super.key, });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){print('added to cart');} , // Trigger the callback function
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 7, 0, 0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.33,
          height: MediaQuery.of(context).size.height * 0.034,
          decoration: BoxDecoration(
            border: Border.all(
              color: primaryColor,
            ),
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                size: 20,
                color: primaryColor,
              ),
              Text(
                'Ajouter au panier',
                style: TextStyle(fontSize: 13, color: primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
