import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nebtha/Constants/design.dart';

class Dropyy extends StatelessWidget {
  final List<String> dropItems;
  final String hintText;
  const Dropyy({super.key,  required this.hintText,required this.dropItems});

  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      Row(
          children: [
            const SizedBox(width: 7,),
            Text(hintText,style: const TextStyle(color: primaryColor),),
          ],
        ),
      const SizedBox(height: 2,),
      DropdownButtonFormField<String>(
        items:  dropItems.map((String value){
          return DropdownMenuItem<String>(value: value,child:Text(value) ,);}).toList(),
        
        onChanged: (value) {
          print('the new value is $value');
        },
        decoration: InputDecoration(
            contentPadding:  const EdgeInsets.all(14),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: const BorderSide(width: 2,color: primaryColor)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(width: 2)
            ),
          ),)
    ],);
  }
}