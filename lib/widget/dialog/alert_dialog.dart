import 'package:flutter/material.dart';

class ShowDialogYesNo extends StatelessWidget {
  final String title;
  final String content;
  final Function fungsi;
  const ShowDialogYesNo(
      {super.key,
      required this.title,
      required this.content,
      required this.fungsi});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("No")),
        ElevatedButton(
            onPressed: () {
              fungsi();
              Navigator.pop(context);
            },
            child: const Text("Yes"))
      ],
    );
  }
}
