import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortlink_apps/provider/shortlink_provider.dart';
import 'package:shortlink_apps/widget/loading_widget.dart';
import 'package:shortlink_apps/widget/result_widget.dart';

class HomePageShortLink extends StatefulWidget {
  const HomePageShortLink({super.key});

  @override
  State<HomePageShortLink> createState() => _HomePageShortLinkState();
}

class _HomePageShortLinkState extends State<HomePageShortLink> {
  TextEditingController sortedUrl = TextEditingController();
  TextEditingController urlTitle = TextEditingController();

  Future<String>? _shortenUrlFuture;

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
                                      provider.changeLoading(true);

                                      String? srt = await provider.shortenUrl(
                                          url: sortedUrl.text);

                                      _shortenUrlFuture = Future.value(srt);

                                      provider.changeLoading(false);
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
                      const Text(
                        "Linked URL",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black38),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FutureBuilder(
                          future: _shortenUrlFuture,
                          builder: (context, snaps) {
                            if (provider.isloading) {
                              return const CircularProgressIndicator();
                            } else if (snaps.hasData) {
                              return ResultWidget(
                                urlResult: snaps.data.toString(),
                              );
                            } else {
                              return const Text("Insert URL");
                            }
                          })
                    ],
                  ),
                ),

                //
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
