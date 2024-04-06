import 'package:flutter/material.dart';
import 'package:nebtha/Constants/design.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _isFavorited = false;
  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _toggleFavorite();
        print('liked');
      },
      child: (_isFavorited
          ? const Icon(
              Icons.favorite,
              color: primaryColor,
            )
          : const Icon(
              Icons.favorite_border,
              color: primaryColor,
            )),
    );
  }
}
