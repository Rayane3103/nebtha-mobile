import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nebtha/Constants/design.dart';

class TappyIcon extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final VoidCallback onTap;
  final bool isSelected;

  const TappyIcon({super.key, required this.icon, required this.label, required this.onTap, required this.isSelected, required this.selectedIcon});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child:Column(children: [
               SizedBox(
          width: MediaQuery.of(context).size.width*0.08,
          height: MediaQuery.of(context).size.width*0.08,
          child: Icon(isSelected? selectedIcon: icon,size: 30,color: primaryColor,),
        ),
              
              Text(label,style: TextStyle(color: isSelected? primaryColor: Colors.black,),)
            ],));
  }
}