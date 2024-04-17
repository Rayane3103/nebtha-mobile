import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nebtha/Constants/design.dart';


class DatePickerr extends StatefulWidget {
  const DatePickerr({super.key});

  @override
  State<DatePickerr> createState() => _DatePickerrState();
}

class _DatePickerrState extends State<DatePickerr> {
  late TextEditingController dateController;
  DateTime? selectedDate;
  Future <void>
  selectDate(BuildContext context)async{
    final DateTime? picked = await showDatePicker(
      context: context,
        builder:(BuildContext context, Widget? child) {
          return Theme(data: ThemeData.light().copyWith(colorScheme: const ColorScheme.light(primary: primaryColor)), child: child!);
        },
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        initialDate: selectedDate?? DateTime.now());
        if (picked != null) {
          setState(() {
            selectedDate = picked;
            dateController.text = '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}';
          });
        }
  }
  @override void initState() {
    
    super.initState();
    dateController= TextEditingController();
  }
  @override
  void dispose(){
    dateController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            SizedBox(width: 7,),
            Text('Date of Birth',style: TextStyle(color: primaryColor),),
          ],
        ),
        const SizedBox(height: 2,),
        GestureDetector(
          onTap: (){
            selectDate(context);
          },
          child: AbsorbPointer(
            child:TextFormField(
              cursorColor: primaryColor,
              controller: dateController,
              decoration: InputDecoration(
                
                suffixIcon: const Icon(Icons.calendar_month),
                contentPadding:  const EdgeInsets.all(14),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: const BorderSide(width: 2,color: primaryColor)),
                border: OutlineInputBorder(
                  
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(width: 2)
                ),
              ),
              
            ),
          ),
        ),
        const SizedBox(height: 10,)
      ],
    );
  }

  
}