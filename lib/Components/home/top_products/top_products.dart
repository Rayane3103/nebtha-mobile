import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nebtha/Constants/design.dart';

// ignore: must_be_immutable
class Top extends StatelessWidget {
   Top({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0,bottom: 10),
      child: SizedBox(
        height: 180,       
        child:  ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  int randomIndex = Random().nextInt(images.length);
                  return Padding(
                    padding: const EdgeInsets.only(left:8.0, right: 8.0),
                    child: Container(
                              height: MediaQuery.of(context).size.width * 0.5,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                              
                  color: const Color.fromARGB(255, 241, 241, 241),
                  borderRadius: BorderRadius.circular(10),
                  
                ),
                              child:Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(images[randomIndex]),
                                    const Row(
                                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                      children: [
                                      Text('Camomile',style: TextStyle(color: primaryColor),),
                                      Text('14.2k',style: TextStyle(color: primaryColor),)
                                    ],)
                                  ],
                                ),
                              )),
                  );
                },
              
        ),
      ),
    );
  }

List images = [
  'assets/11.png',
  'assets/22.png',
  'assets/33.png',
  'assets/44.png',
  'assets/55.png',
  'assets/66.png',
];

}

