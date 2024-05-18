import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nebtha/Components/customNavbar.dart';
import 'package:nebtha/Constants/design.dart';
import 'package:slide_to_act/slide_to_act.dart';

class MySlider2 extends StatefulWidget {
   final Map<String, dynamic> profileData;

  const MySlider2({super.key, required this.profileData});

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
            onSubmit: () {
           showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AlertDialog(
                    content: Text('Commande confirmée. Nous vous appellerons bientôt.'),
                  );
                },
              );
              
              // Close dialog after 3 seconds
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
              return null;
      }));
      },
    );
  }
}