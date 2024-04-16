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

class MyMainWidget extends StatefulWidget {
  const MyMainWidget({super.key});

  @override
  State<MyMainWidget> createState() => _MyMainWidgetState();
}

class _MyMainWidgetState extends State<MyMainWidget> {
  @override
  void initState() {
    super.initState();
  }

  final List _items = [
    const HomePage(),
    const PlantsPage(),
    const CartPage(),
  ];

  final List _icons = [
    Image.asset('assets/video.png'),
  ];

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
                                          onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const WelcomePage())),
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
                      CircleAvatar(
                        radius: 40,
                        child: ClipOval(child: Image.asset('assets/1.png')),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          'Exemple Of a Name',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      )
                    ],
                  )),
            ),
            ListTile(
                leading: const Icon(Icons.person_outline_rounded),
                title: const Text('Mon Profile'),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ProfilePage()))),
            ListTile(
                leading: const Icon(Icons.favorite_border),
                title: const Text('J\'aime'),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LikesPage()))),
            ListTile(
                leading: const Icon(Icons.history),
                title: const Text('Historique d\'achat'),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HistoryPage()))),
            ListTile(
                leading: const Icon(Icons.qr_code),
                title: const Text('Mode d\'utilisation'),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InstructionPage()))),
            ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Parametre'),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SettingsPage()))),
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
                  child: ClipOval(child: Image.asset('assets/11.png')),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('name of another profile'),
                    Text(
                      'membre de famille',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  child: ClipOval(child: Image.asset('assets/11.png')),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('name of another profile'),
                    Text(
                      'ami',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  child: ClipOval(child: Image.asset('assets/11.png')),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('name of another profile'),
                    Text(
                      'membre de famille',
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
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      iconTheme: const IconThemeData(color: primaryColor),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {});
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
