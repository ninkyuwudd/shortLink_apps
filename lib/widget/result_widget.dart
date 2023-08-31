import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortlink_apps/provider/shortlink_provider.dart';
import 'package:shortlink_apps/view/detail_page.dart';
import 'package:shortlink_apps/view/test.dart';

class ResultWidget extends StatelessWidget {
  final String result;
  final String linkTitle;
  const ResultWidget(
      {super.key, required this.result, required this.linkTitle});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ShortlinkProvider>(context);
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 2,
                  color: Colors.black12,
                  offset: Offset(1, 2))
            ]),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(linkTitle),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      result,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Spacer(),
                    Icon(Icons.copy),
                  ],
                ),
              ],
            ),
            Divider(
              color: Colors.black38,
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const TestDetail())));
                  },
                  child: const Text("Detail")),
            )
          ],
        ));
  }
}
