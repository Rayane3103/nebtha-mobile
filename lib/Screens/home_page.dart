import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:nebtha/Components/home/News/news.dart';
import 'package:nebtha/Components/home/pubfix.dart';
import 'package:nebtha/Components/home/tapy_icon.dart';
import 'package:nebtha/Components/home/Promotion/promotion.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int _selectedIndex =0;
   List<Widget> Taps=[
    const News(),
    const Promotions(),
    const Text('texxtttt'),
    
    const Text('texxtttt'),
    
    
   ];

   

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FixPub(),
            const SizedBox(height: 15,),
            
            Padding(
              padding: const EdgeInsets.only(left:30.0,right: 30),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                
                children: [
                TappyIcon(selectedIcon: Icons.notifications,icon: Icons.notifications_outlined, label: 'Nouvauté', onTap: (){updateIndex(0);}, isSelected: _selectedIndex==0, ),
                TappyIcon(selectedIcon: Icons.sell,icon: Icons.sell_outlined, label: 'Promotions', onTap: (){updateIndex(1);}, isSelected: _selectedIndex==1),
                TappyIcon(selectedIcon: Icons.article,icon: Icons.article_outlined, label: 'Articles', onTap: (){updateIndex(2);}, isSelected: _selectedIndex==2),
                TappyIcon(selectedIcon: Icons.spa,icon: Icons.spa_outlined, label: 'Produits', onTap: (){updateIndex(3);}, isSelected: _selectedIndex==3),
              ],),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Container(child:Taps[_selectedIndex])

            
          ],
        ),
      ),
    );
  }

  void updateIndex(index){
    setState(() {
      _selectedIndex=index;
    });
    }
}



