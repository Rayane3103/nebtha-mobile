import 'package:flutter/material.dart';
import 'package:nebtha/Constants/design.dart';

class MyButtonRow extends StatefulWidget {
  final bool isPowder;
  final VoidCallback onToggle;

  const MyButtonRow({
    Key? key,
    required this.isPowder,
    required this.onToggle,
  }) : super(key: key);

  @override
  _MyButtonRowState createState() => _MyButtonRowState();
}

class _MyButtonRowState extends State<MyButtonRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyButton(
          color: widget.isPowder ? Colors.white : primaryColor,
          textColor: widget.isPowder ? primaryColor : Colors.white,
          onPressed: widget.onToggle,
          myText: 'Solid',
        ),
        MyButton(
          color: widget.isPowder ? primaryColor : Colors.white,
          textColor: widget.isPowder ? Colors.white : primaryColor,
          onPressed: widget.onToggle,
          myText: 'Powder',
        ),
      ],
    );
  }
}

class MyButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;
  final String myText;

  const MyButton({
    super.key,
    required this.color,
    required this.textColor,
    required this.onPressed,
    required this.myText,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
      ),
      child: Text(
        myText,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
