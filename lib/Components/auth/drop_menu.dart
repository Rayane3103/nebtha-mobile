import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nebtha/Constants/design.dart';

class Dropyy extends StatelessWidget {
  final List<String> dropItems;
  final String hintText;
  final void Function(String)? onChanged; // Callback function to handle onChanged event

  const Dropyy({super.key, required this.hintText, required this.dropItems, this.onChanged});

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
        items:  dropItems.map((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onChanged: (value) {
          onChanged?.call(value!); // Invoke the onChanged callback with the selected value
        },
        decoration: InputDecoration(
            contentPadding:  const EdgeInsets.all(10),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: const BorderSide(width: 2,color: primaryColor)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(width: 2)
            ),
          ),
      )
    ]);
  }
}