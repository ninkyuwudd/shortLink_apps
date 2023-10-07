import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class DetailLink extends StatelessWidget {
  final String urlLink;
  final String sortedLink;
  const DetailLink(
      {super.key, required this.urlLink, required this.sortedLink});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(1, 2),
                color: Colors.black12)
          ]),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  sortedLink,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: IconButton(
                      color: Colors.white,
                      onPressed: () {},
                      icon: const Icon(Icons.copy)),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(Icons.subdirectory_arrow_right),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 160,
                  child: Text(urlLink),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "QR CODE",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            PrettyQr(
              image: AssetImage('images/ig.png'),
              data: sortedLink,
              errorCorrectLevel: QrErrorCorrectLevel.M,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Copy QR"))
          ],
        ),
      ),
    );
  }
}
