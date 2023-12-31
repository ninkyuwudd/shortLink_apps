import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shortlink_apps/provider/shortlink_provider.dart';
import 'package:shortlink_apps/widget/result/result_show.dart';
import 'package:shortlink_apps/widget/result/result_widget.dart';
import 'package:shortlink_apps/widget/text/body_title.dart';

class HomePageShortLink extends StatefulWidget {
  const HomePageShortLink({super.key});

  @override
  State<HomePageShortLink> createState() => _HomePageShortLinkState();
}

class _HomePageShortLinkState extends State<HomePageShortLink> {
  TextEditingController sortedUrl = TextEditingController();
  TextEditingController urlTitle = TextEditingController();

  bool validatedTitle = false;
  bool validatedLInk = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ShortlinkProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3 + 120,
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
                                    errorText: validatedTitle
                                        ? "Title Can't be empty"
                                        : null,
                                    hintText: "Link Title",
                                    label: const Text("Title"),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                          color: Colors.black38,
                                        ))),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: sortedUrl,
                                decoration: InputDecoration(
                                    errorText: validatedLInk
                                        ? "Link can't be empty"
                                        : null,
                                    label: const Text("Original Link"),
                                    hintText: "Insert your link",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                          color: Colors.black38,
                                        ))),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      setState(() {
                                        if (urlTitle.text.isEmpty) {
                                          validatedTitle = true;
                                        } else {
                                          validatedTitle = false;
                                        }

                                        if (sortedUrl.text.isEmpty) {
                                          validatedLInk = true;
                                        } else {
                                          validatedLInk = false;
                                        }
                                      });

                                      if (urlTitle.text.isNotEmpty &&
                                          sortedUrl.text.isNotEmpty) {
                                        provider.changeLoading(true);

                                        String? srt = await provider.shortenUrl(
                                            url: sortedUrl.text);

                                        String dateCreate = DateFormat.yMMMd()
                                            .format(DateTime.now());

                                        provider.getShortUrl(Future.value(srt));
                                        provider.getDataUrl(urlTitle.text,
                                            dateCreate, sortedUrl.text);

                                        provider.changeLoading(false);
                                      }
                                    },
                                    child: const Text("Short")),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
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
                      const Positioned(
                          top: 60,
                          left: 20,
                          child: Text(
                            "Make Your URL shorten or make QR code",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextBodyTitle(text: "Linked URL"),
                      const SizedBox(
                        height: 20,
                      ),
                      ResultShowWidget(),
                      SizedBox(
                        height: 15,
                      ),
                      const TextBodyTitle(text: "My Link"),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/myUrl");
                            },
                            child: const Text("All Saved URL")),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    sortedUrl.dispose();
    urlTitle.dispose();
  }
}
