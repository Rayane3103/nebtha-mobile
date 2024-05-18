import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nebtha/Constants/design.dart';
import 'package:nebtha/Screens/cart_page.dart';
import 'package:nebtha/Screens/history_page.dart';
import 'package:nebtha/Screens/home_page.dart';
import 'package:nebtha/Screens/likes_page.dart';
import 'package:nebtha/Screens/mode_emploi.dart';
import 'package:nebtha/Screens/parametre.dart';
import 'package:nebtha/Screens/plantsPage.dart';
import 'package:nebtha/Screens/profile_page.dart';
import 'package:nebtha/Screens/welcome_page.dart';
import 'package:http/http.dart' as http;
import 'package:nebtha/Services/auth_account.dart';
import 'package:url_launcher/url_launcher.dart';


class MyMainWidget extends StatefulWidget {
  final Map<String, dynamic> profileData;
  const MyMainWidget({super.key, required this.profileData,});

  @override
  State<MyMainWidget> createState() => _MyMainWidgetState();
  
}

class _MyMainWidgetState extends State<MyMainWidget> {
  List<Map<String, dynamic>> selectedProducts = [];

  void updateSelectedProducts(List<Map<String, dynamic>> newSelectedProducts) {
    setState(() {
      selectedProducts = newSelectedProducts;
    });
print('Selected Product Names (Before Navigation): ${selectedProducts.map((product) => product['ProductName']).toList()}');
  _items[2] = CartPage(selectedProducts: selectedProducts,profileData: widget.profileData); // Update CartPage with new selectedProducts

  }

 

 late List<Widget> _items;
  late List<Widget> _icons;

  @override
  void initState() {
    print("my data: ${widget.profileData}");
    super.initState();
    _items = [
  const HomePage(),
  PlantsPage(
    profileData: widget.profileData,
    updateSelectedProducts: updateSelectedProducts,
  ),
  CartPage(selectedProducts: selectedProducts,profileData: widget.profileData,), // Pass selectedProducts
];


    _icons = [
      Image.asset('assets/video.png'),
    ];
  }

  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: DrawerHeader(
                  decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      title: const Text(
                                        'log out ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: const Center(
                                            child: Text(
                                          'êtes-vous sûr ?',
                                          style: TextStyle(fontSize: 20),
                                        )),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Annuler'),
                                          child: const Text('Annuler'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false)   ;                                    },
                                          child: const Text('Oui'),
                                        ),
                                      ]);
                                },
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                      Image.asset(
    'assets/profileimg.png',
    height: MediaQuery.of(context).size.height*0.12,
    width: MediaQuery.of(context).size.height*0.12,
  ),

                        Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
widget.profileData['fullname'],                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      )
                    ],
                  )),
            ),
            const ListTile(
                leading: Icon(Icons.person_outline_rounded),
                title: Text('Mon Profile'),
                ),
            const ListTile(
                leading: Icon(Icons.favorite_border),
                title: Text('J\'aime'),
                ),
            const ListTile(
                leading: Icon(Icons.history),
                title: Text('Historique d\'achat'),
                ),
            const ListTile(
                leading: Icon(Icons.qr_code),
                title: Text('Mode d\'utilisation'),
                ),
            const ListTile(
                leading: Icon(Icons.settings),
                title: Text('Parametre'),
               ),
            Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.grey[700],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  child: ClipOval(child: Image.asset('assets/profileimg.png')),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(widget.profileData['fullname']),
                    Text(
                      'Me',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    )
                  ],
                ),
              ),
            ),
           
          ],
        ),
      ),
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(45), child: CustomAppBar()),
      body: _items[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onTappedItem,
          selectedItemColor: primaryColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Acceuil'),
            BottomNavigationBarItem(icon: Icon(Icons.eco), label: 'Shop'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_rounded), label: 'Panier'),
          ]),
    );
  }
}

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      iconTheme: const IconThemeData(color: primaryColor),
      actions: [
        IconButton(
          onPressed: () {
              _launchURL('https://www.youtube.com/@FytaPharm');
            },
          icon: Image.asset('assets/video.png'),
        )
      ],
      title: Center(
        child: SizedBox(
          width: 300,
          height: 48,
          child: Image.asset('assets/logo1.png'),
        ),
      ),
    );
  }
}
