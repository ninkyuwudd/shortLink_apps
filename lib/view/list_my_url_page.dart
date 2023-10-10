import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortlink_apps/model/short_url_model.dart';
import 'package:shortlink_apps/provider/crudlink_provider.dart';
import 'package:shortlink_apps/widget/dialog/alert_dialog.dart';
import 'package:shortlink_apps/widget/dialog/alert_dialog_params.dart';

class MyListUrl extends StatefulWidget {
  const MyListUrl({super.key});

  @override
  State<MyListUrl> createState() => _MyListUrlState();
}

class _MyListUrlState extends State<MyListUrl> {
  @override
  void initState() {
    // TODO: implement initState

    Provider.of<CrudListLink>(context, listen: false).refreshLink();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var loadProvider = Provider.of<CrudListLink>(context);
    var getLink = loadProvider.link;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Link"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: getLink.length,
            itemBuilder: (context, idx) {
              var getData = getLink[idx];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detailSaved', arguments: {
                    'id': getData.id,
                    'title': getData.title,
                    'date': getData.date,
                    'longLink': getData.longUrl,
                    'shortLink': getData.shortUrl
                  });
                },
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 2))
                  ]),
                  child: ListTile(
                    leading: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  ShowDialogYesNoParameter(
                                    title: "Warning !",
                                    content:
                                        "Are you sure to delete this link ?",
                                    fungsi: (params) {
                                      loadProvider.delete(int.parse(
                                          getLink[idx].id.toString()));
                                    },
                                    params: idx,
                                  ));
                        },
                        icon: const Icon(Icons.delete)),
                    title: Text(getLink[idx].title),
                    subtitle: Text(getLink[idx].shortUrl),
                    trailing: IconButton(
                        onPressed: () {
                          loadProvider.updateLink(
                              DataLink(
                                  id: getLink[idx].id,
                                  title: "title edited",
                                  date: "date edited",
                                  shortUrl: DateTime.now().toString(),
                                  longUrl: "link long edited"),
                              int.parse(getLink[idx].id.toString()));
                        },
                        icon: const Icon(Icons.edit)),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
