import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nebtha/Components/home/News/alaune.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [const Row(
              children: [
                SizedBox(width: 17,),
                Text('A la une',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
            const SizedBox(height: 15,),
            const LaUne(),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            const Row(
              children: [
                SizedBox(width: 15,),
                Icon(Icons.volunteer_activism),
                SizedBox(width: 10,),
                
                Text('Conseille du jour',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(style: TextStyle(fontSize: 16),'assurez-vous de maintenir un équilibre sain entre votre vie personnelle et professionnelle. Prenez le temps de vous reposer suffisamment.'),
            )
],);
  }
}