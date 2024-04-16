import 'package:flutter/material.dart';

class RowOfTwo extends StatefulWidget {
  final Widget w1;
  final Widget w2;
  const RowOfTwo({super.key, required this.w1, required this.w2, });
  @override
  State<RowOfTwo> createState() => _RowOfTwoState();
}

class _RowOfTwoState extends State<RowOfTwo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.w1,
        widget.w2,
      ],
    );
  }
}
