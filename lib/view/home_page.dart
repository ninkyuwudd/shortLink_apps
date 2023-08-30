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
  TextEditingController urlTitle = TextEditingController();
  String? resLink;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ShortlinkProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 4 + 160,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          color: Colors.amber),
                    ),
                    Positioned(
                      top: 100,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(20),
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
                              controller: urlTitle,
                              decoration: InputDecoration(
                                  hintText: "Link Title",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.black38,
                                      ))),
                            ),
                            SizedBox(
                              height: 15,
                            ),
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
                                    resLink = await provider.shortenUrl(
                                        url: sortedUrl.text);
                                  },
                                  child: const Text("Short")),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ResultWidget(
                  result: resLink == null
                      ? "Empty Shorted URL"
                      : resLink.toString())
            ],
          ),
        ),
      ),
    );
  }
}
