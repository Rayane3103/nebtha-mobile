import 'package:flutter/material.dart';
import 'package:nebtha/Constants/design.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
 
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextField({super.key, 
   
    required this.labelText,
    required this.keyboardType,
   
    this.obscureText = false,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 10,),
            Text(labelText,style: const TextStyle(color: primaryColor),),
          ],
        ),
        const SizedBox(height: 2,),
        TextFormField(
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding:  const EdgeInsets.all(14),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: const BorderSide(width: 2,color: primaryColor)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(width: 2)
            ),
          ),
        ),
        const SizedBox(height: 10,)
      ],
    );
  }
}