import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.215),
            Image.asset(
              'assets/logo1.png',
              scale: 2.5,
            ),
          ],
        ),
      ),
      body: Center(child: Text('Settings  Page ')),
    );
  }
}
