import 'package:flutter/material.dart';

class TextBodyTitle extends StatelessWidget {
  final String text;
  const TextBodyTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black38),
    );
  }
}
