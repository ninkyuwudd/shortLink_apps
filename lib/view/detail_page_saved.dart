import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortlink_apps/model/short_url_model.dart';
import 'package:shortlink_apps/provider/crudlink_provider.dart';
import 'package:shortlink_apps/provider/shortlink_provider.dart';
import 'package:shortlink_apps/widget/detail/link_detail.dart';
import 'package:shortlink_apps/widget/dialog/alert_dialog.dart';
import 'package:shortlink_apps/widget/dialog/alert_dialog_edit_title.dart';

class DetailShortlinkSaved extends StatefulWidget {
  const DetailShortlinkSaved({super.key});

  @override
  State<DetailShortlinkSaved> createState() => _DetailShortlinkSavedState();
}

class _DetailShortlinkSavedState extends State<DetailShortlinkSaved> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ShortlinkProvider>(context);
    var loadSqliteProvider = Provider.of<CrudListLink>(context);

    TextEditingController txt = TextEditingController();

    final Map<String, dynamic>? argument =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final int id = argument?['id'];
    String ttl = argument?['title'];
    final String date = argument?['date'];
    final String longUrl = argument?['longLink'];
    final String shortUrl = argument?['shortLink'];

    String oke = "nice";

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Saved Link Detail"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 2,
                          color: Colors.black12,
                          offset: Offset(1, 2))
                    ]),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          oke,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.calendar_month),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(date),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton.icon(
                        onPressed: () {
                          // untuk menampilkan popup edit title
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
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
                                            loadSqliteProvider.updateLink(
                                                DataLink(
                                                    id: id,
                                                    title: txt.text,
                                                    date: date,
                                                    shortUrl: shortUrl,
                                                    longUrl: longUrl),
                                                id);
                                            Navigator.pop(context);

                                            setState(() {
                                              ttl = txt.text;
                                              oke = txt.text;
                                            });
                                          },
                                          child: const Text("Edit"))
                                    ],
                                  ),
                                );
                              });
                        },
                        icon: const Icon(Icons.edit),
                        label: const Text("Edit"))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DetailLink(
                urlLink: longUrl,
                sortedLink: shortUrl,
              )
            ],
          ),
        ),
      ),
    );
  }
}
