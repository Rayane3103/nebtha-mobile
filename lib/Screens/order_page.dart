import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nebtha/Components/auth/customfield.dart';
import 'package:nebtha/Components/auth/drop_menu.dart';
import 'package:nebtha/Components/cart_page/Slider2.dart';
import 'package:nebtha/Constants/constants.dart';
import 'package:nebtha/Constants/design.dart';

class OrderPage extends StatefulWidget {
  final int totalPrice;
   final Map<String, dynamic> profileData;
  final List<Map<String, dynamic>> selectedProducts;
 
  const OrderPage({super.key, required this.totalPrice, required this.profileData, required this.selectedProducts});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
    String? selectedWillaya;

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneNumberController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController willayaController = TextEditingController();
    return  Scaffold(body: Padding(
      padding: const EdgeInsets.fromLTRB(15.0,0,15,0),
      child: ListView(
        children: [
          Image.asset('assets/Livreur.png'),
          Text('${widget.totalPrice} DA',style: const TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 20),),
          const Text('+600DA:  (Livraison)',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 20),),
          
          Dropyy( onChanged: (value) {
                setState(() {
                  selectedWillaya = value;
                });
              },hintText: 'Willaya', dropItems: wilayas),
           CustomTextField(labelText: 'Adresse', keyboardType: TextInputType.streetAddress,controller: addressController,),
           CustomTextField(labelText: 'Numéro Téléphone', keyboardType: TextInputType.phone,controller: phoneNumberController,),
 MySlider2(
              profileData: widget.profileData,
              selectedProducts: widget.selectedProducts,
              totalPrice: widget.totalPrice,
              phoneNumberController: phoneNumberController,
              addressController: addressController,
              selectedWillaya: selectedWillaya,
            ),
        ],
      ),
    ));
  }
}