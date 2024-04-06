import 'package:flutter/material.dart';
import 'package:nebtha/Constants/design.dart';

class PurchaseTextButton extends StatefulWidget {
  const PurchaseTextButton({super.key});

  @override
  State<PurchaseTextButton> createState() => _PurchaseTextButtonState();
}

class _PurchaseTextButtonState extends State<PurchaseTextButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('same page as purchase button ');
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.72,
          height: MediaQuery.of(context).size.height * 0.045,
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
              spreadRadius: 1.5,
              color: primaryColor,
              blurRadius: 2,
            )
          ], borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: const Center(
            child: Text(
              'Ajouter au panier',
              style: TextStyle(fontSize: 17, color: primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
