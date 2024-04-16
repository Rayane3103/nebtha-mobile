import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
      body: const Center(child: Text('history Page ')),
    );
  }
}
