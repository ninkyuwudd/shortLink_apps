import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortlink_apps/model/short_url_model.dart';
import 'package:shortlink_apps/provider/crudlink_provider.dart';
import 'package:shortlink_apps/provider/shortlink_provider.dart';
import 'package:shortlink_apps/widget/detail/link_detail.dart';
import 'package:shortlink_apps/widget/dialog/alert_dialog.dart';

class DetailShortlink extends StatefulWidget {
  const DetailShortlink({super.key});

  @override
  State<DetailShortlink> createState() => _DetailShortlinkState();
}

class _DetailShortlinkState extends State<DetailShortlink> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ShortlinkProvider>(context);
    var loadSqliteProvider = Provider.of<CrudListLink>(context);

    insertDataLink() {
      loadSqliteProvider.insertLink(DataLink(
          title: provider.TitleUrl,
          date: provider.dateUrl,
          shortUrl: provider.sortedUrl,
          longUrl: provider.originalUrl));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Link Detail"),
        actions: [
          TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => ShowDialogYesNo(
                        title: "Info",
                        content: "Are you sure to save this link ?",
                        fungsi: insertDataLink));
              },
              child: const Text(
                "Save",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
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
                        provider.TitleUrl,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(Icons.calendar_month),
                          SizedBox(
                            width: 15,
                          ),
                          Text(provider.dateUrl),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                      label: const Text("Edit"))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DetailLink(
              urlLink: provider.originalUrl,
              sortedLink: provider.sortedUrl,
            )
          ],
        ),
      ),
    );
  }
}
