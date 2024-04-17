
import 'package:flutter/material.dart';
import 'package:nebtha/Components/auth/customfield.dart';
import 'package:nebtha/Components/auth/date_picker.dart';
import 'package:nebtha/Components/auth/drop_menu.dart';
import 'package:nebtha/Constants/constants.dart';
import 'package:nebtha/Constants/design.dart';


class SignUp2 extends StatefulWidget {
  const SignUp2({super.key});

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
      bool? throwShotAway=false;

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title:  Row(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
                width: 48,
                height: 48,
                child: Center(child: IconButton(onPressed: (){
                  Navigator.popAndPushNamed(context, '/');
                },iconSize: 30,color: primaryColor, icon: const Icon(Icons.chevron_left_rounded))),
              ),
            ),
            const Text('   Creér votre compte Nebtha', style: TextStyle(color: Colors.white),)
        
          ],
        ),
        ),
      body: 
        
          Stack(
            children: [
              Container(
              height: 160,
              decoration: const BoxDecoration(
              color: primaryColor,
              
              borderRadius: BorderRadius.only(
                bottomLeft:Radius.circular(40),
                bottomRight: Radius.circular(40),
                )
            ),
                
              ),
              
             Center(
              child: Padding(
                padding: const EdgeInsets.all(26.0),
                child: ListView(
                  children: [
                    const SizedBox(height: 20,),
                    Container(decoration:  BoxDecoration(
                      color: Colors.white,
                      
                      borderRadius: BorderRadius.circular(26),
                      boxShadow: const [BoxShadow(blurRadius:1 )]
                    ),
                    width: 360,
                    height: 580,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView(children: [
                        const SizedBox(height: 20,),
                        const CustomTextField(labelText: 'FullName',keyboardType:TextInputType.text,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              Flexible(
                              flex: 1,
                              child: SizedBox(width: 160,child: Dropyy(hintText: 'Relative', dropItems: droppyItems1)),
                              ),
                              Flexible(
                              flex: 1,
                              child: SizedBox(width: 160,child: Dropyy(hintText: 'Gender', dropItems: droppyItems2)),
                              ),],
                        ),
                        const DatePickerr(),
                        const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              Flexible(
                              flex: 1,
                              child: SizedBox(width: 160,child: CustomTextField(labelText: 'Height (cm)', keyboardType: TextInputType.number)),
                              ),
                              Flexible(
                              flex: 1,
                              child: SizedBox(width: 160,child: CustomTextField(labelText: 'Weight (Kg)', keyboardType: TextInputType.number)),
                              ),],
                        ),
                         
                        Row(
                          children: [
                            Checkbox(
                              value: throwShotAway,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  throwShotAway = newValue!;
                                   });
                                     },
                                  ),
                                  const Text('Accepter tout les termes et les',),
                                  TextButton(onPressed: (){}, child: const Text('conditions',style: TextStyle(color:primaryColor ),),), 
                                  
                          ],
                        ),
                        const SizedBox(height: 20,),
                         ElevatedButton(style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor
                         ),onPressed: (){
                          Navigator.pushNamedAndRemoveUntil(context, '/signup3', (route) => false);
                         }, child: const Text('Suivant',style: TextStyle(color: Colors.white),),)
                      ],),
                    ),),
                    
                  ],
                ),
              ),
              
            ),
            
            
            ]
          ),
          
          
      
      
        
        
    );
  }
}