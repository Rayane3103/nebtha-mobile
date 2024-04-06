import 'package:flutter/material.dart';
import 'package:nebtha/Constants/design.dart';
import 'package:slide_to_act/slide_to_act.dart';

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final GlobalKey<SlideActionState> _key = GlobalKey();
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
          child: SlideAction(
            animationDuration: const Duration(milliseconds: 400),
            sliderButtonIconPadding: 8.0,
            textStyle:const  TextStyle(
                fontWeight: FontWeight.w400, color: Colors.white, fontSize: 20),
            height: 50,
            outerColor: primaryColor,
            sliderButtonIcon: const Icon(
              Icons.shopping_bag_outlined,
              color: primaryColor,
            ),
            sliderRotate: false,
            text: '       confirmer votre panier',
            key: _key,
            onSubmit: () {},
          ),
        );
      },
    );
  }
}
