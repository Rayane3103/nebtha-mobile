import 'package:flutter/material.dart';
import 'package:nebtha/Constants/design.dart';

class CardComponent extends StatefulWidget {
  const CardComponent({super.key});

  @override
  State<CardComponent> createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 23, 0, 30),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.25,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.grey[600],
                  ),
                ],
              ),
              const CustomRow(
                grammage: 500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRow extends StatefulWidget {
  const CustomRow({
    super.key,
    required this.grammage,
  });
  final int grammage;
  @override
  State<CustomRow> createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  late int a = widget.grammage;
  void _decrementation() {
    setState(() {
      if (a >= 100) {
        a = a - 100;
      } else {
        null;
      }
    });
  }

  void _incrementation() {
    setState(() {
      a = a + 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            onTap: () {
              _decrementation();
            },
            child: const Icon(Icons.remove)),
        Text('$a g'),
        InkWell(
            onTap: () {
              _incrementation();
            },
            child: const Icon(
              Icons.add_box_rounded,
              color: primaryColor,
            )),
      ],
    );
  }
}
