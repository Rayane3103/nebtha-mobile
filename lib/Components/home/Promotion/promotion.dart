import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nebtha/Components/home/Promotion/codepromo.dart';
import 'package:nebtha/Components/home/Promotion/offres.dart';

class Promotions extends StatelessWidget {
  const Promotions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [const Row(
              children: [
                SizedBox(width: 17,),
                Text('Nouvelles Offres',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
            const Offres(),
            const Row(
              children: [
                SizedBox(width: 15,),
               
               
                
                Text('Code Promo',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              
              ],
            ),
           
            SizedBox(height: MediaQuery.of(context).size.height*0.0025,),
const CodePromos(),

],);
  }
}