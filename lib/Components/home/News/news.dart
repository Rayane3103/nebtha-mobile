import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nebtha/Components/home/News/alaune.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [Row(
              children: [
                SizedBox(width: 17,),
                Text('A la une',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
            LaUne(),
            Row(
              children: [
                SizedBox(width: 15,),
                Icon(Icons.volunteer_activism),
                SizedBox(width: 10,),
                
                Text('Conseille du jour',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 8,left:15.0,right: 15),
              child: Text(style: TextStyle(fontSize: 16),'assurez-vous de maintenir un équilibre sain entre votre vie personnelle et professionnelle. Prenez le temps de vous reposer suffisamment.'),
            )
],);
  }
}