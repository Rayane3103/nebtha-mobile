import 'package:flutter/material.dart';

class InstructionPage extends StatefulWidget {
  const InstructionPage({super.key});

  @override
  State<InstructionPage> createState() => _InstructionPageState();
}

class _InstructionPageState extends State<InstructionPage> {
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
      body: Center(child: Text('Instruction Page ')),
    );
  }
}
