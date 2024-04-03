import 'package:flutter/material.dart';
import 'package:nebtha/Constants/design.dart';
import 'package:nebtha/Screens/cart_page.dart';
import 'package:nebtha/Screens/home_page.dart';
import 'package:nebtha/Screens/plantsPage.dart';

class MyMainWidget extends StatefulWidget {


   const MyMainWidget({super.key});

  @override
  State<MyMainWidget> createState() => _MyMainWidgetState();
}

class _MyMainWidgetState extends State<MyMainWidget> {
  @override
  void initState(){
    super.initState();
  }

 
final List _items = [
  const HomePage(),
  const PlantsPage(),
  const CartPage(),
  
  
];

void _onTappedItem(int index){
  setState(() {
    _selectedIndex=index;
  });
}

int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(backgroundColor: primaryColor,),
      appBar: const PreferredSize(preferredSize: Size.fromHeight(45), child: CustomAppBar()),
      body: _items[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:_selectedIndex,
        onTap: _onTappedItem,
        selectedItemColor: primaryColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: 'Acceuil'),
          BottomNavigationBarItem(icon: Icon(Icons.eco),label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_rounded),label: 'Panier'),
        ]
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      iconTheme: const IconThemeData(color: primaryColor),
        actions: [IconButton(onPressed: (){
          setState(() {
            
          });
        }, 
          icon: Image.asset('assets/video.png'),
          )],
        title: Center(
          child: SizedBox(
            width: 300,
            height: 48,
            child: Image.asset('assets/logo1.png'),
            ),
        ),);
  }
}