import 'package:flutter/material.dart';
import 'package:nebtha/Constants/design.dart';

class PlantsPage extends StatelessWidget {
  const PlantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        
        width: MediaQuery.of(context).size.width*0.45,
        height: MediaQuery.of(context).size.width*0.8,
        decoration: BoxDecoration(color: Colors.white,
        
        borderRadius: BorderRadius.circular(22),
        boxShadow:const [BoxShadow(blurRadius: 4,
        color:Color.fromARGB(255, 122, 122, 122),
        offset: Offset(1, 1)
              ),
            ]
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: const Color.fromARGB(255, 198, 233, 203),        
                ),
              child: Image.asset("assets/11.png"),),
              const Padding(
                padding:  EdgeInsets.fromLTRB(12.0,5,0,0),
                child: Text('menthe',
                  style: TextStyle(color: primaryColor,
                  fontWeight: FontWeight.bold,                            
                            ),),
                      ),
            const Padding(
                padding:  EdgeInsets.fromLTRB(12.0,0,0,0),
                child: Text('menthe arabic',                   
                  style: TextStyle(color: primaryColor,                          
                            ),),),
            InkWell(
              
              onTap: (){print('akjhbfds');},
              child: Container(
                color: Colors.amber,
                height: MediaQuery.of(context).size.height*0.08,
                width: 190,
                child: const Padding(
                    padding:  EdgeInsets.fromLTRB(12.0,0,12,0),
                    child: Text('menthe arabic ............................................................... plus de detail',
                      textAlign: TextAlign.justify,                   
                      style: TextStyle(color: Colors.black,),
                                ),),
                ),
              ),
            Padding(
              padding: EdgeInsets.fromLTRB(12.0,0,12,0),
              child: Text('price'),
            ),
        ],),
      ),
    );
  }
}