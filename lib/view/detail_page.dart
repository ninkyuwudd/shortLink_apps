import 'package:flutter/material.dart';
import 'package:shortlink_apps/widget/detail/link_detail.dart';

class DetailShortlink extends StatefulWidget {
  const DetailShortlink({super.key});

  @override
  State<DetailShortlink> createState() => _DetailShortlinkState();
}

class _DetailShortlinkState extends State<DetailShortlink> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Link Detail"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
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
                        "TITLE",
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
                          Text(DateTime.now().toString()),
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
              height: MediaQuery.of(context).size.height / 7 - 120,
            ),
            DetailLink()
          ],
        ),
      ),
    );
  }
}
