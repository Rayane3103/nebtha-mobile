import 'package:flutter/material.dart';

class MySplashScreen extends StatelessWidget {
  const MySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Image.asset('assets/logo1.png'),
                  ),
              
                const SizedBox(height: 70,)
              ],
            ),
    );
    
  }
}
