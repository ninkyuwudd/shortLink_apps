import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortlink_apps/provider/shortlink_provider.dart';
import 'package:shortlink_apps/widget/result_widget.dart';

class HomePageShortLink extends StatefulWidget {
  const HomePageShortLink({super.key});

  @override
  State<HomePageShortLink> createState() => _HomePageShortLinkState();
}

class _HomePageShortLinkState extends State<HomePageShortLink> {
  TextEditingController sortedUrl = TextEditingController();
  String? resLink;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ShortlinkProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        color: Colors.black12,
                        blurRadius: 2,
                        offset: Offset(2, 2))
                  ]),
              child: Column(
                children: [
                  TextField(
                    controller: sortedUrl,
                    decoration: InputDecoration(
                        hintText: "Insert your link",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.black38,
                            ))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                        onPressed: () async {
                          resLink =
                              await provider.shortenUrl(url: sortedUrl.text);
                        },
                        child: const Text("Short")),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
            ),
            ResultWidget(
                result:
                    resLink == null ? "Empty Shorted URL" : resLink.toString())
          ],
        ),
      ),
    );
  }
}
