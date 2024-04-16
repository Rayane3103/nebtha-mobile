import 'package:flutter/material.dart';

class Nocif extends StatefulWidget {
  const Nocif({super.key});

  @override
  State<Nocif> createState() => _NocifState();
}

class _NocifState extends State<Nocif> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.03,
      width: MediaQuery.of(context).size.width * 0.165,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
            child: Icon(
              Icons.circle,
              color: Colors.deepOrange.shade900,
              size: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
            child: Text(
              'nocif',
              style: TextStyle(color: Colors.deepOrange.shade900, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
