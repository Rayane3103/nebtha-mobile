
import 'package:flutter/material.dart';
import 'package:nebtha/Components/auth/customfield.dart';
import 'package:nebtha/Constants/design.dart';
import 'package:nebtha/Screens/Auth/signup_page2.dart';


class SignUp1 extends StatefulWidget {
  const SignUp1({super.key});

  @override
  State<SignUp1> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp1> {
      bool? throwShotAway=false;

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title:  const Row(
          children: [
            // Center(
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(15)),
            //     width: 48,
            //     height: 48,
            //     child: Center(child: IconButton(onPressed: (){
            //       Navigator.popAndPushNamed(context, '/');
            //     },iconSize: 30,color: primaryColor, icon: const Icon(Icons.chevron_left_rounded))),
            //   ),
            // ),
            Text('   Creér votre compte Nebtha', style: TextStyle(color: Colors.white),)
        
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
                        const CustomTextField(labelText: 'E-mail',keyboardType:TextInputType.emailAddress,),
                        const CustomTextField(labelText: 'Numero de téléphone',keyboardType: TextInputType.phone,),
                        const CustomTextField(labelText: 'Mot de pass',obscureText: true,keyboardType: TextInputType.text,),
                        const CustomTextField(labelText: 'Confirmer le mot de pass',obscureText: true,keyboardType: TextInputType.text,),
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
                         ),onPressed: (){Navigator.pushNamedAndRemoveUntil(context, '/signup2', (route) => false);}, child: const Text('Suivant',style: TextStyle(color: Colors.white),),)
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