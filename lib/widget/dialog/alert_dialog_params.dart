import 'package:flutter/material.dart';

class ShowDialogYesNoParameter extends StatelessWidget {
  final String title;
  final String content;
  final Function(dynamic) fungsi;
  final dynamic params;
  const ShowDialogYesNoParameter(
      {super.key,
      required this.title,
      required this.content,
      required this.fungsi,
      this.params});

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
              fungsi(params);
              Navigator.pop(context);
            },
            child: const Text("Yes"))
      ],
    );
  }
}
