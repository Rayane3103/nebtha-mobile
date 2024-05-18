import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:nebtha/Components/plants%20page/like_button.dart';
import 'package:nebtha/Components/plants%20page/purchase_text_button.dart';
import 'package:nebtha/Constants/design.dart';

class DescriptionPage extends StatefulWidget {
    final String ProductName;
    final String Productdesc;
  final List<String> Propriete;
    final int Price;
    final String Image;
  const DescriptionPage({
    super.key, required this.ProductName, required this.Price, required this.Image, required this.Productdesc, required this.Propriete,
  });
  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  double size = 15.0;
  @override
  Widget build(BuildContext context) {
        Uint8List bytes = base64Decode(widget.Image.split(',').last);

    return Scaffold(
      body: Stack(children: [Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 75,),
          SizedBox(
            width: MediaQuery.sizeOf(context).width*1,
           child:Image.memory(bytes,height: 150,width: 150,)
          ),
        ],
      ),
      DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.5,
            maxChildSize: 0.6,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  border: BorderDirectional(
                    top: BorderSide(
                      color: primaryColor,
                      width: 2.0,
                    ),
                  ),
                ),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.ProductName, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: primaryColor)),
                          const SizedBox(height: 10),
                          Text(widget.Productdesc, style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 10),
                          const Text('Properties:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ...widget.Propriete.map((prop) => Text('- $prop', style: const TextStyle(fontSize: 16))),
                          const SizedBox(height: 10),
                          // Text('Price: \$${widget.Price}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          // You can add your LikeButton and PurchaseTextButton here
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
                ],)
      
      
            
          
      );
    
  }
}
