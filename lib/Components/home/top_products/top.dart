import 'package:flutter/material.dart';
import 'package:nebtha/Components/home/top_products/top_products.dart';

class TOPP extends StatelessWidget {
  const TOPP({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [const Row(
              children: [
                SizedBox(width: 17,),
                Text('Top Products',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
            Top(),
            Top(),
            


],);
  }
}