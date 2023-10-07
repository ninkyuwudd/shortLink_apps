import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shortlink_apps/widget/detail/link_detail.dart';
import 'package:shortlink_apps/widget/result/result_widget.dart';

class TestDetail extends StatelessWidget {
  const TestDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LInk untuk ig komunitas",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(Icons.date_range),
                          SizedBox(
                            width: 5,
                          ),
                          Text(DateFormat.yMMMd().format(DateTime.now()))
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                      label: const Text("Edit"))
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5 - 120,
            ),
            Text(
              "Shorted Link",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                  fontSize: 17),
            ),
            SizedBox(
              height: 10,
            ),
            // DetailLink()
          ],
        ),
      ),
    );
  }
}
