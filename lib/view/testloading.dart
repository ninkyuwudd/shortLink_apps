import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortlink_apps/provider/shortlink_provider.dart';

import '../widget/result/result_widget.dart';

class TestLoaading extends StatefulWidget {
  const TestLoaading({super.key});

  @override
  State<TestLoaading> createState() => _TestLoaadingState();
}

class _TestLoaadingState extends State<TestLoaading> {
  TextEditingController link = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var getProvider = Provider.of<ShortlinkProvider>(context);
    var provider = Provider.of<ShortlinkProvider>(context);
    var url =
        "https://github.com/ninkyuwudd/shortLink_apps/blob/main/lib/view/home_page.dart";

    return SafeArea(
      child: Scaffold(
          body: Center(
              child: Column(
        children: [
          TextField(
            controller: link,
          ),
          ElevatedButton(
              onPressed: () async {
                print("nice");

                getProvider.changeLoading(true);

                await getProvider.shortenUrl(url: link.text);

                getProvider.changeLoading(false);
              },
              child: const Text("nice")),
          FutureBuilder(
              future: getProvider.shortenUrl(url: link.text),
              builder: (context, snaps) {
                if (getProvider.isloading) {
                  return CircularProgressIndicator();
                } else if (snaps.hasData) {
                  return ResultWidget(
                    urlResult: snaps.data.toString(),
                  );
                } else {
                  return Text("insert your url");
                }
              })
        ],
      ))),
    );
  }
}
