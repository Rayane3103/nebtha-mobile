import 'package:flutter/material.dart';
import 'package:nebtha/Constants/design.dart';

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
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: const Text('alert dialogue'),
                content: Container(
                  height: 150,
                  width: 100,
                  color: Colors.yellow[100],
                  child: const Center(child: Text('alert dialogue')),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ]);
          },
        );
        print('purchase button');
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 7, 0, 0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.33,
          height: MediaQuery.of(context).size.height * 0.034,
          decoration: BoxDecoration( border: Border.all(
      color: primaryColor,
    ),borderRadius: BorderRadius.circular(30), color: Colors.white,),
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
