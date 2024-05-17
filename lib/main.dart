import 'package:flutter/material.dart';
import 'package:nebtha/Screens/Auth/login_page.dart';
import 'package:nebtha/Screens/Auth/signup_page1.dart';
import 'package:nebtha/Screens/Auth/signup_page2.dart';
import 'package:nebtha/Components/customNavbar.dart';
import 'package:nebtha/Screens/Auth/signup_page3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
     
      initialRoute: '/', 
      routes: {
        '/': (context) => const LoginPage(),
        '/signup1': (context) => const SignUp1(),
        '/signup2': (context) => const SignUp2(password: '', email: '', phoneNumber: '',), 
        '/signup3': (context) => const SignUp3(password: '', email: '',height:'',weight:'', DateOfBirth: '', phoneNumber: '', fullname: '', relative: '', gender: '',),
        '/main': (context) => const MyMainWidget(profileData: {},),
      },
      
    );
  }
}
