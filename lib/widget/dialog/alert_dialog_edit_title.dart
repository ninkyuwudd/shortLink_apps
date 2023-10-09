import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortlink_apps/provider/shortlink_provider.dart';

class EditTItleDialog extends StatelessWidget {
  const EditTItleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController txt = TextEditingController();
    var provider = Provider.of<ShortlinkProvider>(context);
    return AlertDialog(
      title: const Text("Edit Title"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: txt,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                provider.editTitleOnly(txt.text);
                Navigator.pop(context);
              },
              child: const Text("Edit"))
        ],
      ),
    );
  }
}
