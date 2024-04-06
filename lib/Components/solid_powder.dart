import 'package:flutter/material.dart';
import 'package:nebtha/Constants/design.dart';

class MyButtonRow extends StatefulWidget {
  @override
  _MyButtonRowState createState() => _MyButtonRowState();
}

class _MyButtonRowState extends State<MyButtonRow> {
  bool _isRed = true; // color of solid button

  void _toggleColor() {
    setState(() {
      _isRed = !_isRed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyButton(
          color: _isRed ? Colors.white : primaryColor,
          textColor: _isRed ? primaryColor : Colors.white,
          onPressed: _toggleColor,
          myText: 'Solid',
        ),
        MyButton(
          color: _isRed ? primaryColor : Colors.white,
          textColor: _isRed ? Colors.white : primaryColor,
          onPressed: _toggleColor,
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
    Key? key,
    required this.color,
    required this.textColor,
    required this.onPressed,
    required this.myText,
  }) : super(key: key);

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
