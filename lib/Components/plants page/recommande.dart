import 'package:flutter/material.dart';

class Recommandation extends StatefulWidget {
  const Recommandation({super.key});

  @override
  State<Recommandation> createState() => _RecommandationState();
}

class _RecommandationState extends State<Recommandation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.03,
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
            child: Icon(
              Icons.circle,
              color: Color.fromARGB(255, 0, 146, 49),
              size: 15,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 7, 0),
            child: Text(
              'recommandé',
              style: TextStyle(color: Color.fromARGB(255, 0, 146, 49), fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
