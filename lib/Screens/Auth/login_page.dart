import 'package:flutter/material.dart';
import 'package:nebtha/Components/auth/customfield.dart';
import 'package:nebtha/Constants/design.dart';

class LoginPage extends StatefulWidget {
  
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? throwShotAway=false;

  @override
  Widget build(BuildContext context) {
     return   Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title:  const Row(
          children: [
           
            Text('   Connecter votre compte Nebtha', style: TextStyle(color: Colors.white),)
        
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
                        const Center(child: Text('Sign In',style: TextStyle(decoration: TextDecoration.underline,decorationThickness: 1.5,decorationColor: primaryColor,color: primaryColor, fontSize:36,fontWeight: FontWeight.w400 ),)),
                        const SizedBox(height: 20,),

                        const CustomTextField(labelText: 'E-mail',keyboardType:TextInputType.emailAddress,),
                        const CustomTextField(labelText: 'Mot de pass',obscureText: true,keyboardType: TextInputType.text,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [Checkbox(
                              value: throwShotAway,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  throwShotAway = newValue!;
                                   });
                                     },
                                  ),
                                  const Text('Remember Me',),],),
                            
                                  TextButton(onPressed: (){}, child: const Text('Forgot Password?',style: TextStyle(color:primaryColor ),),), 
                                  
                          ],
                        ),
                        const SizedBox(height: 20,),
                         ElevatedButton(style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor
                         ),onPressed: (){Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);}, child: const Text('Se Connecter',style: TextStyle(color: Colors.white),),),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                          TextButton(onPressed: (){
                            Navigator.pushNamedAndRemoveUntil(context, '/signup1', (route) => false);
                          }, child: const Text("N'avez pas du compte? Inscrire!"))
                         ],)
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