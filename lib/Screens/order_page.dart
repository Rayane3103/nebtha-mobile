import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nebtha/Components/auth/customfield.dart';
import 'package:nebtha/Components/auth/drop_menu.dart';
import 'package:nebtha/Components/cart_page/Slider2.dart';
import 'package:nebtha/Constants/constants.dart';
import 'package:nebtha/Constants/design.dart';

class OrderPage extends StatelessWidget {
  final int totalPrice;
   final Map<String, dynamic> profileData;

  const OrderPage({super.key, required this.totalPrice, required this.profileData});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Padding(
      padding: const EdgeInsets.fromLTRB(15.0,0,15,0),
      child: ListView(
        children: [
          Image.asset('assets/Livreur.png'),
          Text('$totalPrice DA',style: const TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 20),),
          const Text('+600DA:  (Livraison)',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 20),),
          
          Dropyy(hintText: 'Willaya', dropItems: wilayas),
          const CustomTextField(labelText: 'Adresse', keyboardType: TextInputType.streetAddress),
          const CustomTextField(labelText: 'Numéro Téléphone', keyboardType: TextInputType.phone),
           MySlider2(profileData: profileData,)

        ],
      ),
    ));
  }
}