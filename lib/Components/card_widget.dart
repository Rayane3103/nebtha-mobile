import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nebtha/Components/card_component.dart';
import 'package:nebtha/Components/solid_powder.dart';
import 'package:nebtha/Constants/design.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key, required this.prix});
  final int prix;
  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 0, 8),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.grey.shade600,
            ))),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              children: [
                Image.asset(
                  'assets/11.png',
                  width: 100,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.37,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Menth',
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                         Text(
                          '${widget.prix}DA',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyButtonRow(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                CardComponent(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
