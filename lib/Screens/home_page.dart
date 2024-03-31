import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nebtha/Components/pubfix.dart';
import 'package:nebtha/Constants/design.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            FixPub(),
            
          ],
        ),
      ),
    );
  }
}
