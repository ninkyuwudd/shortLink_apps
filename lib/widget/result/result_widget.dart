import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortlink_apps/module/copy_text.dart';
import 'package:shortlink_apps/provider/shortlink_provider.dart';

class ResultWidget extends StatelessWidget {
  final String urlResult;
  const ResultWidget({super.key, required this.urlResult});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ShortlinkProvider>(context);
    final scaffold = ScaffoldMessenger.of(context);
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 2,
                  color: Colors.black12,
                  offset: Offset(1, 2))
            ]),
        padding: const EdgeInsets.only(top: 0, bottom: 20, left: 20, right: 20),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(provider.TitleUrl),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      urlResult,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          copyText(urlResult);
                          scaffold.showSnackBar(
                              const SnackBar(content: Text("coppied text")));
                        },
                        icon: const Icon(Icons.copy))
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.black38,
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/detail");
                  },
                  child: const Text("Detail")),
            )
          ],
        ));
  }
}
