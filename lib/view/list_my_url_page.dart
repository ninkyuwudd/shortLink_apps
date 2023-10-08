import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortlink_apps/model/short_url_model.dart';
import 'package:shortlink_apps/provider/crudlink_provider.dart';

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
              return GestureDetector(
                onTap: () {},
                child: ListTile(
                  leading: IconButton(
                      onPressed: () {
                        loadProvider
                            .delete(int.parse(getLink[idx].id.toString()));
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
              );
            }),
      ),
    );
  }
}
