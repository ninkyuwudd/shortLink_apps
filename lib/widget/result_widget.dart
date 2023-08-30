import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortlink_apps/provider/shortlink_provider.dart';

class ResultWidget extends StatelessWidget {
  final String result;
  const ResultWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ShortlinkProvider>(context);
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            spreadRadius: 2,
            blurRadius: 2,
            color: Colors.black12,
            offset: Offset(1, 2))
      ]),
      padding: EdgeInsets.all(20),
      child: Row(
        children: [Text(result)],
      ),
    );
  }
}
