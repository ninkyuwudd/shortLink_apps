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
                height: MediaQuery.of(context).size.height / 4 + 120,
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
                      top: 90,
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
                                  label: const Text("Title"),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.black38,
                                      ))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: sortedUrl,
                              decoration: InputDecoration(
                                  label: const Text("Original Link"),
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
                    Positioned(
                      top: 15,
                      left: 20,
                      right: 15,
                      child: Text(
                        "DISHORT",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Positioned(
                        top: 60,
                        left: 20,
                        child: Text(
                          "Make Your URL shorten or make QR code",
                          style: TextStyle(color: Colors.white),
                        )),
                    Positioned(
                      left: 20,
                      top: MediaQuery.of(context).size.height / 4 + 80,
                      child: Column(
                        children: [
                          Text(
                            "Linked URL",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black38),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: resLink == null
                    ? Center(child: Text("Empty Shorted URL"))
                    : ResultWidget(
                        result: resLink.toString(), linkTitle: urlTitle.text),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    sortedUrl.dispose();
    urlTitle.dispose();
  }
}
