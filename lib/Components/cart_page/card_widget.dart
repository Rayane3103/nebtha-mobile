import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:nebtha/Components/cart_page/Cart_component.dart';
import 'package:nebtha/Components/cart_page/Slider.dart';
import 'package:nebtha/Constants/design.dart';

class CardWidget extends StatefulWidget {
  final String ProductName;
  bool isPowder; 
  final int Quantity;
  final int Price;
  final String MyImage;
  CardWidget({super.key, 
  
    required this.ProductName,
    required this.isPowder,
    required this.Quantity,
    required this.Price,
    required this.MyImage,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  
  _CardWidgetState();
  @override
  Widget build(BuildContext context) {
        Uint8List image = base64Decode(widget.MyImage.split(',').last);

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade600,
                ),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.175,
            width: MediaQuery.of(context).size.width * 1,
            child: Row(
              children: [
                Image.memory(image, height: 50, width: 50),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 15),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.ProductName,
                          maxLines: 1,
                          style: const TextStyle(
                            color: primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${widget.Price}DA',
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyButtonRow(
                              isPowder: widget.isPowder,
                              onToggle: () {
                                setState(() {
                                  widget.isPowder = !widget.isPowder;
                                  print('isPowder now is turned:${widget.isPowder}');
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const CardComponent(),
              ],
            ),
          )
        ],
      ),
    );
  }
}