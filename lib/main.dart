import 'package:flutter/material.dart';
import 'package:nebtha/Components/customNavbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        body: MyMainWidget(),
        
        ),);
  }
}


//I'm just trying to pull from anopther pc