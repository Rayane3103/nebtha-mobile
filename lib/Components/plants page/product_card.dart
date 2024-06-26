import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:nebtha/Components/plants%20page/like_button.dart';
import 'package:nebtha/Components/plants%20page/nocif.dart';
import 'package:nebtha/Components/plants%20page/purchase_button.dart';
import 'package:nebtha/Components/plants%20page/recommande.dart';
import 'package:nebtha/Constants/design.dart';
import 'package:nebtha/Screens/description_page.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.reco, required this.ProductName, required this.ProductArabicName, required this.Productdesc, required this.Price, required this.Image, required this.color, this.onPurchase, required this.Propriete,
});
  final String ProductName;
  final String Image;
  final String ProductArabicName;
  final String Productdesc;
  final List<String> Propriete;
  final int Price;
  final bool reco;
  final Color color;
    final VoidCallback? onPurchase;


  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    Uint8List bytes = base64Decode(widget.Image.split(',').last);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.height * 0.41,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 4,
                    color: Color.fromARGB(255, 122, 122, 122),
                    offset: Offset(1, 1)),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.width * 0.37,
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: widget.color,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return  DescriptionPage(ProductName: widget.ProductName, Price: widget.Price, Image: widget.Image, Productdesc: widget.Productdesc, Propriete: widget.Propriete,);
                                  }),
                                );
                              },
                              child: const Icon(Icons.info_outline)),
                          if (widget.reco == true) const Recommandation() else const Nocif()
                        ],
                      ),
                    ),
                    InkWell(
                      onTap:() => Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return  DescriptionPage(ProductName: widget.ProductName, Price: 0, Image: widget.Image, Productdesc: widget.Productdesc, Propriete:widget.Propriete,);
                                  }),
                                ),
                      child: Image.memory(
                        height: 90,
                        width: 150,
                        bytes,
                      ),
                    ),
                  ],
                ),
              ),
               Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 3, 0, 0),
                child: Text(
                  widget.ProductName,
                  style: const TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 0, 0, 0),
                child: Text(
                  widget.ProductArabicName,
                  style: const TextStyle(
                    color: primaryColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return  DescriptionPage(ProductName: widget.ProductName, Price: 0, Image: widget.Image, Productdesc: widget.Productdesc, Propriete:widget.Propriete,);
                    }),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(8.0)),
                  height: MediaQuery.of(context).size.height * 0.095,
                  width: 190,
                  child: Padding(
  padding: const EdgeInsets.symmetric(horizontal: 12.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        widget.Productdesc,
        // _truncateText(widget.Productdesc,6),
         maxLines: 3,
                          overflow: TextOverflow.ellipsis,
        style: TextStyle(
          
          fontSize: 12,
          color: Colors.grey[600],
        ),
      ),
      InkWell(
        onTap: () {
        },
        child: const Text(
          'plus de details',
          
          style: TextStyle(
            color: Color.fromARGB(255, 39, 39, 39),
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  ),
),

                ),
              ),
              Row(
                children: [
                   Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 0, 12, 0),
                    child: Text(
                      '${widget.Price} DA',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    
                  ),
                 
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
        onTap: () {
          if (widget.onPurchase != null) {
            print('added to cart');
            widget.onPurchase!();
          }
          else{print('widget.onPurshase is null');}
        },
        child:
                  Container(child: const PurchaseButton()),),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 7.5, 5, 0),
                    child: LikeButton(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  String _truncateText(String text, int maxWords) {
  List<String> words = text.split(' ');
  if (words.length > maxWords) {
    return '${words.sublist(0, maxWords).join(' ')}......';
  } else {
    return text;
  }
}
}
