import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nebtha/Components/customNavbar.dart';
import 'package:nebtha/Constants/design.dart';
import 'package:http/http.dart' as http;
import 'package:slide_to_act/slide_to_act.dart';

class MySlider2 extends StatefulWidget {
  final Map<String, dynamic> profileData;
  final List<Map<String, dynamic>> selectedProducts;
  final int totalPrice;
  final TextEditingController phoneNumberController;
  final TextEditingController addressController;
  final String? selectedWillaya;

  const MySlider2({super.key, 
    required this.profileData,
    required this.selectedProducts,
    required this.totalPrice,
    required this.phoneNumberController,
    required this.addressController,
    required this.selectedWillaya,
  });


  @override
  State<MySlider2> createState() => _MySlider2State();
}

class _MySlider2State extends State<MySlider2> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final GlobalKey<SlideActionState> key = GlobalKey();
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
          child: SlideAction(
            animationDuration: const Duration(milliseconds: 400),
            sliderButtonIconPadding: 8.0,
            textStyle: const TextStyle(
                fontWeight: FontWeight.w400, color: Colors.white, fontSize: 20),
            height: 50,
            outerColor: primaryColor,
            sliderButtonIcon: const Icon(
              Icons.shopping_bag_outlined,
              color: primaryColor,
            ),
            sliderRotate: false,
            text: '       Confirmer La Commande',
            key: key,
            onSubmit: _postOrderData));
      },
    );
  }
  Future<void> _postOrderData() async {
  const url = 'https://nebta-orders.onrender.com/api/Order';
  final headers = <String, String>{
    'Content-Type': 'application/json',
  };

  // Extracting _id from profileData
  final profileId = widget.profileData['_id'];

  // Creating the payload with only _id of each product
  final List<Map<String, dynamic>> Panier = [];
  for (var product in widget.selectedProducts) {

    Panier.add({
      'Product': product['_id'], // Only include the _id field
      'Quantity': 100, // You can replace this with your desired quantity
      'IsPowder': true, // You can replace this with your desired value
    });
  }
  final body = jsonEncode({
    'Profile': profileId,
    'Pannier': Panier,
     'Willaya':widget.selectedWillaya,
    'phoneNumber':widget.phoneNumberController.text,
    'Daira': widget.selectedWillaya,
    'Address':widget.addressController.text,
    'PriceLivraision': 600,
    'Total':widget.totalPrice,
    'TotalWithCodePromo': widget.totalPrice,
    'PymentOnline': true,
  });

  try {
    final response = await http.post(Uri.parse(url), headers: headers, body: body);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AlertDialog(
                    content: Text('Commande confirmée. Nous vous appellerons bientôt.'),
                  );
                },
              );
              
              Timer(const Duration(seconds: 3), () {
                Navigator.of(context).pop();
                     Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) =>  MyMainWidget(profileData: widget.profileData,),
                ),
              );

 },
          );
              return;
      print('Order data posted successfully');
    } else {
      // If the server returns an error response, throw an exception.
      throw Exception('Failed to post order data');
    }
  } catch (e) {
    // Handle network errors or exceptions
    print('Error: $e');
  }
}
}
